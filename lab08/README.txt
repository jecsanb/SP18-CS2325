NOTES for using gdb.

First, the code must have been compiled/assembled using the -gstabs
option to produce theExecutable -- the program you run from command line.

Next, to start up the debugger, use:  gdb --tui theExecutable

Then, the get things going so that you can see elements of your program
(don't type the ==> and comments afterwards)
b main          ==> this sets a breakpoint at main
layout regs     ==> this puts up a window with the registers
start main      ==> begins program execution
s               ==> single steps (including into called functions)
n               ==> similar to s but goes to next source line
x/nfu addr
        n       ==> number of elements to display
        f       ==> format
                    x - hex
                    d - decimal signed
                    u - decimal unsigned
                    o - octal
                    t - two's (binary)
                    a - address
                    c - character
                    f - float
                    s - string
                    z - hex with left padding
                    r - raw
        u       ==> unit size
                    b - byte
                    h - half word
                    w - word
                    g - giant (double word)

