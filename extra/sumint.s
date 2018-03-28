			.arch armv6
			.fpu  vfp
			.file "sumint.s"
			.align 2

			.global main
			.type   main, %function

			.data
msg:      .ascii   "Program to repeatedly prompt user for values of n.\n"	 
			.ascii   "calculates sum first n integers and outputs result.\n"
			.asciz   "when c < 0, the program terminates \n\n"
			.align   2
prompt:		.asciz   "Enter a value for n: "
			.align   2

fmt1:		.asciz   "%d"
			.align   2

in:        .word    0 
sum:       .word    0


			.text
main:       stmfd  sp!,{lr}
			ldr    r0, =msg  @ load the msg
			bl     printf

		
while:
			ldr    r0,=prompt
			bl     pinrtf

			
		   	
			b    while
done:

			eor    r0, r0, r0 
            ldmfd  sp!, {lr}
			mov    pc, lr
			.end
