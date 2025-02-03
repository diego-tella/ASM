global _start

section .data
    message: db "Hello, World!",10
    size: equ $ - message

section .text

_start:
    call _helloworld
    call _end

_helloworld:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, size
    syscall
    pop rax
    jmp rax


_end:
    mov rax, 0x3c
    mov rdi, 0
    syscall
