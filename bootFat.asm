[BITS 16]
[org 0x7c00]

tmpBuffer equ 0x1000
mov [BOOT_DISK], dl                 
                              
xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x9000
mov sp, bp

mov al, 0xE0
mov dx, 0x1f6
out dx, al

call hddWait

mov al, 1
mov dx, 0x1f2
out dx, al

mov bx, lbaTmp
mov dx, 0x1f3
mov al, 0x80
out dx, al

mov al, 0x20
mov dx, 0x1f4
out dx, al

mov al, 0
mov dx, 0x1f5
out dx, al

mov al, 0x20
mov dx, 0x1f7
out dx, al

mov cx, 0
mov bx, tmpBuffer

readLoop:
	call hddWait

	mov dx, 0x1f7
	in al, dx

	and al, 8
	cmp al, 8
	jne loopEnd

	cmp cx, 256
	je loopEnd

	mov dx, 0x1f0
	in ax, dx

	mov [bx], al
	add bx, 1
	mov [bx], ah
	add bx, 1
	add cx, 1

	jmp readLoop

loopEnd:

mov bx, tmpBuffer
mov cx, 0
printLoop:
push bx
mov al, [bx]
mov ah, 0xe
mov bh, 0
mov bl, 7
int 10h
pop bx
add bx, 1
add cx, 1
cmp cx, 512
jne printLoop



jmp $

error:

mov al, 69
mov ah, 0xe
mov bh, 0
mov bl, 7
int 10h

jmp $

	
hddWait:
	push dx
	push ax
    clc
	mov dx, 0x1f7
	in al, dx
	and al, 128
	cmp al, 128
	je hddWait
	
	pop ax
	pop dx
	ret


;jmp KERNEL_LOCATION                    
 
BOOT_DISK: db 0
kernelName: db "KERNEL  BIN"
lbaTmp:	db 0x80

times 446-($-$$) db 0

partitionState  db 0
CHSBegin        db 02, 03, 00
partitionType   db 0x0c
CHSEnd          db 0xfe, 0x3f, 0x81
LBABegin        db 0x80, 0, 0, 0
partitionSize   db 0, 0xe8, 0x1f, 0

times 510-($-$$) db 0  
dw 0xaa55