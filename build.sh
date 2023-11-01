#!/bin/bash

nasm -f elf64 -o Reverser.o Reverser.asm
gcc -c -o main.o main.c -no-pie
gcc -o Reverser main.o Reverser.o -no-pie
./Reverser 1
