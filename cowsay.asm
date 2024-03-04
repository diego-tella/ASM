section .data
    str: db '/usr/games/cowsay',0
    args:  dq str, arg1, 0
    arg1: db 'huee',0

section .text
    global _main

_main:
    mov rax, 0x3b  
    mov rdi, str   
    lea rsi, [rel args]  
    xor rdx, rdx   
    syscall
    call exit
exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall
