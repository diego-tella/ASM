global _main

section .data
    hello: db 'Hello, World',0xa

section .text
_main:
    mov rbx, 0
    call next
next:
    inc rbx
    cmp rbx, 11
    jne printHello
    call exit

printHello:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, hello
    mov rdx, 15
    syscall
    call next
exit:
    mov rax, 0x3c
    mov rdi, 1
    syscall
