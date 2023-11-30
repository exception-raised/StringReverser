section .data
format db "Result: %s", 10, 0  

; Maybe push string length onto the stack to perserve its value.
section .text

global reverse
extern printf

get_string_len:
    push rbp
    mov rbp, rsp
    xor rax, rax ; Clear rax
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
    xor r10, r10
    xor r9, r9
    call get_string_len
    mov r11, rax

    ; If the string length is 0;
    test r11, r11
    je __exit
    sub r11, 1 ; str_len - 1

__loop:
    cmp r9, r11
    jae  __exit
    mov al, [rdi + r11] ; Load the last character. Pointer j
    mov dl, [rdi + r9] ; Load the character to be swapped. Pointer i
    mov [rdi + r11], dl
    mov [rdi + r9], al ; Store the character from r11 at r9
    inc r9
    dec r11
    jmp __loop
__exit:
    mov rax, 60         ; syscall number for exit
    ; Exit status (0 for success)
    xor rdi, rdi
    leave
    ret
