extern system 
global _main

section .text

_main:
    push 0x00657865 ;push exe
    push 0x2E646D63 ; push cmd.
    push ESP 
    POP EAX ; get stack
    PUSH EAX ; send it back to the stack
    MOV EAX, 0x774a3d30 ; set system address
    CALL EAX ; call it
