extern printf
extern scanf

SECTION .data
n:      dq 0
rev:    dq 0
in_fmt: db "%ld",0
out_fmt: db "%ld",10,0

SECTION .text
global main
main:
    push rbp

    mov rdi, in_fmt
    mov rsi, n
    call scanf

    
    mov rax, [n]
    mov rcx, 0          

reverse_loop:
    cmp rax, 0
    je print_result
    mov rdx, 0
    mov rbx, 10
    div rbx             ; rax = rax / 10, rdx = rax % 10
    imul rcx, rcx, 10   
    add rcx, rdx        
    jmp reverse_loop

print_result:
    mov [rev], rcx
    mov rdi, out_fmt
    mov rsi, [rev]
    mov rax, 0
    call printf

    pop rbp
    mov rax, 0
    ret




