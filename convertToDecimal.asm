section .data
    num: db "123",10

section .text
    global _start

_start:
    xor rax, rax
    mov rcx, num

_loop_bytes:
    mov bl, byte[rcx] ;copia para bl o byte no endereco em RDX
    inc rcx           ;incrementa rcx para apontar para o proximo byte no endereco

    cmp bl, 0x30      ;compara o byte de bl com 0x30 (0)
    jl _exit          ;se o atual byte de bl for menor ou igual a 0, pula para a saida (conta com o 0x0a ja que eh 10 em decimal)

    cmp bl, 0x39
    jg _exit          ;comparacao para ver se o byte for maior que 9. So pode ser um numero de 0 a 9.

    sub bl, 0x30      ;subtrai 0x30 do numero, para tornar o numero em decimal. Exemplo 3 (0x33) - 0 (0x30) = 3
    imul rax, 10      ;multiplica rax por 10 para deslocar uma casa na esquerda, podendo somar al a bl. Exemplo 123: 1.10 = 10+2 12 == 12.10 = 120+3 = 123 --> valor do rotulo NUM
    add al, bl        ;soma o valor do ultimo byte de RAX ao valor inteiro

    jmp _loop_bytes

_exit
    ;se dermos um inc rax, ele irá ter o valor decimal de 124.
    mov rax, 60
    mov rdi, 0
    syscall
