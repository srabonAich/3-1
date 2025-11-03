extern printf
extern scanf

SECTION .data
x:   dq 0             ; store user input
sum: dq 0             ; running total
i:   dq 0             ; loop counter

enter:    db "Enter a positive integer:",0
in_fmt:   db "%ld",0
out_fmt:  db "Sum from 1 to %ld = %ld",10,0
out_fmt_2: db "%s",10,0

SECTION .text
global main
main:
    push rbp

    ; --- Print prompt ---
    mov rax,0
    mov rdi,out_fmt_2
    mov rsi,enter
    call printf

    ; --- Read x ---
    mov rax,0
    mov rdi,in_fmt
    mov rsi,x
    call scanf

    ; --- Initialize sum = 0, i = 1 ---
    mov qword [sum],0
    mov qword [i],1

.loop_start:
    mov rax,[i]
    cmp rax,[x]        ; if i > x
    jg .loop_end       ; break loop

    ; sum += i
    mov rbx,[sum]
    add rbx,rax
    mov [sum],rbx

    ; i++
    inc rax
    mov [i],rax

    jmp .loop_start

.loop_end:
    ; --- Print the result ---
    mov rdi,out_fmt
    mov rsi,[x]
    mov rdx,[sum]
    mov rax,0
    call printf

    pop rbp
    mov rax,0
    ret
