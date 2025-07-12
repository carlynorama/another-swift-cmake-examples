#include <stdlib.h>
#include <stdio.h>
// #include "my_manual_header.h"

void say_hello();

int main(int argc, char* argv[])
{
    // code to calculate the sum of n numbers passed to CLA
    int i, sum = 0;

    // iterating the loop till the the number of
    // command-line arguments passed to the program
    // starting from index 1
    for (i = 1; i < argc; i++) {
        sum = sum + atoi(argv[i]);
    }
    printf("Sum of %d numbers is : %d\n", argc - 1, sum);
    say_hello();

    return 0;
}