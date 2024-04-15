;this program will get the first argument and print it. (x64)
;when you pass an argument, it goes to the stack. This program is a demonstration of how it works. It gets the number o args in the stack, verify if there is args and then get the arg in the stack.
section .data
    arg_error: db "Pass one argument!",10
    size_arg: equ $ - arg_error

    arg_info: db "The argument you passed is: "
    size_arg_info: equ $ - arg_info

    break_line: db 10
section .text
    global _start

_start:
    mov r8, [rsp] ;number of arguments. By deault it is in the stack
    cmp r8, 2 ;check if there is 2 arguments. (first one is the program itself)
    jne _argument_error
    mov rsi, arg_info
    mov rdx, size_arg_info
    call _write
    mov r8, [rsp+16]
    call _write_byte
    jmp _exit

_write_byte:
    mov rsi, r8
    mov rdx, 1
    call _write
    inc r8
    cmp byte[r8], 00
    je _write_null
    jmp _write_byte

_write_null:
    mov rsi, break_line
    mov rdx, 1
    call _write
    jmp _exit

_write:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

_argument_error:
    mov rsi, arg_error
    mov rdx, size_arg
    call _write
    jmp _exit

_exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall
