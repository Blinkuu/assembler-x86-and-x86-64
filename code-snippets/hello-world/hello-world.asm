section	.text
global _start
              
_start:
   mov rdx, len
   mov rsi, msg
   mov	rdi, 1
   mov	rax, 1
   syscall   
                
   mov	eax, 60
   xor   rdi, rdi
   syscall

section	.data
msg db 'Hello, world!', 0xa
len equ $ - msg

