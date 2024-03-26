%include "io.inc"

section .text
global main

main:
    mov eax, 25
    call prime
    xor eax, eax
    ret
    
prime:
    cmp eax, 2
    je isprime
    mov edx, 0
    mov ebx, 2
    idiv ebx
    cmp edx, 0
    je isnotprime
    jg isprime
    
isprime:
    PRINT_STRING 'Is prime'
    
isnotprime:
    PRINT_STRING 'Not prime'