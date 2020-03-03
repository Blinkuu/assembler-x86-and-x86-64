section	.text
global _start     
              
_start:
   mov eax, [counter]
   inc eax
   inc eax
   inc eax
   add eax, '0'

   mov [buffer], eax

   mov	edx, buffer_len
   mov	ecx, buffer
   mov	ebx,1
   mov	eax,4 
   int	0x80     
                
   mov	eax,1
   int	0x80

section	.data
buffer_len db 11 
counter dd 0

section .bss
buffer resb 10
