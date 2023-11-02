section .data
testString db "test", 0 
format db "Char: %s", 10, 0  

section .text

global reverse
extern strlen, printf

reverse:
    push rbp
    mov rbp, rsp
    xor r10, r10
    xor r9, r9
    mov rdi, testString
    call strlen
    mov r11, rax

    ; If the string length is 0;
    test r11, r11
    jz __print
    jmp __loop

    __loop:
        cmp r9, r11
        jae  __print
        mov al, [rdi + r9] ; Loads the next character
        ;lea r8, [testString]
        ; add r8, r9
        ; mov al, 'x'
        ; mov [r8], al
        ; inc r9
        ; inc r10
        mov [rdi + r9], al 
        inc r9

        jmp __loop
    __print:
        mov rsi, testString
        mov rdi, format
        call printf

    leave
    ret
