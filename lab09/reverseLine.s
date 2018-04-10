/*********************************************************
* Program Authors: H.Paul Haiduk &                       *
* TEAM:     04, Atef Yassine,Jecsan Blanco               *
* LAB:      LAB09                                        *
* VERSION:  04/06/2018                                   *
* Purpose:  Calls doReverse and outputs an EOLN          *
*           after it's done.                             *
* Attempted imitation of reverse.c's reverseLine function*
* written by professor H.Paul Haiduk                     *
**********************************************************/
            .arch armv6
            .fpu  vfp
            .text
            .align 2
            .global reverseLine
            .type   reverseLine, %function

.equiv      EOLN,10   @ ASCII for end of line

reverseLine:

        @ uses one system function: fputc
        @ fputc(a character, address of output stream)

        stmfd           sp!, {r5,fp,lr}

        ldr             r5,output       
        ldr             r5,[r5]         @ address of stream stdout

        bl              doReverse       @ call doReverse

        mov             r0,#EOLN        @ print EOLN in the end
        mov             r1,r5           @
        bl              fputc           @

exitReverseLine:
            @ prepare for return
            ldmfd       sp!, {r5,fp,pc}
            .align      2
output:     .word       stdout
