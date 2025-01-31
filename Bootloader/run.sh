export PATH=$PATH:/usr/local/i386elfgcc/bin

nasm "boot.asm" -f bin -o "../BIN/boot.bin"
nasm "../Graphics/font.asm" -f elf -o "../BIN/font.o"
nasm "boot2step.asm" -f elf -o "../BIN/boot2step.o"
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/bootloader.o" bootloader.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/VGA.o" ../Graphics/VGA.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/malloc.o" ../StdLib/malloc.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/io.o" ../IO/io.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/Nstring.o" ../StdLib/Nstring.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/Nmath.o" ../StdLib/Nmath.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/GUI.o" ../Graphics/GUI.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/hdd.o" ../Storage/hdd.cpp
i386-elf-gcc -ffreestanding -m32 -g -c -o "../BIN/PCI.o" ../IO/PCI.cpp

#nasm "zeroes.asm" -f bin -o "zeroes.bin"
cd ../BIN/
i386-elf-ld -o "full_kernel.bin" -Ttext 0x1000 "font.o" "boot2step.o" "bootloader.o" "VGA.o" "malloc.o" "io.o" "Nstring.o" "Nmath.o" "GUI.o" "hdd.o" "PCI.o" --oformat binary

cat "boot.bin" "full_kernel.bin"  > "BOOTLOADER.bin"

cd ../OUT/
dd if=/dev/zero of=BOOTLOADER.img ibs=1k count=20
dd if=../BIN/BOOTLOADER.bin of=BOOTLOADER.img conv=notrunc 
#qemu-system-x86_64.exe -drive format=raw,file="OS.bin",index=0,if=floppy,  -m 128M

