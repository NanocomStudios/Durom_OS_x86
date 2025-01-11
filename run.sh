export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot.asm" -f bin -o "boot.bin"
nasm "kernel_entry.asm" -f elf -o "kernel_entry.o"
i386-elf-gcc -ffreestanding -m32 -g -c -o "kernel.o" kernel.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "screen.o" screen.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "malloc.o" malloc.cpp
nasm "zeroes.asm" -f bin -o "zeroes.bin"

i386-elf-ld -o "full_kernel.bin" -Ttext 0x1000 "kernel_entry.o" "kernel.o" "screen.o" "malloc.o" --oformat binary

cat "boot.bin" "full_kernel.bin" "zeroes.bin"  > "OS.bin"
qemu-system-x86_64.exe -drive format=raw,file="OS.bin",index=0,if=floppy,  -m 128M