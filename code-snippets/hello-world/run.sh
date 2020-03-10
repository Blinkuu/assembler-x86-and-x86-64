#!/bin/sh
nasm -f elf64 hello-world.asm && ld hello-world.o && ./a.out
