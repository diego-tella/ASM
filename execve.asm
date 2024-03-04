section .data
    str: db '/bin/bash',0

section .text
    global _main

_main:
    mov rax, 0x3b  ;define syscall number
    mov rdi, str   ;set a pointer to the filename
    xor rsi, rsi   ;set rsi to null to not use arguments
    xor rdx, rdx   ;not use envp
    syscall
    call exit
exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall
