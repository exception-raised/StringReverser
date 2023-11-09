section .data
testString db "thisisnowreversed", 0 
format db "Char: %s", 10, 0  

; tset
; Maybe push string length onto the stack to perserve its value.
section .text

global reverse
extern strlen, printf

reverse:
    push rbp
    mov rbp, rsp
    xor r10, r10
    xor r9, r9
    ;mov r8, rdi
    mov rdi, testString
    call strlen
    mov r11, rax

    ; ; If the string length is 0;
    test r11, r11
    sub r11, 1 ; str_len - 1
    jz __print
    ; jmp __loop

    __loop:
        cmp r9, r11
        jae  __print
        lea r10, [rdi]
        ;mov rbx, r10
        mov al, [rdi + r11] ; Load the last character
        mov dl, [rdi + r9] ; Load the character to be swapped
        ;mov byte [r10 + r11], 'r' ; Store the character from r9 at r11
        mov [r10 + r11], dl
        mov [rdi + r9], al ; Store the character from r11 at r9
        inc r9
        dec r11
        jmp __loop


        ;jmp __loop
    __print:
        ;mov rsi, r10
        ;mov r10, testString
        ;mov byte [r10], 'r'
        mov rsi, rdi
        mov rdi, format
        call printf

    leave
    ret
