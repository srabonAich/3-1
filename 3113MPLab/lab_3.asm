;Problem: Write an assembly language program that performs the following tasks. 
;Declare an array to hold 20 integers. 
;Repeatedly read 20 integers from the user (one at a time). 
;For each integer, add it to a running sum. 
;Store the integers in the array. 
;After all 20 integers have been entered, print the total sum of the numbers. 
;Finally, print back all the numbers stored in the array in the order they were entered.


extern printf
extern scanf

SECTION .data
    cnt dq 0
    c dq 0
    sum dq 0
    out_fmt: db "%ld",10,0
    in_fmt: db "%ld",0

SECTION .bss
    arr: resq 21

SECTION .text
    global main
main:
    push rbp

Loop: 
    lea rdi, [rel in_fmt]
    lea rsi, [rel c]
    xor rax,rax
    call scanf
    mov rax,[rel c]

    add [sum],rax

    mov rcx,[rel cnt]
    mov [arr + rcx*8], rax

    inc rcx
    mov [cnt],rcx

    cmp rcx,20
    jnz Loop

    mov rax,0
    mov [cnt],rax

    mov rdi,out_fmt
    mov rsi,[sum]
    xor rax,rax
    call printf

Print:
    mov rcx,[cnt]
    mov rcx, [arr + rcx*8]
    lea rdi, [rel out_fmt]
    mov rsi, rcx
    mov rax,0
    call printf

    mov rcx,[rel cnt]
    inc rcx
    mov [cnt],rcx

    cmp rcx,20
    jnz Print

    pop rbp
    mov rax,0
    ret




; extern printf
; extern scanf

; SECTION .data
; cnt:        dq 0
; c:          dq 0
; sum:        dq 0
; out_fmt:    db "%ld", 10, 0
; in_fmt:     db "%ld", 0

; SECTION .bss
; arr:        resq 21

; SECTION .text
; global main

; main:
;     push rbp
;     mov rbp, rsp

;     xor rcx, rcx

; input_loop:
;     lea rdi, [rel in_fmt]
;     lea rsi, [rel c]
;     xor rax, rax
;     call scanf

;     mov rax, [rel c]
;     add qword [rel sum], rax
;     mov [rel arr + 8*rcx], rax

;     inc rcx
;     cmp rcx, 20
;     jne input_loop

;     lea rdi, [rel out_fmt]
;     mov rsi, [rel sum]
;     xor rax, rax
;     call printf

;     xor rcx, rcx

; print_loop:
;     mov rax, [rel arr + 8*rcx]
;     lea rdi, [rel out_fmt]
;     mov rsi, rax
;     xor rax, rax
;     call printf

;     inc rcx
;     cmp rcx, 20
;     jne print_loop

;     pop rbp
;     mov rax, 0
;     ret
