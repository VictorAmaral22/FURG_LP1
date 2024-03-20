section .text
global main

main:            
    mov rbp, rsp; for correct debugging
    ; Prologue: Salvando os registradores que precisamos
    mov rbx, 6 ; número que é primo
    mov rax, 0 ; resultado da divisão
    mov rsi, rbx ; número a que dividide
    mov rcx, 0 ; contador

    l1:
        mov rax, rsi
        xor rdx, rdx
        div rbx

        CMP rdx, 0
        JE l3
        JNE l4      
        
    l3:
        INC rcx
        
  
        
    l2:
        ret
