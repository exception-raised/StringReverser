#include <stdlib.h>
#include <stdio.h>

extern void reverse(const char* arg);

int main(int argc, char *argv[]) {
    reverse(argv[1]);
    printf("Result: %s", argv[1]);

    return EXIT_SUCCESS;
}
