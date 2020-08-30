
		; Speedball imager (Barfly assembler source)
		;
		; Written by JOTD
		;
		; Sector format description:
		;

		incdir	Include:
		include	RawDIC.i

		OUTPUT	"Speedball.islave"

		IFND	.passchk
		DOSCMD	"WDate  >T:date"
.passchk
		ENDC

TRACK_LENGTH = $1740
		SLAVE_HEADER
		dc.b	1	; Slave version
		dc.b	0       ; Slave flags
		dc.l	DSK_1	; Pointer to the first disk structure
		dc.l	Text	; Pointer to the text displayed in the imager window

		dc.b	"$VER:"
Text		dc.b	"Speedball imager V1.0",10
		dc.b	"by JOTD on "
		INCBIN	"T:date"
		dc.b	0
		cnop	0,4

DSK_1		dc.l	0		; Pointer to next disk structure
		dc.w	1		; Disk structure version
		dc.w	DFLG_NORESTRICTIONS	; Disk flags
		dc.l	TL_1a		; List of tracks which contain data
		dc.l	0		; UNUSED, ALWAYS SET TO 0!
		dc.l	0		; List of files to be saved
		dc.l	CRCTABLE	; Table of certain tracks with CRC values
		dc.l	DSK_2		; Alternative disk structure, if CRC failed
		dc.l	0		; Called before a disk is read
		dc.l	0		; Called after a disk has been read

DSK_2		dc.l	0		; Pointer to next disk structure
		dc.w	1		; Disk structure version
		dc.w	DFLG_NORESTRICTIONS	; Disk flags
		dc.l	TL_1b		; List of tracks which contain data
		dc.l	0		; UNUSED, ALWAYS SET TO 0!
		dc.l	0		; List of files to be saved
		dc.l	0		; Table of certain tracks with CRC values
		dc.l	0		; Alternative disk structure, if CRC failed
		dc.l	0		; Called before a disk is read
		dc.l	0		; Called after a disk has been read

DEFTRACK:MACRO
	TLENTRY	\1,\1,TRACK_LENGTH,SYNC_STD,_DMFM_SB
	ENDM

CRCTABLE
	CRCENTRY	5,$DBCE
	CRCEND

TL_1a
	DEFTRACK	3
	DEFTRACK	2
	DEFTRACK	5
	DEFTRACK	4
	DEFTRACK	7
	DEFTRACK	6
	DEFTRACK	9
	DEFTRACK	8
	DEFTRACK	11
	DEFTRACK	10
	DEFTRACK	13
	DEFTRACK	12
	DEFTRACK	15
	DEFTRACK	14
	DEFTRACK	17
	DEFTRACK	16
	DEFTRACK	19
	DEFTRACK	18
	DEFTRACK	21
	DEFTRACK	20
	DEFTRACK	23
	DEFTRACK	22
	DEFTRACK	25
	DEFTRACK	24
	DEFTRACK	27
	DEFTRACK	26
	DEFTRACK	29
	DEFTRACK	28
	DEFTRACK	31
	DEFTRACK	30
	DEFTRACK	33
	DEFTRACK	32
	DEFTRACK	35
	DEFTRACK	34
	DEFTRACK	37
	DEFTRACK	36
	DEFTRACK	39
	DEFTRACK	38
	DEFTRACK	41
	DEFTRACK	40
	DEFTRACK	43
	DEFTRACK	42
	DEFTRACK	45
	DEFTRACK	44
	DEFTRACK	47
	DEFTRACK	46
	DEFTRACK	49
	DEFTRACK	48
	DEFTRACK	51
	DEFTRACK	50
	DEFTRACK	53
	DEFTRACK	52
	DEFTRACK	55
	DEFTRACK	54
	DEFTRACK	57
	DEFTRACK	56
	DEFTRACK	59
	DEFTRACK	58
	DEFTRACK	61
	DEFTRACK	60
	DEFTRACK	63
	DEFTRACK	62
	DEFTRACK	65
	DEFTRACK	64
	DEFTRACK	67
	DEFTRACK	66
	DEFTRACK	69
	DEFTRACK	68
	DEFTRACK	71
	DEFTRACK	70
	DEFTRACK	73
	DEFTRACK	72
	DEFTRACK	75
	DEFTRACK	74
	DEFTRACK	77
	DEFTRACK	76
	DEFTRACK	79
	DEFTRACK	78
	DEFTRACK	81
	DEFTRACK	80
	DEFTRACK	83
	DEFTRACK	82
	DEFTRACK	85
	DEFTRACK	84
	DEFTRACK	87
	DEFTRACK	86
	DEFTRACK	89
	DEFTRACK	88
	DEFTRACK	91
	DEFTRACK	90
	DEFTRACK	93
	DEFTRACK	92
	DEFTRACK	95
	DEFTRACK	94
	DEFTRACK	97
	DEFTRACK	96
	DEFTRACK	99
	DEFTRACK	98
	DEFTRACK	101
	DEFTRACK	100
	DEFTRACK	103
	DEFTRACK	102
	DEFTRACK	105
	DEFTRACK	104
	DEFTRACK	107
	DEFTRACK	106
	DEFTRACK	109
	DEFTRACK	108
	DEFTRACK	111
	DEFTRACK	110
	DEFTRACK	113
	DEFTRACK	112
	DEFTRACK	115
	DEFTRACK	114
	DEFTRACK	117
	DEFTRACK	116
	DEFTRACK	119
	DEFTRACK	118
	DEFTRACK	121
	DEFTRACK	120
	DEFTRACK	123
	DEFTRACK	122
	DEFTRACK	125
	DEFTRACK	124
	DEFTRACK	127
	DEFTRACK	126
	DEFTRACK	129
	DEFTRACK	128
	DEFTRACK	131
	DEFTRACK	130
	DEFTRACK	133
	DEFTRACK	132
	DEFTRACK	135
	DEFTRACK	134
	DEFTRACK	137
	DEFTRACK	136
	DEFTRACK	139
	DEFTRACK	138
	DEFTRACK	141
	DEFTRACK	140
	DEFTRACK	143
	DEFTRACK	142
	DEFTRACK	145
	DEFTRACK	144
	DEFTRACK	147
	DEFTRACK	146
	DEFTRACK	149
	DEFTRACK	148
	DEFTRACK	151
	DEFTRACK	150
	DEFTRACK	153
	DEFTRACK	152
	DEFTRACK	155
	DEFTRACK	154
	DEFTRACK	157
	DEFTRACK	156
	DEFTRACK	159
	DEFTRACK	158
	TLEND

TL_1b
	DEFTRACK	3
	DEFTRACK	2
	DEFTRACK	5
	DEFTRACK	4
	DEFTRACK	7
	DEFTRACK	6
	DEFTRACK	9
	DEFTRACK	8
	DEFTRACK	11
	DEFTRACK	10
	DEFTRACK	13
	DEFTRACK	12
	DEFTRACK	15
	DEFTRACK	14
	DEFTRACK	17
	DEFTRACK	16
	DEFTRACK	19
	DEFTRACK	18
	DEFTRACK	21
	DEFTRACK	20
	DEFTRACK	23
	DEFTRACK	22
	DEFTRACK	25
	DEFTRACK	24
	DEFTRACK	27
	DEFTRACK	26
	DEFTRACK	29
	DEFTRACK	28
	DEFTRACK	31
	DEFTRACK	30
	DEFTRACK	33
	DEFTRACK	32
	DEFTRACK	35
	DEFTRACK	34
	DEFTRACK	37
	DEFTRACK	36
	DEFTRACK	39
	DEFTRACK	38
	DEFTRACK	41
	DEFTRACK	40
	DEFTRACK	43
	DEFTRACK	42
	DEFTRACK	45
	DEFTRACK	44
	DEFTRACK	47
	DEFTRACK	46
	DEFTRACK	49
	DEFTRACK	48
	DEFTRACK	51
	DEFTRACK	50
	DEFTRACK	53
	DEFTRACK	52
	DEFTRACK	55
	DEFTRACK	54
	DEFTRACK	57
	DEFTRACK	56
	DEFTRACK	59
	DEFTRACK	58
	DEFTRACK	61
	DEFTRACK	60
	DEFTRACK	63
	DEFTRACK	62
	DEFTRACK	65
	DEFTRACK	64
	DEFTRACK	67
	DEFTRACK	66
	DEFTRACK	69
	DEFTRACK	68
	DEFTRACK	71
	DEFTRACK	70
	DEFTRACK	73
	DEFTRACK	72

	TLENTRY	074,099,TRACK_LENGTH,SYNC_STD,DMFM_NULL
	
	DEFTRACK	101
	DEFTRACK	100
	DEFTRACK	103
	DEFTRACK	102
	DEFTRACK	105
	DEFTRACK	104
	DEFTRACK	107
	DEFTRACK	106
	DEFTRACK	109
	DEFTRACK	108
	DEFTRACK	111
	DEFTRACK	110
	DEFTRACK	113
	DEFTRACK	112
	DEFTRACK	115
	DEFTRACK	114
	DEFTRACK	117
	DEFTRACK	116
	DEFTRACK	119
	DEFTRACK	118
	DEFTRACK	121
	DEFTRACK	120
	DEFTRACK	123
	DEFTRACK	122
	DEFTRACK	125
	DEFTRACK	124
	DEFTRACK	127
	DEFTRACK	126
	DEFTRACK	129
	DEFTRACK	128
	DEFTRACK	131
	DEFTRACK	130
	DEFTRACK	133
	DEFTRACK	132
	TLEND


_DMFM_SB:
	exg	A0,A1
	MOVEQ	#100,D0
.LAB_000A:
	CMPI	#$5554,(A1)+		
	DBEQ	D0,.LAB_000A		
	CMPI	#$5554,(A1)+		
	BNE	_NoSector
	CMPI.L	#$AAA4A929,(A1)		
	BNE	_NoSector	
	CMPI.L	#$544A4A4A,4(A1)	
	BNE	_NoSector
	MOVE.L	#$AAAAAAAA,D2		
	MOVE.L	#$55555555,D3		
	MOVEQ	#1,D4			
	MOVE.L	8(A1),D0		
	MOVE.L	12(A1),D1		
	ASL.L	D4,D0			
	AND.L	D2,D0			
	AND.L	D3,D1			
	OR.L	D1,D0
	lea	_variable(pc),a2
	MOVE	D0,(a3)
	MOVEA.L	A1,A2			
	LEA	24(A1),A1		
	MOVEA.L	D6,A4			
	MOVE	(a3),D6
	MOVE	D6,D5			
	LSR	#2,D6			
	SUBQ	#1,D6			
	MOVEQ	#0,D7			
.LAB_000B:
	MOVE.L	0(A1,D5.W),D1		
	MOVE.L	(A1)+,D0		
	ASL.L	D4,D0			
	AND.L	D2,D0			
	AND.L	D3,D1			
	OR.L	D1,D0			
	EOR.L	D0,D7			
	MOVE.L	D0,(A0)+		
	DBF	D6,.LAB_000B		
	LEA	16(A2),A2		
	MOVE.L	(A2)+,D0		
	MOVE.L	(A2),D1			
	ASL.L	D4,D0			
	AND.L	D2,D0			
	AND.L	D3,D1			
	OR.L	D0,D1			
	MOVE.L	A4,D6			
	CMP.L	D1,D7			
	BNE	_ChecksumError
;;	ADDA.L	D5,A1
_OK
	moveq	#IERR_OK,d0
	rts

_variable:
	dc.l	0

_ChecksumError
	moveq	#IERR_CHECKSUM,d0
	rts

_NoSector
	move.l	a0,$100.W
	move.l	a1,$104.W
	moveq	#IERR_NOSYNC,d0
	rts
