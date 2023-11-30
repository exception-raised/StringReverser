section .data
format db "Result: %s", 10, 0  

section .text

global reverse
extern printf

get_string_len:
    push rbp
    mov rbp, rsp
    xor rax, rax            ; Clear rax, will contain the string length.
get_len:
    cmp byte [rdi + rax], 0 ; Check if current character is a null terminator.
    je  end

    inc rax
    jmp get_len

end:
    leave
    ret

reverse:
    push rbp
    mov rbp, rsp
    xor r9, r9 ; Counter
    call get_string_len
    mov r11, rax            ; rax contains the returned string length.

    test r11, r11           ; If the string length is 0, we exit, there is nothing to do.
    je __exit
    sub r11, 1              ; string_length - 1

__loop:
    cmp r9, r11             ; Do we our pointers match?
    jae  __exit
    mov al, [rdi + r11]     ; Load the last character. Pointer j
    mov dl, [rdi + r9]      ; Load the character to be swapped. Pointer i
    mov [rdi + r11], dl
    mov [rdi + r9], al      ; Store the character from r11 at r9
    inc r9
    dec r11
    jmp __loop
__exit:
    mov rax, 60             ; syscall number for exit
    xor rdi, rdi            ; Exit status (0 for success)
    leave
    ret
