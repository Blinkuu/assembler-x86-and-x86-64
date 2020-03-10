section	.text
global _start     
              
_start:

  mov ecx, 10
l1:
   push rcx

   mov	rdx, len
   mov	rsi, msg
   mov	rdi, 1
   mov	rax, 1
   syscall

   pop rcx
   dec rcx
   jnz l1
                
   mov	eax, 60
   xor   rdi, rdi
   syscall

section	.data
msg db 'Hello, world!', 0xa
len equ $ - msg
