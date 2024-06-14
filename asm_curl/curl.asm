section .data
    get: db "GET / HTTP/1.1",0x0d,0xa,0xd,0xa
    sizereq: equ $ - get

section .bss
    headers resb 1024
    reply resb 1024

section .text

global _start
_start:

    ;calling socket syscall
    mov rax, 0x29
    mov rdi, 2 ; AF_INET
    mov rsi, 1 ;sock_stream
    mov rdx, 0
    syscall

    mov rdi, rax ;set socketid to rdi


    xor rax, rax
    mov rax, 0x2a
    ;rdi is already the pointer to the socket so we dont pass it here
    ;pass the struct here
    xor rsi, rsi
    push rsi
    push 0x0100007f ;push 127.0.0.1 (byte for byte)
    push WORD 0x5000 ;push port 80 here
    push WORD 0x02 ;AF_INET value (For communicating between processes on different hosts connected by IPV4, we use AF_INET)
    mov rsi, rsp ;set rsi to our struct (stack pointer)
    mov rdx, 16 ;size of our struct
    syscall


    mov rax, 0x2c
    ;rdi is already the pointer to the socket
    mov rsi, get
    mov rdx, sizereq
    mov r10, 0
    syscall

    ;receive the headers
    mov rax, 0x2d
    ;rdi is already the socket descriptor
    mov rsi, headers
    mov rdx, 1024
    syscall

    ;receive the code
    mov rax, 0x2d
    mov rsi, reply
    mov rdx, 1024
    syscall

    mov rsi, headers
    mov rdx, 1024
    call _write
    mov rsi, 0x0a
    mov rdx, 2
    call _write
    mov rsi, reply
    mov rdx, 1024
    call _write

_exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall

_write:
   mov rax, 1
   mov rdi, 1
   syscall
   ret
