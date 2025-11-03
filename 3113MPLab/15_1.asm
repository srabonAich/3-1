extern printf
extern scanf

SECTION .data
    in_fmt:     db "%ld", 0          
    out_fmt:    db "Sum = %ld", 10, 0 

SECTION .bss
    a:  resq 1        
    b:  resq 1       
    res: resq 1       

SECTION .text
    global main

main:
    push rbp

    mov rdi, in_fmt      
    lea rsi, [a]         
    xor rax, rax         
    call scanf

    mov rdi, in_fmt
    lea rsi, [b]
    xor rax, rax
    call scanf

    mov rdi, [a]         
    mov rsi, [b]         
    call sum             

    mov [res], rax

    mov rdi, out_fmt     
    mov rsi, [res]       
    xor rax, rax         
    call printf

    mov rax, 0
    pop rbp
    ret

sum:
    push rbp
    mov rbp, rsp

    mov rax, rdi        
    add rax, rsi        

    pop rbp
    ret
