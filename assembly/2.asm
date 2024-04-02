%INCLUDE "io.inc"
SECTION .text
global CMAIN

CMAIN:
    MOV EAX, [num1]
    
    CMP EAX, 1
    JE not_prime

    MOV ECX, 2

check_divisor:
    CMP ECX, EAX
    JGE is_prime

    MOV EDX, 0
    IDIV ECX
    
    MOV EAX, [num1]
    
    CMP EDX, 0
    JE not_prime
    
    INC ECX
    JMP check_divisor

not_prime:
    PRINT_STRING "Nao eh primo."
    JMP end_program

is_prime:
    PRINT_STRING "Eh primo."
    JMP end_program

end_program:
    RET

SECTION .data
num1 DD 5   
