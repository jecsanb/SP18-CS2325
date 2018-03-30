/********************************************************
* LAB:      LAB08                                       *
* VERSION:  03/29/2018                                  *
* Purpose:  Implement the provided pythong code         *
* in Assembly. The code divides the max int number N    *
* continuously until N is 0.                            *
*                                                       *
********************************************************/
	.arch armv6
	.fpu vfp
	.file	"main.s"

        .data
msg1:   .asciz   "The number is %d\n"
        .align  2

msg2:   .asciz   "The number div10 yields quotient %d and remainder %d\n"
        .align  2

fmt:    .asciz  "%d"
        .align  2

	.text
	.align	2
	.global	main
	.type	main, %function
main:
        STMFD   SP!, {LR}
                                    @ R0 -- MAXINT for 32-bit int
                                    @ number = (1 << 31) - 1 
        MOV     R1, #1        
        LSL     R1, #31
        SUB     R1, #1
while:
        PUSH    {R1} 
        LDR     R0, =msg1
        BL      printf
        POP     {R0} 

        BL      div10
        MOV     R2, R1
        MOV     R1, R0
        PUSH    {R1}
        LDR     R0, =msg2
        BL      printf
        POP     {R1}

        CMP     R1, #0
        BGT     while
return:

        LDMFD   SP!, {LR}
        EOR     R0, R0, R0
        MOV     PC,LR
        .end
