/********************************************************
* LAB:      LAB08                                       *
* VERSION:  03/29/2018                                  *
* Purpose:  The code divides a number "N" by 10		*
* 							*
* Call Sequence: Move N to R0, call div10,		*
*		 returns Quotient  in  R0		*
*			 Remainder in  R1		*
*                                                       *
********************************************************/

/*******************************************************/
        .arch armv6
        .fpu  vfp

        .data

        .text
        .align
        .global div10
        .type  div10, %function
/*******************************************************/

div10:
	@ assume that argument N is in r0 and postive
	@ r1 will hold Quotient
	@ r2 will hold Remainder

        stmfd sp!,{r4,r5,lr}

/********************************************************
* 		Quotient Calculation		        *                                          
*********************************************************/

	mov	r4,r0		@ copies the N value to R4
	mov	r5,r0		@ another copy of N to  R5
	
	LSR	r0,#1		@ shifts r0 1 time to the right
	LSR	r4,#2		@ shifts r4 2 times to the right

	add	r0,r0,r4	@ r0 = r0 + r4

	mov	r4,r0		@ copies r0 to r4

	LSR	r4,#4		@ shifts R4 to the right 4 times
	add	r0,r0,r4	@ q = q + (q >> 4)

	mov	r4,r0		@ copies r0 to r4

	LSR	r4,#8		@ shifts R4 to the right 8 times
	add	r0,r0,r4	@ q = q + (q >> 8)

	mov	r4, #0		@ copies r0 to r4

	LSR	r4,#16		@ shifts R4 to the right 16 times
	add	r0,r0,r4	@ q = q + (q >> 16)

	LSR	r0,#3		@ shifts R0 to the right 3 times

	mov	r1,r0		@ Quotient is found

/********************************************************
* 		Remainder Calculation		        *                                          
*********************************************************/
	LSL	r0,#2		@ left shifts r0 twice
	add	r0,r0,r1	@ r0 = r0 + r1
	LSL	r0,#1		@ left shifts r0 once
	SUB	r2,r5,r0	@ r2 = r5 - r0

if:
	cmp	r2,#9		@ compare r2 with 9
	ble	return		@ if r2 is <= 9 then return
else:
	add	r1,r1,#1	@ else, r1 = r1 + 1
	sub	r2,r2,#10	@	r2 = r2 - 10


/********************************************************
* 		Exiting Routine			        *                                          
*********************************************************/

return:
	mov	r0,r1
	mov	r1,r2
        ldmfd sp!,{r4,r5,lr}
        mov   pc,lr
        .end
