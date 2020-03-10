#!/bin/zsh
nasm -f elf64 $1.asm && ld $1.o && ./a.out
