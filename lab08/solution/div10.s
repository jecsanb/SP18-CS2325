	.arch armv6
	.fpu vfp
	.text
	.align	2
	.global	div10
	.type	div10, %function
div10:
        @ register r0 holds the argument
        @ register r3 will hold the quotient
        @ register r2 will hold the remainder

        push    {lr}
        push    {fp}
        mov     fp,sp

	mov	r3, r0, asr #2
	add	r3, r3, r0, asr #1
	add	r3, r3, r3, asr #4
	add	r3, r3, r3, asr #8
	add	r3, r3, r3, asr #16
	mov	r3, r3, asr #3
	add	r2, r3, r3, asl #2
	sub	r2, r0, r2, asl #1
	cmp	r2, #9
	addgt	r3, r3, #1
	subgt	r2, r2, #10
        mov     r0, r3           @return of quotient
        mov     r1, r2           @return of remainder

        mov     sp, fp
        pop     {fp}
        pop     {pc}
