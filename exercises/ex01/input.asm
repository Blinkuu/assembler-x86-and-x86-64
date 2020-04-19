%include 'functions.asm'
section .text
	global _start

_start:
	mov rax, ask
	call str_print

	mov rdx, 4
	mov rsi, input
	mov rbx, 0
	mov rax, 0
	syscall

	mov rax, ask
	call str_print

	mov rdx, 4
	mov rsi, input + 4
	mov rbx, 0
	mov rax, 0
	syscall

	mov rax, ask
	call str_print

	mov rdx, 4
	mov rsi, input + 8
	mov rbx, 0
	mov rax, 0
	syscall

	mov ebx, [input]
	sub ebx, '0'
	mov ecx, [input + 4]
	sub ecx, '0'
	mov edx, [input + 8]
	sub edx, '0'

	cmp bl, cl
	jg a_b
	jmp b_a

a_b:
	cmp bl, dl
	jg a_max
	jmp c_max

b_a: 
	cmp cl, dl
	jg b_max
	jmp c_max

a_max:
	add cl, dl
	cmp cl, bl
	jg print_yes
	jmp print_no

b_max:
	add bl, dl
	cmp bl, cl
	jg print_yes
	jmp print_no

c_max:
	add bl, cl
	cmp bl, dl
	jg print_yes
	jmp print_no

print_yes:
	mov rax, yes
	call end_line
	call exit

print_no:
	mov rax, no
	call end_line
	call exit

section .data
ask: db 'Please enter number: ', 0x0
yes:      db 'Yes', 0x0
no:       db 'No', 0x0

section .bss
input: resd 3
