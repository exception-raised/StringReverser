section .data
testString db "test", 0 
format db "Length: %d", 10, 0  

section .text

global reverse
extern strlen, printf

reverse:
    push rbp
    mov rbp, rsp
    mov rdi, testString
    call strlen
    mov rdi, format
    mov rsi, rax  ; rax contains the length
    call printf
    leave
    ret
