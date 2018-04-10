/********************************************************
* Program Authors: H.Paul Haiduk &                      *
* TEAM:     04, Atef Yassine,Jecsan Blanco              *
* LAB:      LAB09                                       *
* VERSION: 04/06/2018                                   * 
* Purpose: Reverses a line of text                      *
* Call sequence: 					*
*              Load character in R0			*
*	       Load address of stream in R1		*
*	       Call ungetc in main			*
*	       Call reverseLine, which calls doReverse. *
* This is an attempted imitation of reverse.c's         *
* doReverse function written by H.Paul Haiduk		*
*                                                       *
/********************************************************/
	.arch armv6
	.fpu vfp
	.text
	.align	2
	.global	doReverse
	.type	doReverse, %function
.equiv  EOLN, 10        @ ASCII end of line
.equiv  EOF, -1
        @ uses two system functions:  fgetc and fputc
        @ fgetc(address of stream) ==> returns next character in stream
        @                             -1 for error or EOF
        @ fputc(a character, address of output stream)
doReverse:
	stmfd	sp!, {r4, r5, fp, lr}
        mov     fp,sp

	sub	sp, sp, #8
        ldr     r4, input
        ldr     r4, [r4]        @ address of stream stdin
        ldr     r5, output
        ldr     r5, [r5]        @ address of stream stdout

	mov	r0, r4
	bl	fgetc
	str	r0, [fp, #-4]
	cmp	r0, #0
	beq	exitReverse
	cmp	r0, #EOLN
	beq	exitReverse
        bl       doReverse         @ stack the chars untill we hit the new line
exitReverse:
	ldr	r0, [fp, #-4]
        cmp     r0,#EOLN
        beq     continue          @ skip the last  new line
        mov	r1, r5
	bl	fputc
continue:
        @ prepare for return
        mov     sp,fp
	ldmfd	sp!, {r4, r5, fp, pc}
        .align  2
input:  .word   stdin
output: .word   stdout
