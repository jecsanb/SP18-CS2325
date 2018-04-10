#include <stdio.h>
extern sumint(int);

int main() {

    printf("Program to repeatedly prompt user for values of n,\n");
    printf("calculates sum first n integers and outputs result.\n");
    printf("  when n < 0, the program terminates\n\n");

    int done = 0;
    int n;

    while (!done) {
        printf("Enter a value for n: ");//fflush(stdout);
        scanf("%d", &n);
test:   if (n >= 0) {
            printf("Sum of first %d integers is %d\n", n, sumint(n));
        }
        else done = 1;
    }

    return 0;
}



