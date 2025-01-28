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


mov al, [tmpBuffer + 13]
mov [secPerClus], al

mov ax, [lbaTmp]
add ax, [tmpBuffer + 14]
mov [fatBegin], ax 
add ax, [tmpBuffer + 36]
add ax, [tmpBuffer + 36]
mov [d_lba], ax
mov [lbaTmp], ax

mov al, [secPerClus]
mov [blkcnt], al

call loadSector

search_dir:
	popa

	mov ax, ds			; Root dir is now in [buffer]
	mov es, ax			; Set DI to this info
	mov di, tmpBuffer

	mov ax, [secPerClus]
	mov cx, 16
	mul cx
	mov cx, ax	; Search all (224) entries
	mov ax, 0			; Searching at offset 0


next_root_entry:
	xchg cx, dx			; We use CX in the inner loop...

	mov si, kernelName		; Start searching for kernel filename
	mov cx, 11
	rep cmpsb
	je found_file_to_load		; Pointer DI will be at offset 11

	add ax, 32			; Bump searched entries by 1 (32 bytes per entry)

	mov di, tmpBuffer			; Point to next entry
	add di, ax

	xchg dx, cx			; Get the original CX back
	loop next_root_entry

	jmp error

found_file_to_load:
	mov ax, [di + 0x14]
	mov [d_lbaH], ax
	mov ax, [di + 0x1A]
	mov [d_lba], ax

	
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
lbaTmp:	dw 0
fatBegin: dw 0
secPerClus: db 0

DAPACK:
	db	0x10
	db	0
blkcnt:	dw	1		; int 13 resets this to # of blocks actually read/written
db_add:	dw	0x1000		; memory buffer destination address (0:7c00)
	dw	0		; in memory page zero
d_lba:	dw	0	
d_lbaH:	dw	0	; put the lba to read in this spot
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