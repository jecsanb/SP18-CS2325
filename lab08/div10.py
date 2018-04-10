#!/usr/bin/python3

def div10( aNum ):
    # by: H. Paul Haiduk derived from insights in
    # Hacker's Delight, 2nd ed.
    q = (aNum >> 1) + (aNum >> 2)
    q = q + (q >> 4)
    q = q + (q >> 8)
    q = q + (q >> 16)
    q = q >> 3
    r = aNum - (((q << 2) + q) << 1)
    if (r > 9):
        q += 1
        r -= 10
    return (q,r)
# end div10

def main():

    number = (1 << 31) - 1
    while number > 0:
        print("The number is %d" % number)
        (quotient, remainder) = div10(number)
        print("The number div10 yields quotient %d and remainder %d" % 
                (quotient, remainder) )
        number = quotient
    #end while
     
#end main

main()
