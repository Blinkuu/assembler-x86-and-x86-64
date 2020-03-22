section .data                           
   welcome_msg db 'Please enter a message: '
   welcome_msg_len equ $-welcome_msg            
   information_msg db 'You have entered: '
   information_msg_len equ $-information_msg                 
    
   input_buffer_len dd 10

section .bss
   input_buffer resb 10
	
section .text
   global _start
	
_start:
   mov rax, 1 ; syswrite
   mov rdi, 1 ; file_descriptor - stdout
   mov rsi, welcome_msg ; message string
   mov rdx, welcome_msg_len ; message length
   syscall

   mov rax, 0 ; sysread
   mov rdi, 0 ; file_descriptor - stdin
   mov rsi, input_buffer ; buffer
   mov rdx, input_buffer_len ; buffer size
   syscall
	
   mov rax, 1 ; syswrite
   mov rdi, 1 ; file_descriptor - stdout
   mov rsi, information_msg ; message string
   mov rdx, information_msg_len ; message length
   syscall

   mov rax, 1
   mov rdi, 1
   mov rsi, input_buffer
   mov rdx, input_buffer_len
   syscall
    
   mov rax, 60 
   mov rdi, 0
   syscall

