section .data
    str: db '/usr/games/cowsay',0
    args:  dq str, msg, 0

section .bss
    msg resb 50

section .text
    global _start

_start:
    ;read
    mov RAX, 0
    mov RDI, 0
    mov RSI, msg
    mov RDX, 50
    syscall

    ;execve
    mov rax, 0x3b  
    mov rdi, str   
    mov rsi, args
    xor rdx, rdx   
    syscall

_exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall
