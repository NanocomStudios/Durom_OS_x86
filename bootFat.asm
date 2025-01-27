[BITS 16]
tmpBuffer equ 0x1000
mov [BOOT_DISK], dl                 
                              
;xor ax, ax                          
;mov es, ax
;mov ds, ax
;mov bp, 0x8000
;mov sp, bp
mov bx, tmpBuffer
mov dh ,1

mov ah, 0x02
mov al, dh
mov ch, 0x00
mov dh, 0x02
mov cl, 0x03
mov dl, [BOOT_DISK]
int 0x13                ; no error management, do your homework!

mov ax, lbaTmp
mov bx, [tmpBuffer + 14] 
add ax, bx
mov bx, [tmpBuffer + 36]
shl bx, 1
add ax, bx
;mov [d_lba], ax

jmp readDisk

DAPACK:
	db	0x10
	db	0
blkcnt:	dw	1		; int 13 resets this to # of blocks actually read/written
db_add:	dw	tmpBuffer		; memory buffer destination address (0:7c00)
	dw	0		; in memory page zero
d_lba:	dd	0		; put the lba to read in this spot
	dd	0		; more storage bytes only for big lba's ( > 4 bytes )

readDisk:

	mov si, DAPACK		; address of "disk address packet"
	mov ah, 0x42		; AL is unused
	mov dl, [BOOT_DISK]		; drive number 0 (OR the drive # with 0x80)
	int 0x13


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
	
;jmp KERNEL_LOCATION                    
 
BOOT_DISK: db 0
kernelName: db "KERNEL  BIN"
lbaTmp: dw 0x80

times 446-($-$$) db 0

partitionState  db 0
CHSBegin        db 02, 03, 00
partitionType   db 0x0c
CHSEnd          db 0xfe, 0x3f, 0x81
LBABegin        db 0x80, 0, 0, 0
partitionSize   db 0, 0xe8, 0x1f, 0

times 510-($-$$) db 0  
dw 0xaa55