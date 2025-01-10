section .text
    global _start
_start:
    pop RSI
    mov rax, 1
    mov rdi, 1
    mov RDX, 8
    syscall
    jmp _start
