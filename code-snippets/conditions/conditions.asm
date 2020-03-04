section	.text
global _start     
              
_start:
loop1:
   mov edx, counter_msg_len 
   mov ecx, counter_msg
   mov ebx, 1
   mov eax, 4
   int 80h
  
   mov eax, [counter]
   add eax, '0'
   mov [counter], eax

   mov edx, 4 
   mov ecx, counter
   mov ebx, 1
   mov eax, 4
   int 80h

   mov eax, [counter]
   sub eax, '0'
   mov [counter], eax
  
   mov edx, 1
   mov ecx, new_line
   mov ebx, 1
   mov eax, 4
   int 80h

   mov ecx, [counter]
   dec ecx
   mov [counter], ecx
   jnz loop1  

   mov	eax,1
   int	0x80

section	.data
odd_number db 0x3
even_number db 0x8
counter dd 0x5
counter_msg db 'Counter: '
counter_msg_len equ $ - counter_msg
new_line db 0xA
