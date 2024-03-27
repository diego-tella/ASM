section .data
    msg: db "Digite a senha: ",0
    len1: equ $-msg

    msg2: db "Senha correta: flag",10
    len2: equ $-msg2
    

section .bss
    senha resb 50

section .text
    global _start

_start:
    mov RAX, 1
    mov RDI, 1
    mov rsi, msg
    mov rdx, len1
    syscall

    mov RAX, 0
    mov RDI, 0
    mov RSI, senha
    mov RDX, 50
    syscall
    
    mov r9, senha
    cmp byte [r9], 0x31
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x32
    jne _end
    inc r8
    inc r9
    jmp _flag
    
    cmp byte [r9], 0x33
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x34
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x35
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x36
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x37
    jne _end
    inc r8
    inc r9
    
    cmp byte [r9], 0x38
    jne _end
    inc r8
    inc r9
    
    jmp _flag

_end:
    mov RAX, 60
    mov rdi, 1
    syscall

_flag:
    mov RAX, 1
    mov RDI, 1
    mov rsi, msg2
    mov rdx, len2
    syscall
    
    jmp _end
