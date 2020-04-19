%define buffer_len 255
%define SYS_EXIT 60
%define EXIT_SUCCESS 0
%define SYSREAD 0
%define SYSWRITE 1
%define FD_STDIN 0
%define FD_STDOUT 1

read_input:
    push rbp
    mov rbp, rsp

    mov rax, SYSREAD
    mov rdi, FD_STDIN
    mov rdx, buffer_len
    syscall
    
    pop rbp
    ret

print_buffer:
    push rbp
    mov rbp, rsp
    
    mov rax, SYSWRITE
    mov rdi, FD_STDOUT
    mov rdx, [rbp + 24] ; size
    mov rsi, [rbp + 16] ; buffer
    syscall

    pop rbp
    ret

print_range:
    push rbp
    mov rbp, rsp
    
    mov rax, [rbp + 24] ; buffer2
    mov rax, [rax]
    mov rbx, [rbp + 16]
    mov rbx, [rbx]
    sub rax, rbx ; buffer1
    mov rcx, rax

l1:
    push rcx
 
    push char_len
    push char
    call print_buffer
    add rsp, 16

    pop rcx
    loop l1

    pop rbp
    ret

section .data
   char db 'A', 0x0
   new_line db 0xA, 0x0
   char_len equ 0x1

section	.bss
    buffer1 resb buffer_len
    buffer2 resb buffer_len

section	.text
global _start     
              
_start:

    mov rsi, buffer1
    call read_input
   
    mov rsi, buffer2
    call read_input

    push buffer2
    push buffer1
    call print_range
    add rsp, 16 

    mov rax, SYS_EXIT 
    mov rdi, EXIT_SUCCESS
    syscall

