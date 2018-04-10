                .arch   armv6
                .fpu    vfp
                .data
msg1:           .asciz  "Program to repeadly prompt user for values of n,\n"
                .align  2
msg2:           .asciz  "calculates sum first n integers and outputs result.\n"
                .align  2
msg3:           .asciz  "  when n < 0, the program terminates\n\n"
                .align  2
prompt:         .asciz  "Enter a value for n: "
                .align  2
scan_fmt:       .asciz  "%d"
                .align  2
result_fmt:     .asciz  "Sum of the first %d integers is %d and 0X%0X\n"
                .align  2
n:              .word   0

                .text
                .global main
                .type   main, %function
                .align  2

main:           stmfd   sp!, {r4,lr}
                ldr     r0, =msg1
                bl      printf          @  "Program to repeadly prompt user for values of n,\n"

                ldr     r0, =msg2
                bl      printf          @  "calculates sum first n integers and outputs result.\n"

                ldr     r0, =msg3       
                bl      printf          @  "  when n < 0, the program terminates\n\n"

                mov     r4, #0          @ done = 0

while:          cmp     r4, #1          @ while !done?
                beq     return
                ldr     r0, =prompt     @  "Enter a value for n: "
                bl      printf
                ldr     r0, =scan_fmt
                ldr     r1, =n
                bl      scanf
                ldr     r1, =n
                ldr     r1, [r1]
                cmp     r1, #0          @ n >= 0
                blt     set_done
                push    {r1}            @ setup for recursive call
                mov     r0, r1          @ setup for iterative call
                bl      sumint          
                pop     {r1}            @ value of n
                mov     r2, r0          @ 2nd arg for printf, sumint(n)
                mov     r3, r0          @ 3rd arg for 
                ldr     r0, =result_fmt
                bl      printf          @  "Sum of the first %d integers is %d and %0X\n"
                b       while
set_done:       mov     r4, #1          @ done = 1
                b       while

return:         
                eor     r0, r0, r0
                ldmfd   sp!, {r4,lr}
                mov     pc, lr
                .end
