        .arch armv6
        .fpu vfp
        .text
	.align	2
	.global	main
	.type	main, %function

	.align	2
msg1:   .ascii	"The number is %d\012\000"
	.space	2
msg2:   .ascii	"The number div10 yields quotient %d and remainder %d\012\000"
        .align  2
main:
        @r4 holds number
        @r5 holds address of first message
        @r6 holds address of second message

	stmfd	sp!, {r4, r5, r6, lr}

	@mvn	r4, #-2147483648   @ toggles all the bits of operand
        mov     r4, #-1    @ a string of all 1 bits
        lsr     R4, r4, #1 @ now becomes MAXINT
	adr	r6, msg1 @ can be used rather than ldr since messages
	adr	r5, msg2 @ are in the text section
while:
	cmp	r4, #0
        ble     endWhile
	mov	r0, r6  @ address of message
	mov	r1, r4  @ value of integer converted by %d
	bl	printf
	mov	r0, r4  @ argument to div10
	bl	div10
        @ r0 now holds quotient
        @ r1 now holds remainder
	mov	r4, r0  @ number = quotient
        mov     r2, r1  @ 2nd argument to printf is remainder
        mov     r1, r0  @ 1st argument to printf is quotient
	mov	r0, r5  @ 0th argument to printf is address of format conversion string
	bl	printf
	bal	while
endWhile:
	mov	r0, #0  @ return code for the OS

	ldmfd	sp!, {r4, r5, r6, pc}

