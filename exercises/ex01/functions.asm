;calculates length of a string

strlen:
	push rbx
	mov  rbx, rax

nextchar:
	cmp byte [rax], 0
	jz  finished
	inc rax
	jmp nextchar

finished: 
	sub rax, rbx
	pop rbx
	ret

str_print:
	push rdx
	push rcx
	push rbx
	push rax
	
	call strlen

	mov rdx, rax
	pop rax
	mov rsi, rax
	mov rdi, 1
	mov rax, 1
	syscall
	
	pop rbx
	pop rcx
	pop rdx
	ret

end_line:
	call str_print
	push rax

	mov rdx, 1
	mov rax, 0xa
	push rax
	mov rsi, rsp
	mov rdi, 1
	mov rax, 1
	syscall
	
	pop rax
	pop rax
	ret

exit:
	mov rax, 60
	mov rdi, 0
	syscall
	ret

 
	
	
