section .data
    hello db 'Hello, World!',0

section .text
    global _start

_start:
    ; Write 'Hello, World!' to stdout (file descriptor 1)
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, 13
    int 0x80  ; Invoke syscall

    ; Exit the program
    mov eax, 1
    int 0x80
