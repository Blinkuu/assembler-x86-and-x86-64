STDIN equ 0
STDOUT equ 1
SYS_READ equ 0
SYS_WRITE equ 1

console_read:
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, buffer_size
    
    syscall 

console_write:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, buffer_size
    syscall   

    ret

to_upper:
    mov rsi, 0

l3:
    cmp rsi, buffer_size
    jg l1
    
    mov al, byte [buffer + rsi * 1] 
    cmp al, 'a' 
    jl l2
    
    cmp al, 'z'
    jg l2

    sub al, 32
    mov byte [buffer + rsi * 1], al

l2:
    inc rsi
    jmp l3

l1:
    ret
    

section	.data
buffer times 10 db 0x0
buffer_size equ $ - buffer - 1

section	.text
global _start     
_start:
   
    call console_read
    call to_upper
    call console_write 

    mov	eax, 60
    xor   rdi, rdi
    syscall

