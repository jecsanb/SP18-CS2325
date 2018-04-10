	.arch armv6
	.fpu vfp
	.file	"sumint.c"
	.text
	.align	2
	.global	sumint
	.type	sumint, %function
sumint:
        @ arg1 in r0 -- value of n
        @ sum  in r1 -- initialized to 0
        @ i    in r2 -- initialized to 0
        push    {fp}
        push    {lr}
        eor     r1, r1, r1      @ sum = 0
        eor     r2, r2, r2      @ i = 0
while:
        cmp     r2, r0
        bgt     return
        add     r1, r1, r2      @ sum = sum + i
        add     r2, r2, #1      @ i++
        b       while
return:
        mov     r0, r1
        pop     {lr}
        pop     {fp}
        mov     pc,lr
	.size	sumint, .-sumint
