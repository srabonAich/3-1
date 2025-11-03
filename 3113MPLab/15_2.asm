extern printf
extern scanf

SECTION .data
    in_fmt:     db "%ld", 0                
    out_fmt:    db "The larger number is: %ld", 10, 0   ; printf format: "%ld\n"

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
    call max_of_two     

    mov [res], rax

    mov rdi, out_fmt
    mov rsi, [res]
    xor rax, rax        
    call printf

    mov rax, 0
    pop rbp
    ret


max_of_two:
    push rbp
    mov rbp, rsp

    mov rax, rdi        
    cmp rdi, rsi
    jge done            
    mov rax, rsi       

done:
    pop rbp
    ret
