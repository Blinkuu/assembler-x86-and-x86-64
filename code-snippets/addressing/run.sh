#!/bin/zsh
nasm -f elf $1.asm && ld -m elf_i386 -s $1.o && ./a.out
