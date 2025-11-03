extern printf
extern scanf

SECTION .data
    in_fmt:     db "%s", 0
    out_fmt:    db "Reversed string: %s", 10, 0

SECTION .bss
    str: resb 100       

SECTION .text
    global main

main:
    push rbp

    mov rdi, in_fmt     
    lea rsi, [str]       
    xor rax, rax
    call scanf

    lea rdi, [str]      
    call reverse_str

    mov rdi, out_fmt
    lea rsi, [str]
    xor rax, rax
    call printf

    mov rax, 0
    pop rbp
    ret


reverse_str:
    push rbp
    mov rbp, rsp
    mov rsi, rdi          
    mov rcx, 0             

.find_len:
    mov al, [rdi]         
    cmp al, 0
    je .len_found
    inc rcx
    inc rdi
    jmp .find_len

.len_found:
    dec rdi                
    mov rdx, rcx           
    shr rdx, 1             

.swap_loop:
    cmp rdx, 0
    je .done
    mov al, [rsi]
    mov bl, [rdi]
    mov [rsi], bl
    mov [rdi], al
    inc rsi
    dec rdi
    dec rdx
    jmp .swap_loop

.done:
    pop rbp
    ret