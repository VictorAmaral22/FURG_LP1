%include "io.inc"

section .data
    num dd 100
    
section .text
    global main
    
main:
    call verify_uneven
    xor eax, eax
    ret
    
verify_uneven:
    mov ecx, 0
    @L:
        add ecx, 1
        cmp ecx, [num]
        je exit
        
        mov eax, ecx
        mov edx, 0
        mov ebx, 2
        idiv ebx
        
        cmp edx, 0
        jg print_uneven
        jmp @L
        ret
        
print_uneven:
    PRINT_UDEC 4, ecx
    NEWLINE
    jmp @L
    
exit:
    xor eax, eax
    ret