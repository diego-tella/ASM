section .data
    msg: db "Hello, World",10

section .text
    global _start

_start:
    mov RAX, 1
    mov RDI, rax
    mov rsi, msg
    mov rdx, 13
    syscall

_end:

    mov rax, 60             
    mov rdi, 0              
    syscall
