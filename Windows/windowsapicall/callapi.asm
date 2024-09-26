section .data
    title db "Message Title", 0       
    message db "Hello, World!", 0        

section .text
    global _start                      

extern MessageBoxA                       ; Import the MessageBoxA function
extern ExitProcess                       ; Import the ExitProcess function

_start:
    ; Arguments for MessageBoxA: (HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType)
    ; Push them on the stack in reverse order (right to left).

    push 0                               ; uType (MB_OK = 0)
    push title                           ; lpCaption (pointer to the title string)
    push message                         ; lpText (pointer to the message string)
    push 0                               ; hWnd (no parent window, so NULL)
    call MessageBoxA                     ; Call MessageBoxA

    ; Now, call ExitProcess to exit the program
    push 0                               ; Exit code
    call ExitProcess                     ; Call ExitProcess


;nasm -f win32 -o myprog.obj file.asm
;GoLink /entry _start myprog.obj user32.dll kernel32.dll
