[BITS 16]
[org 0x7c00]

tmpBuffer equ 0x1000
mov [BOOT_DISK], dl                 
                              
xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov ax, [0x7c00 + 446 + 8]
mov [lbaTmp], ax
mov [d_lba], ax

call loadSector

mov ax, [lbaTmp]
clc
add ax, [tmpBuffer + 14] 
add ax, [tmpBuffer + 36]
add ax, [tmpBuffer + 36]
mov [d_lba], ax

call loadSector

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

loadSector:
    mov si, DAPACK		; address of "disk address packet"
    mov ah, 0x42		; AL is unused
    mov dl, 0x80		; drive number 0 (OR the drive # with 0x80)
    int 0x13
    jc short error
	ret

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
lbaTmp:	db 0

DAPACK:
	db	0x10
	db	0
blkcnt:	dw	1		; int 13 resets this to # of blocks actually read/written
db_add:	dw	0x1000		; memory buffer destination address (0:7c00)
	dw	0		; in memory page zero
d_lba:	dd	0		; put the lba to read in this spot
	dd	0		; more storage bytes only for big lba's ( > 4 bytes )


times 446-($-$$) db 0

partitionState  db 0
CHSBegin        db 02, 03, 00
partitionType   db 0x0c
CHSEnd          db 0xfe, 0x3f, 0x81
LBABegin        db 0x80, 0, 0, 0
partitionSize   db 0, 0xe8, 0x1f, 0

times 510-($-$$) db 0  
dw 0xaa55