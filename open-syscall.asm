section .data
    filename db "/proc/sys/kernel/ftrace_enabled",0
    value db "0",0
section .text
    global _start

_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, 577
    mov rdx, 0644
    syscall

    mov rdi, rax
    mov rax, 1
    mov rsi, value
    mov rdx, 2
    syscall

    mov rax, 3
    syscall

    mov rax, 0x3c
    mov rdi, 1
    syscall
