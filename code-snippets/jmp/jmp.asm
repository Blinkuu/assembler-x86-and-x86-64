section .text
  global _start

_start:
  mov rbx, msg
  mov rax, rbx

nextchar:
  cmp byte [rax], 0
  jz finished
  inc rax
  jmp nextchar

finished:
  sub rax, rbx

  mov rdx, rax
  mov rsi, msg
  mov rdi, 1
  mov rax, 1
  syscall

  mov rax, 60
  mov rdi, 0
  syscall

section .data
msg: db "Hello, World", 0xa
