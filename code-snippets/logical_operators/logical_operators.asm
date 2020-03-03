section	.text
global _start     
              
_start:
   mov ebx, [odd_number]
   and ebx, 0x1
   add ebx, '0'

   mov [result], ebx
   
   mov edx, 1
   mov ecx, result
   mov ebx, 1
   mov eax, 4
   int 80h
   
   mov ebx, [even_number]
   and ebx, 0x01
   add ebx, '0'

   mov [result], ebx
   
   mov edx, 1
   mov ecx, result
   mov ebx, 1
   mov eax, 4
   int 80h

   mov	eax,1
   int	0x80

section	.data
odd_number db 0x3
even_number db 0x8

section .bss
result resb 4
