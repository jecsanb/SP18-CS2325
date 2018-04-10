	.arch armv6
	.fpu vfp
	.text
	.align	2
	.global	sumint
	.type	sumint, %function

/* ************************************************* */
/* FUNCTION:  sumIntR                                */
/* 	1st argument is N on the stack               */
/*      returns sum of first N ints in R0            */
/*                                                   */
/* NOTE: Calculation accomplished recursively        */
/*       Also, function adjusts SP                   */
/*                                                   */
/* ************************************************* */
sumint:
	PUSH {LR}	    @ preserve link reg value
	PUSH {FP}           @ preserve frame pointer
	MOV  FP, SP
	LDR  R2, [FP, #8]   @ argument two words back

	CMP  R2, #0
	BLE  return_zero
	SUBS R2, R2, #1
	PUSH {R2}
	BL   sumint
	LDR  R2, [FP,#8]
	ADDS R0, R0, R2
	B    return

return_zero:
        EOR  R0, R0, R0
return:
	MOV  SP, FP
	POP  {FP}
	POP  {LR}	    
	MOV  PC, LR         @ reset PC with return address
