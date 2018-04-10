#include <stdio.h>

#define EOLN 10
/* NOTE:  EOF define in stdio.h */

void doReverse() {
    int ch;

    if ( (ch = fgetc(stdin)) && (ch != EOLN) )  {
        doReverse();
        fputc(ch,stdout);
    }
}

void reverseLine() {
    doReverse();
    fputc(EOLN,stdout);
}

int main() {
    int ch;

    while ( (ch = fgetc(stdin)) && (ch != EOF) ) {
        ungetc(ch,stdin);
        reverseLine();
    }
    return 0;
}
