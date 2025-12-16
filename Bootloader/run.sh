export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot.asm" -f bin -o "../BIN/boot.bin"
nasm "../Graphics/font.asm" -f elf64 -o "../BIN/font.o"
nasm "boot2step.asm" -f elf64 -o "../BIN/boot2step.o"

# x86_64-elf-gcc -ffreestanding -S -o "../ASM/kernel.s" kernel.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/bootloader.s" bootloader.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/VGA.s" ../Graphics/VGA.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/malloc.s" ../StdLib/malloc.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/io.s" ../IO/io.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/PCI.s" ../IO/PCI.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/ps2.s" ../IO/ps2.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/keyboard.s" ../HID/keyboard.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/Nstring.s" ../StdLib/Nstring.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/Nmath.s" ../StdLib/Nmath.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/GUI.s" ../Graphics/GUI.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/hdd.s" ../Storage/hdd.cpp
x86_64-elf-gcc -ffreestanding -S -o "../ASM/fat32.s" ../Storage/fat32.cpp


# x86_64-elf-as ../ASM/kernel.s -o "../BIN/kernel.o"
x86_64-elf-as ../ASM/bootloader.s -o "../BIN/bootloader.o"
x86_64-elf-as ../ASM/VGA.s -o "../BIN/VGA.o"
x86_64-elf-as ../ASM/malloc.s -o "../BIN/malloc.o"
x86_64-elf-as ../ASM/io.s -o "../BIN/io.o"
x86_64-elf-as ../ASM/PCI.s -o "../BIN/PCI.o"
x86_64-elf-as ../ASM/ps2.s -o "../BIN/ps2.o"
x86_64-elf-as ../ASM/keyboard.s -o "../BIN/keyboard.o"
x86_64-elf-as ../ASM/Nstring.s -o "../BIN/Nstring.o"
x86_64-elf-as ../ASM/Nmath.s -o "../BIN/Nmath.o"
x86_64-elf-as ../ASM/GUI.s -o "../BIN/GUI.o"
x86_64-elf-as ../ASM/hdd.s -o "../BIN/hdd.o"
x86_64-elf-as ../ASM/fat32.s -o "../BIN/fat32.o"


#nasm "zeroes.asm" -f bin -o "zeroes.bin"
cd ../BIN/
x86_64-elf-ld -o "full_kernel.bin" -Ttext 0x1000 "font.o" "boot2step.o" "bootloader.o" "VGA.o" "malloc.o" "io.o" "Nstring.o" "Nmath.o" "GUI.o" "hdd.o" "PCI.o" "fat32.o" "ps2.o" "keyboard.o" --oformat binary

cat "boot.bin" "full_kernel.bin"  > "BOOTLOADER.bin"

cd ../OUT/
dd if=/dev/zero of=BOOTLOADER.img ibs=1k count=25
dd if=../BIN/BOOTLOADER.bin of=BOOTLOADER.img conv=notrunc 
qemu-system-x86_64.exe -drive format=raw,file="..\OUT\BOOTLOADER.img",index=0,if=floppy,  -m 128M

