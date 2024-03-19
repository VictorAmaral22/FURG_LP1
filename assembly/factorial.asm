section .data
    x dd 5     ; Defina o valor de x aqui
    n dd 5     ; Defina o valor de n aqui

section .text
global main

main:
    mov rbp, rsp; for correct debugging
    ; Prologue: Salvando os registradores que precisamos
    push rbp
    mov rbp, rsp
    push rbx
    push rcx

    ; Inicializar o resultado (RAX) com 1
    mov rax, 1

    ; Loop para calcular o fatorial
    mov rcx, [n]   ; Carregar n
    cmp rcx, 0     ; Verificar se n é 0
    je end_factorial

    mov rbx, [x]   ; Carregar x
    mul rbx        ; Multiplicar RAX por x

    ; Loop para calcular x * (x-1) * (x-2) * ... * (x-n+1)
    loop_factorial:
        dec rcx           ; Decrementar n
        cmp rcx, 0        ; Verificar se n é 0
        je end_factorial  ; Se for, sair do loop
        mul rbx           ; Multiplicar RAX por x
        jmp loop_factorial

    ; Epílogo: Restaurar registradores e sair
    end_factorial:
    pop rcx
    pop rbx
    pop rbp
    mov rsp, rbp
    mov rax, 60     ; Syscall para sair
    xor rdi, rdi    ; Código de retorno 0
    ret
