#Makefile for the reverse program
SHELL := /bin/bash

reverse :  reverse.o reverseLine.o
	gcc -gstabs+ -o reverse reverse.o reverseLine.o

reverse.o:	reverse.s
	gcc -gstabs+ -c reverse.s

reverseLine.o : reverseLine.s
	gcc -gstabs+ -c reverseLine.s

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

