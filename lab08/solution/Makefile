#Makefile for lab 08

lab08:	main.o div10.o
	gcc -gstabs -o lab08 main.o div10.o

main.o:	main.s
	gcc -gstabs -c main.s

div10.o: div10.s
	gcc -gstabs -c div10.s

run:	lab08
	./lab08

clean:
	rm -f *.o lab08 *.swp
