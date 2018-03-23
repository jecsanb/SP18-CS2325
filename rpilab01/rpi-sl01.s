  
/* file rpi-sl01.s 

   
   A program to input an integer and output same
*/

            .extern     printf
            .extern     scanf
            .data
fmt1:       .asciz      "%d"    @ format string for reading an int
                                @ with scanf
            .align      2


fmt2:       .asciz      "The sum is: %d\n"  @ format string for printf
            .align      2

fmt3:       .asciz      "Please input an integer: "  @ format string for printf
            .align      2


n:          .word       0       @ memory to store an integer

m:          .word       0       @ memory to store an integer

            .text
            .globl      main
main:       push        {lr}    /* save lr for return to caller */


    @ printf("Please input an integer: ")
            ldr         r0, =fmt3        
            bl          printf   
            

     @ scanf("%d", &n)
            ldr         r0, =fmt1   /* load address of fmt1 string */
            ldr     n */
            bl          scanf       /* call scanf("%d",&n) */
            
        

     @ printf("Please input an integer: ")
            ldr         r0, =fmt3
            bl          printf            
            

    @ scanf("%d" , &n)
            ldr         r0, =fmt1
            ldr         r1, =n
            bl          scanf

        


      @  add R1 = m + n
            ldr         r1,=m
            ldr         r1,[r1]

            ldr         r2,=n
            ldr         r2,[r2]
        
            
         @ printf("You entered %d\n", n)
            ldr         r0, =fmt2   /* load address of fmt2 string */
            ADD         r1,r1,r2
            bl          printf      /* call printf("You entered %d\n", n) */

            mov         r0, #0      /* load return value */
            pop         {lr}        /* retrieve return address */
            mov         pc, lr      /* return to caller */
            .end
