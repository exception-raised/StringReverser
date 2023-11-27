section .data
format db "Char: %s", 10, 0  

; Maybe push string length onto the stack to perserve its value.
section .text

global reverse
extern strlen, printf

reverse:
    push rbp
    mov rbp, rsp
    xor r10, r10
    xor r9, r9
    call strlen
    mov r11, rax

    ; If the string length is 0;
    test r11, r11
    jz __print
    sub r11, 1 ; str_len - 1

    __loop:
        cmp r9, r11
        jae  __print
        mov al, [rdi + r11] ; Load the last character. Pointer j
        mov dl, [rdi + r9] ; Load the character to be swapped. Pointer i
        mov [rdi + r11], dl
        mov [rdi + r9], al ; Store the character from r11 at r9
        inc r9
        dec r11
        jmp __loop

    __print:
        mov rsi, rdi
        mov rdi, format
        call printf

    leave
    ret
