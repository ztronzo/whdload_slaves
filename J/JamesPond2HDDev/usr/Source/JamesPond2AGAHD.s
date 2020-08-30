;*---------------------------------------------------------------------------
;  :Program.	RobocodHD.asm
;  :Contents.	Slave for "Robocod"
;  :Author.	JOTD, from Wepl sources
;  :Original	v1 
;  :Version.	$Id: RobocodHD.asm 1.2 2002/02/08 01:18:39 wepl Exp wepl $
;  :History.	%DATE% started
;  :Requires.	-
;  :Copyright.	Public Domain
;  :Language.	68000 Assembler
;  :Translator.	Devpac 3.14, Barfly 2.9
;  :To Do.
;---------------------------------------------------------------------------*

	INCDIR	Include:
	INCLUDE	whdload.i
	INCLUDE	whdmacros.i
	INCLUDE	lvo/dos.i

	IFD BARFLY
	OUTPUT	"JamesPond2CD32.slave"
	BOPT	O+				;enable optimizing
	BOPT	OG+				;enable optimizing
	BOPT	ODd-				;disable mul optimizing
	BOPT	ODe-				;disable mul optimizing
	BOPT	w4-				;disable 64k warnings
	BOPT	wo-			;disable optimizer warnings
	SUPER
	ENDC

;============================================================================

CHIPMEMSIZE	= $1FF000

FASTMEMSIZE	= $100000
NUMDRIVES	= 1
WPDRIVES	= %0000

;DISKSONBOOT
;DOSASSIGN
BOOTDOS
;DEBUG
INITAGA
HDINIT
;HRTMON
;CACHE
IOCACHE		= 10000
;MEMFREE	= $200
;NEEDFPU
SETPATCH
BLACKSCREEN
FORCEPAL


;============================================================================

slv_Version	= 17
slv_Flags	= WHDLF_NoError|WHDLF_Examine
slv_keyexit	= $5D	; num '*'

	INCLUDE	kick31cd32.s

;============================================================================

	IFD BARFLY
	DOSCMD	"WDate  >T:date"
	ENDC

DECL_VERSION:MACRO
	dc.b	"2.0"
	IFD BARFLY
		dc.b	" "
		INCBIN	"T:date"
	ENDC
	IFD	DATETIME
		dc.b	" "
		incbin	datetime
	ENDC
	ENDM

slv_name		dc.b	"James Pond 2 - Robocod AGA",0
slv_copy		dc.b	"1992 Millenium",0
slv_info		dc.b	"adapted by CFou! & JOTD",10,10
		dc.b	"Version "
	DECL_VERSION
		dc.b	0
slv_CurrentDir:
	dc.b	"data",0
slv_config:
		dc.b	0

_main:
	dc.b	"robocod",0
_args		dc.b	10
_args_end
	dc.b	0
	EVEN


_bootdos
	move.l	(_resload,pc),a2		;A2 = resload


	;open doslib
		lea	(_dosname,pc),a1
		move.l	(4),a6
		jsr	(_LVOOldOpenLibrary,a6)
		move.l	d0,a6			;A6 = dosbase

	bsr	_patch_cd32_libs
	
	;load & execute main
		lea	_main(pc),a0
		lea	_args(pc),a1
		lea	_patch_exe(pc),a5
		moveq	#_args_end-_args,d0
		bsr	_load_exe

_quit		pea	TDREASON_OK
		move.l	(_resload,pc),a2
		jmp	(resload_Abort,a2)

; < d7: seglist

_patch_exe:
		move.l	d7,a1
		addq.l	#4,a1
		
		lea	pl_main(pc),a0
		move.l	_resload(pc),a2
		jsr	resload_Patch(a2)
        rts
		
pl_main
	PL_START
	PL_W	$18318,$603E          ; remove protection
	PL_NOP	$18318+$44,2			; ??
	
	PL_W	$1E556-$61D0,$7201	; D1 <- 1
	PL_S	$1E558-$61D0,$D6-$58	; "press return"
	PL_END
		
; < a0: program name
; < a1: arguments
; < d0: argument string length
; < a5: patch routine (0 if no patch routine)

_load_exe:
	movem.l	d0-a6,-(a7)
	move.l	d0,d2
	move.l	a0,a3
	move.l	a1,a4
	move.l	a0,d1
	jsr	(_LVOLoadSeg,a6)
	move.l	d0,d7			;D7 = segment
	beq	.end			;file not found
	;patch here
	movem.l	d7,-(a7)
	add.l	d7,d7
	add.l	d7,d7
	move.l	d7,a1
	cmp.l	#0,a5
	beq.b	.skip
	movem.l	d0-d6/a1-a6,-(a7)
	jsr	(a5)
	movem.l	(a7)+,d0-d6/a1-a6
.skip
	movem.l	(a7)+,d7
	;call

	move.l	a4,a0
	move.l	($44,a7),d0		;stacksize
	sub.l	#5*4,d0			;required for MANX stack check
	movem.l	d0/d7/a2/a6,-(a7)
	move.l	d2,d0			; argument string length
	jsr	(4,a1)
	movem.l	(a7)+,d1/d7/a2/a6

	;remove exe
	move.l	d7,d1
	jsr	(_LVOUnLoadSeg,a6)

	movem.l	(a7)+,d0-a6
	rts

.end
	jsr	(_LVOIoErr,a6)
	move.l	a3,-(a7)
	move.l	d0,-(a7)
	pea	TDREASON_DOSREAD
	move.l	(_resload,pc),-(a7)
	add.l	#resload_Abort,(a7)
	rts

