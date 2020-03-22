segment	.text
global _start
              
_start:
   mov	rdx, len
   mov	rsi, msg
   mov	rdi, 1
   mov	rax, 1
   syscall   
              
   add byte [zero_initialized], 'A'
   add byte [zero_initialized + 1], 0xA 

   mov	rdx, 2
   mov	rsi, zero_initialized
   mov	rdi, 1
   mov	rax, 1
   syscall   

   mov	eax, 60
   xor   rdi, rdi
   syscall

segment	.data
msg db 'Hello, segments!', 0xa
len equ $ - msg

segment .bss
zero_initialized resb 5
