#Makefile for the reverse program
#Written by H.Paul Haidul
#Revised by Atef Yassine
#Alternations: Names & Added doReverse.o rule
SHELL := /bin/bash

reverse :  main.o reverseLine.o doReverse.o
	gcc -gstabs+ -o reverse main.o reverseLine.o doReverse.s

reverseLine.o : reverseLine.s
	gcc -gstabs+ -c reverseLine.s

main.o:		main.s
	gcc -gstabs+ -c main.s

doReverse.o:	doReverse.s
	gcc -gstabs+ -c doReverse.s

clean:
	@rm -vf *.o reverse .*swp output

compare: reverse
	./reverse < reverse.c | ./reverse > output
	diff reverse.c output
	@if [[ $$? -eq 0 ]]; then\
	    echo "Success";\
	else\
	    echo "No cigar!";\
	fi

