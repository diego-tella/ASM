section .data
    msg1: db "Qual seu nome: "
    len1: equ $ - msg1


    msg2: db "Bem vindo, "
    len2: equ $ - msg2

    msg3: db "!",10

section .bss
    nome resb 50 ;buffer


section .text
    global _start

_start:
    ;Qual seu nome? syscall write
    mov RAX, 1
    mov RDI, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    ;syscall read para ler nome
    mov RAX, 0
    mov RDI, 0
    mov RSI, nome
    mov RDX, 50
    syscall

    ;syscall write para escrever Bem vindo
    mov RAX, 1
    mov RDI, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

 ;syscall para escrever o nome
 ;   MOV RAX, 1
 ;   mov RDI, 1
 ;   mov rsi, nome
 ;   mov RDX, 50
 ;   syscall

    mov r8, nome ;coloca o valor de nome para r8

_print_char:
    mov rax, 1
    mov rdi, 1
    mov rsi, r8
    mov rdx, 1 ;imprimir apenas um byte de r8 (uma letra do registrador)
    syscall

    inc r8 ;incrementa o valor de r8, ou seja: endereço da memória + 1 (próximo byte na memória)
    cmp byte [r8], 10 ;compara o valor desse byte com 10 (em ascii uma quebra de linha)
    jne _print_char ;se não for uma quebra de linha, continua printando os bytes restantes. Se for, continua o programa

    ;syscall para printar exclamação e quebra de linha
    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, 2
    syscall

;syscall para sair do programa
_end:
    mov RAX, 60
    mov rdi, 1
    syscall
