#Makefile  

lab01   :  lab01.o
	gcc -gstabs+ -o lab01 lab01.o
   
lab01.o  :  lab01.s
	gcc -gstabs+ -c lab01.s
   
isting :  lab01.s
	gcc -c -gstabs+ -Wa,-alms,-L lab01.s > lab01.lst
  
lab01c :  lab01c.o
	gcc -gstabs+ -o lab01c lab01c.o
  
lab01c.o  :  lab01c.c
	gcc -gstabs+ -c lab01c.c
  
clean   :
	rm -f *.o *.lst lab01 lab01c
