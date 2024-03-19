section .data
; where you can declare variables, initialize values, etc.

section .bss
; where you define uniinitialized global vars and static variables

section .text
global main

main:
    mov rbp, rsp; for correct debugging
    mov ebp, esp; for debugging
    ;write your code here
    
    ; Basic concepts
    ; mnemonic operands
    ; mnemonic operand1, operand2
    ; nemonic destination, source
    xor eax, eax    ; mnemonic operands
    ; 1. memory adressing
    ; 2. register adressing
    ; 3. immidiate addressing
    
    mov eax, 2
    mov eax, 0
    mov ax, 0x01
    mov al, 0x3
    
    ret