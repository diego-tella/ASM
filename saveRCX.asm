global _start

section .data
    message: db "Saving RCX value after syscall!",10
    size: equ $ - message

section .text

_start:
    mov rcx, 30
    push rcx
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, size
    syscall
    pop rcx


_end:
    mov rax, 0x3c
    mov rdi, 0
    syscall
