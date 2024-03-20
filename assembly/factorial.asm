section .text
global main

main:            
    mov rbp, rsp; for correct debugging
    ; Prologue: Salvando os registradores que precisamos
    mov rbx, 6
    mov rax, 1

    l1:
        MUL rbx

        DEC rbx
        CMP rbx, 1
        JE l2
        JNE l1            
        
    l2:
        ret
