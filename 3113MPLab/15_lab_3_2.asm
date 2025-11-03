;Scan a variable n. Print the multiplication table of n (from 1 to 10).
extern printf
extern scanf

SECTION .data
n: dq 0
i: dq 1
res: dq 0
in_fmt: db "%ld",0
out_fmt: db "%ld x %ld = %ld",10,0

SECTION .text
global main
main:
    push rbp

    mov rdi, in_fmt
    mov rsi,n
    call scanf

    mov qword [i],1
loop:
    mov rax,[n]
    mov rbx,[i]
    imul rax,rbx
    mov [res],rax

    mov rdi, out_fmt
    mov rsi,[n]
    mov rdx,[i]
    mov rcx,[res]
    xor rax,rax
    call printf

    add qword [i],1
    cmp qword [i],11
    jl loop

    pop rbp
    mov rax,0
    ret