#Created by Atef Yassine
#Lab08 Makefile



lab08	:	main.o	div10.o
	gcc -gstabs+ -o lab08 main.o div10.o
main.o	:	main.s
	gcc -gstab+ -c main.s
div10.o	:	div10.s
	gcc -gstab+ -c div10.s

listing	:	lab08.s
	gcc -c -gstabs+ -Wa, -alms, -L lab08.s > lab08.lst
run	:	lab08	
	./lab08
clean	:
	rm -f *.o *.lst lab08
