global _main

section .data
    hello: db 'Hello, World',0xa

section .text
_main:
    mov rcx, 1
    call next
next:
    inc rcx
    cmp rcx, 10
    jne printHello
    call exit

printHello:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, hello
    mov rdx, 15
    syscall
    ret
exit:
    mov rax, 0x3c
    mov rdi, 1
    syscall

