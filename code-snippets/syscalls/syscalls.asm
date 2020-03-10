section .data                           
   welcome_msg db 'Please enter a number: '
   welcome_msg_len equ $-welcome_msg            
   information_msg db 'You have entered: '
   information_msg_len equ $-information_msg                 
    
   input_buffer_len dd 10

section .bss
   input_buffer resb 10
	
section .text
   global _start
	
_start:
   mov eax, 4 ; syswrite
   mov ebx, 1 ; file_descriptor - stdout
   mov ecx, welcome_msg ; message string
   mov edx, welcome_msg_len ; message length
   int 80h ; interrupt

   mov eax, 3 ; sysread
   mov ebx, 0 ; file_descriptor - stdin
   mov ecx, input_buffer ; buffer
   mov edx, input_buffer_len ; buffer size
   int 80h ; interrupt
	
   mov eax, 4 ; syswrite
   mov ebx, 1 ; file_descriptor - stdout
   mov ecx, information_msg ; message string
   mov edx, information_msg_len ; message length
   int 80h ; interrupt 

   mov eax, 4
   mov ebx, 1
   mov ecx, input_buffer
   mov edx, input_buffer_len
   int 80h  
    
   mov eax, 1
   mov ebx, 0
   int 80h
