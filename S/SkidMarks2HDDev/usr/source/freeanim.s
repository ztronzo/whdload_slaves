* $Id: freeanim.s 1.1 2003/02/19 07:41:09 wepl Exp $
**************************************************************************
*   FREEANIM-LIBRARY                                                     *
**************************************************************************
**************************************************************************
*   INITIALIZATION                                                       *
**************************************************************************

FRANINIT	move.l	_franbase,d0
		beq	.init
		rts

.init		move.l	#10,d0		; at random
		move.l	#2,d1		; at random
		lea	_franname,a0
		bsr	_InitLibrary
		lea	_franbase(pc),a0
		move.l	d0,(a0)
		move.l	d0,a0
		
		rts

