# Makefile for demomstrating sumint functions
#

test-iterative : test-sumint.o sumint.o
	gcc -gstabs+ -o test-iterative test-sumint.o sumint.o

test-sumint.o	: test-sumint.s
	gcc -gstabs+ -c test-sumint.s

sumint.o	: sumint.s
	gcc -gstabs+ -c sumint.s

test-recursive : test-sumint.o	sumIntR.o
	gcc -gstabs+ -o test-recursive test-sumint.o sumIntR.o

sumIntR.o	: sumIntR.s
	gcc -gstabs+ -c sumIntR.s

clean	:
	rm -r *.o test-iterative test-recursive 

