section	.text
global _start     
              
_start:

   mov rcx, 10
l1:
   push rcx

   mov	rax, 1
   mov	rdi, 1
   mov	rdx, len
   mov	rsi, msg
   syscall

   pop rcx

   ; dec rcx
   ; jnz l1
   loop l1
                
   mov	eax, 60
   xor   rdi, rdi
   syscall

section	.data
msg db 'Hello, world!', 0xa
len equ $ - msg
