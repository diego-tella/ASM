                                                                                                 
global _main

section .data
    hello: db 'Hello, World',0xa ; define variable hello (0x0a is the \n byte)

section .text
_main:
    mov eax, 0x4 ; mov eax 0x4 to define the syscal write
    mov ebx, 0x1 ; mob ebx 0x1 the file descriptor
    mov ecx, hello ;variable
    mov edx, 15 ; mov edx the lenght of the variable
    int 0x80 ; call syscall (in i386)
    mov eax, 1 ; to call exit syscall
    int 0x80 ; call syscall (in i386)


; nasm -f elf32 helloworld.asm    
; ld helloworld.o -o helloWorld --entry _main -m elf_i386
