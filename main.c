#include <stdlib.h>
#include <stdio.h>

void reverse(const char* arg);


int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <argument1> [argument2] [argument3] ...\n", argv[0]);
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

