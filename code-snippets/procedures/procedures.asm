%define buffer_len 255

read_input:
   mov eax, 3 ; sys_read
   mov ebx, 0 ; stdin fd
   mov edx, buffer_len ; size
   int 0x80
   ret

print_buffer:
   push ebp
   mov ebp, esp

   mov eax, 4 ; sys_write
   mov ebx, 1 ; stdout
   mov edx, [ebp + 8] ; size
   mov ecx, [ebp + 12] ; buffer
   int 0x80

   pop ebp
   ret

print_range:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    sub eax, ebx
    mov ecx, eax

l1:
    push ecx
    
    push char
    push char_len
    call print_buffer
    pop ecx
    pop ecx

    pop ecx
    loop l1

    push new_line
    push char_len
    call print_buffer
    pop ecx
    pop ecx

    pop ebp
    ret

section	.text
global _start     
              
_start:

   mov ecx, buffer1
   call read_input
   
   mov ecx, buffer2
   call read_input

   push dword [buffer1]
   push dword [buffer2]
   call print_range

   mov eax, 1
   int 0x80

section .data
   char db 'A', 0x0
   new_line db 0xA, 0x0
   char_len equ 0x1

section	.bss
   buffer1 resb buffer_len
   buffer2 resb buffer_len

