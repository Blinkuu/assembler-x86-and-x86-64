%define SYS_EXIT 60
%define EXIT_SUCCESS 0
%define SYSREAD 0
%define SYSWRITE 1
%assign FD_STDIN 0
%assign FD_STDOUT 1

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
   mov rax, SYSWRITE ; syswrite
   mov rdi, FD_STDOUT ; file_descriptor - stdout
   mov rsi, welcome_msg ; message string
   mov rdx, welcome_msg_len ; message length
   syscall

   mov rax, SYSREAD ; sysread
   mov rdi, FD_STDIN ; file_descriptor - stdin
   mov rsi, input_buffer ; buffer
   mov rdx, input_buffer_len ; buffer size
   syscall
	
   mov rax, SYSWRITE ; syswrite
   mov rdi, FD_STDOUT ; file_descriptor - stdout
   mov rsi, information_msg ; message string
   mov rdx, information_msg_len ; message length
   syscall

   mov rax, SYSWRITE
   mov rdi, FD_STDOUT
   mov rsi, input_buffer
   mov rdx, input_buffer_len
   syscall
    
   mov rax, SYS_EXIT 
   mov rdi, EXIT_SUCCESS
   syscall

