#!/bin/bash

nasm -f elf64 -o Reverser.o Reverser.asm
gcc -c -o main.o main.c -no-pie
gcc -o Reverser main.o Reverser.o -no-pie
if [ $# -lt 1 ]; then
    echo "Usage: $0 <your_value>"
    exit 1
fi

value=$1

./Reverser "$value"
