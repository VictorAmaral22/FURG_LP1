#include <stdio.h>

int main()
{
    printf("Hello World\n");

    int value = 15;
    int *ptr;

    ptr = &value;

    printf("%p\n", ptr);  // Prints the pointer to the var value = 0x7ffeef216d8c
    printf("%d\n", *ptr); // Prints the content of whats in the pointer = 15
    printf("%p\n", &ptr); // Prints the address of the pointer ptr

    *ptr = 73; // Atributes the value 73 to the var on the pointer, so the var value receaves 73


    return 0;
}