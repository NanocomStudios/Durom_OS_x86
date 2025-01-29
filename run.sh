export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot.asm" -f bin -o "boot.bin"
nasm "font.asm" -f elf -o "font.o"
nasm "kernel_entry.asm" -f elf -o "kernel_entry.o"
i386-elf-gcc -ffreestanding -m32 -g -c -o "kernel.o" kernel.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "VGA.o" VGA.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "malloc.o" malloc.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "io.o" io.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "keyboard.o" keyboard.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "Nstring.o" Nstring.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "Nmath.o" Nmath.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "GUI.o" GUI.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "ps2.o" ps2.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "hdd.o" hdd.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "PCI.o" PCI.cpp

#nasm "zeroes.asm" -f bin -o "zeroes.bin"

i386-elf-ld -o "full_kernel.bin" -Ttext 0x1000 "font.o" "kernel_entry.o" "kernel.o" "VGA.o" "malloc.o" "io.o" "keyboard.o" "Nstring.o" "Nmath.o" "GUI.o" "ps2.o" "hdd.o" "PCI.o" --oformat binary

cat "boot.bin" "full_kernel.bin"  > "OS.bin"
dd if=/dev/zero of=floppy.img ibs=1k count=20
dd if=OS.bin of=floppy.img conv=notrunc 
#qemu-system-x86_64.exe -drive format=raw,file="OS.bin",index=0,if=floppy,  -m 128M

