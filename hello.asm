section .data

    hello db 'Hello World', 0xa, 0xd
    length equ $ - hello
    
    
section .text


global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, length
    
    int 0x80
    
    
    mov eax, 1
    mov ebx, 0
    
    int 0x80