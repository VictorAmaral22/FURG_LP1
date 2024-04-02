%INCLUDE "io.inc"
SECTION .text
global CMAIN

CMAIN:
    MOV EAX, [num1]  
    MOV ECX, 1         
    MOV EBX, 0     

odd_numbers:
    CMP EBX, EAX       
    JGE end_program   

    PRINT_UDEC 4, ECX  
    PRINT_STRING " "  

    ADD ECX, 2             
    INC EBX               
    JMP odd_numbers  

end_program:
    RET

SECTION .data
num1 DD 10       
