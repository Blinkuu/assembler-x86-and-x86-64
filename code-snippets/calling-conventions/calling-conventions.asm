global _start

extern printf

section .data
	align 4
	a:	dd 1
	b:	dd 2
	c:	dd 3
	fmtStr:	db "Result: %d", 0x0A, 0

section .bss
	align 4

section .text
				
;
; int func( int a, int b, int c )
; {
;	return a + b + c ;
; }
;
func:
	push	ebp
	mov	ebp, esp
				
	mov	eax, [ebp+8]
	mov	edx, [ebp+12]
	lea	eax, [eax+edx]
	add	eax, [ebp+16]
	pop	ebp
	ret

_start:
	push	dword [c]
	push	dword [b]
	push	dword [a]
	call	func
	add	esp, 12
	push	eax
	push	dword fmtStr
	call	printf
	add	esp, 8

	sub	esp, 12
	mov	ecx, [b]
	mov	eax, [a]
	mov	[esp+8], dword 4
	mov	[esp+4], ecx
	mov	[esp],	 eax
	call	func

	mov	[esp+4], eax
	lea	eax, [fmtStr]
	mov	[esp], eax
	call	printf

	mov	ebx, 0
	mov	eax, 1
	int 	0x80
  