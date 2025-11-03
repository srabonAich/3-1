;Scan a variable n. Print all divisors of n.
extern printf
extern scanf

SECTION .data
n: dq 0
i: dq 1
in_fmt: db "%ld",0
out_fmt: db "%ld",10,0

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
    xor rdx,rdx
    div rbx

    cmp rdx,0
    jne not_divisor

    mov rdi,out_fmt
    mov rsi,[i]
    mov rax,0
    call printf

not_divisor:
    add qword [i],1
    mov rax,[n]
    cmp qword [i], rax
    jbe loop

    pop rbp
    mov rax,0
    ret