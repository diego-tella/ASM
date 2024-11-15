section .data
    file: db "/etc/passwd",0

section .text
global _start

_start:
    mov rax, 2
    mov rdi, file
    mov rsi, 0x00
    mov rdx, 0644
    syscall

    mov rdi, rax ;file descriptor
    mov rax, 0 ; read syscall
    lea rsi, [rsp]
    mov rdx, 0xffffff
    syscall

    xor rdi, rdi
    add dil, 1
    mov rdx, rax
    xor rax, rax
    add al,1
    syscall


    ; exit
    xor rax,rax
    add al, 60
    syscall
