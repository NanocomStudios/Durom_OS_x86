	.file	"VGA.cpp"
	.text
	.section	.text._ZN7Color32aSERK5Color,"axG",@progbits,_ZN7Color32aSERK5Color,comdat
	.align 2
	.weak	_ZN7Color32aSERK5Color
	.type	_ZN7Color32aSERK5Color, @function
_ZN7Color32aSERK5Color:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	12(%ebp), %eax
	movzbl	(%eax), %edx
	movl	8(%ebp), %eax
	movb	%dl, (%eax)
	movl	12(%ebp), %eax
	movzbl	1(%eax), %edx
	movl	8(%ebp), %eax
	movb	%dl, 1(%eax)
	movl	12(%ebp), %eax
	movzbl	2(%eax), %edx
	movl	8(%ebp), %eax
	movb	%dl, 2(%eax)
	movl	8(%ebp), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_ZN7Color32aSERK5Color, .-_ZN7Color32aSERK5Color
	.globl	currentCursorLoc
	.section	.bss
	.align 4
	.type	currentCursorLoc, @object
	.size	currentCursorLoc, 4
currentCursorLoc:
	.zero	4
	.globl	foreColor
	.type	foreColor, @object
	.size	foreColor, 3
foreColor:
	.zero	3
	.globl	backColor
	.type	backColor, @object
	.size	backColor, 3
backColor:
	.zero	3
	.globl	height
	.align 2
	.type	height, @object
	.size	height, 2
height:
	.zero	2
	.globl	width
	.align 2
	.type	width, @object
	.size	width, 2
width:
	.zero	2
	.globl	bpp
	.type	bpp, @object
	.size	bpp, 1
bpp:
	.zero	1
	.globl	screenRam
	.align 4
	.type	screenRam, @object
	.size	screenRam, 4
screenRam:
	.zero	4
	.globl	graphicMode
	.type	graphicMode, @object
	.size	graphicMode, 1
graphicMode:
	.zero	1
	.globl	scroll
	.type	scroll, @object
	.size	scroll, 1
scroll:
	.zero	1
	.globl	vesaInfoBlock
	.align 4
	.type	vesaInfoBlock, @object
	.size	vesaInfoBlock, 4
vesaInfoBlock:
	.zero	4
	.text
	.globl	_Z11clearScreenv
	.type	_Z11clearScreenv, @function
_Z11clearScreenv:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -12(%ebp)
	jmp	.L4
.L9:
	movl	$0, -16(%ebp)
	jmp	.L5
.L8:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L6
	movl	screenRam, %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	-12(%ebp), %eax
	movl	%eax, %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	$backColor
	pushl	%eax
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L7
.L6:
	movl	screenRam, %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	-12(%ebp), %eax
	movl	%eax, %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	%edx, %eax
	movzwl	backColor, %edx
	movw	%dx, (%eax)
	movzbl	backColor+2, %edx
	movb	%dl, 2(%eax)
.L7:
	addl	$1, -16(%ebp)
.L5:
	movzwl	width, %eax
	movzwl	%ax, %eax
	cmpl	%eax, -16(%ebp)
	jl	.L8
	addl	$1, -12(%ebp)
.L4:
	movzwl	height, %eax
	movzwl	%ax, %eax
	cmpl	%eax, -12(%ebp)
	jl	.L9
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z11clearScreenv, .-_Z11clearScreenv
	.globl	_Z12clearConsolev
	.type	_Z12clearConsolev, @function
_Z12clearConsolev:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	subl	$8, %esp
	pushl	$0
	pushl	$0
	call	_Z7moveCsrii
	addl	$16, %esp
	movb	$0, scroll
	movl	$0, -12(%ebp)
	jmp	.L11
.L12:
	subl	$12, %esp
	pushl	$32
	call	_Z5printc
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L11:
	cmpl	$3359, -12(%ebp)
	jle	.L12
	movb	$1, scroll
	subl	$8, %esp
	pushl	$0
	pushl	$0
	call	_Z7moveCsrii
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z12clearConsolev, .-_Z12clearConsolev
	.section	.rodata
.LC0:
	.string	"BPP :"
	.text
	.globl	_Z10initScreenv
	.type	_Z10initScreenv, @function
_Z10initScreenv:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movb	$-1, -9(%ebp)
	movb	$-1, -10(%ebp)
	movb	$-1, -11(%ebp)
	movb	$0, -12(%ebp)
	movb	$0, -13(%ebp)
	movb	$0, -14(%ebp)
	movl	$1280, vesaInfoBlock
	movl	vesaInfoBlock, %eax
	movl	40(%eax), %eax
	testl	%eax, %eax
	je	.L14
	movl	vesaInfoBlock, %eax
	movl	40(%eax), %eax
	movl	%eax, screenRam
	movl	vesaInfoBlock, %eax
	movzwl	20(%eax), %eax
	movw	%ax, height
	movl	vesaInfoBlock, %eax
	movzwl	18(%eax), %eax
	movw	%ax, width
	movl	vesaInfoBlock, %eax
	movzbl	25(%eax), %eax
	movb	%al, bpp
	movb	$71, graphicMode
	jmp	.L15
.L14:
	movb	$84, graphicMode
.L15:
	movb	$-1, foreColor
	movb	$-1, foreColor+1
	movb	$-1, foreColor+2
	movb	$36, backColor
	movb	$10, backColor+1
	movb	$48, backColor+2
	call	_Z11clearScreenv
	movb	$1, scroll
	subl	$12, %esp
	pushl	$.LC0
	call	_Z5printPKc
	addl	$16, %esp
	movzbl	bpp, %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z10initScreenv, .-_Z10initScreenv
	.globl	_Z5printPKc
	.type	_Z5printPKc, @function
_Z5printPKc:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$0, -12(%ebp)
	jmp	.L17
.L18:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	addl	$1, -12(%ebp)
.L17:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L18
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z5printPKc, .-_Z5printPKc
	.globl	_Z8printIntl
	.type	_Z8printIntl, @function
_Z8printIntl:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_Z3lenl
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	subl	$12, %esp
	pushl	-20(%ebp)
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	cmpl	$0, 8(%ebp)
	jns	.L20
	subl	$12, %esp
	pushl	$45
	call	_Z5printc
	addl	$16, %esp
	negl	8(%ebp)
.L20:
	movl	$0, -28(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L21
.L22:
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	leal	48(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%edx, %eax
	sarl	$2, %eax
	sarl	$31, %ecx
	movl	%ecx, %edx
	subl	%edx, %eax
	movl	%eax, 8(%ebp)
	addl	$1, -12(%ebp)
.L21:
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jl	.L22
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.L23
.L24:
	movl	-16(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	subl	$1, -16(%ebp)
.L23:
	cmpl	$0, -16(%ebp)
	jns	.L24
	subl	$12, %esp
	pushl	-24(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z8printIntl, .-_Z8printIntl
	.section	.rodata
.LC1:
	.string	"0x"
	.text
	.globl	_Z8printHexl
	.type	_Z8printHexl, @function
_Z8printHexl:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z4lenHl
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movw	$0, -10(%ebp)
	jmp	.L26
.L27:
	movswl	-10(%ebp), %eax
	leal	8(%eax), %eax
	addl	%ebp, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$15, %eax
	movswl	-10(%ebp), %edx
	addl	%edx, %edx
	movl	%edx, %ecx
	movl	-24(%ebp), %edx
	leal	(%ecx,%edx), %ebx
	subl	$12, %esp
	pushl	%eax
	call	_Z10hexToAsciic
	addl	$16, %esp
	movb	%al, (%ebx)
	movswl	-10(%ebp), %eax
	leal	8(%eax), %eax
	addl	%ebp, %eax
	movzbl	(%eax), %eax
	shrb	$4, %al
	movsbl	%al, %eax
	movswl	-10(%ebp), %edx
	addl	%edx, %edx
	leal	1(%edx), %ecx
	movl	-24(%ebp), %edx
	leal	(%ecx,%edx), %ebx
	subl	$12, %esp
	pushl	%eax
	call	_Z10hexToAsciic
	addl	$16, %esp
	movb	%al, (%ebx)
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L26:
	movswl	-10(%ebp), %eax
	cmpl	%eax, -20(%ebp)
	jg	.L27
	subl	$12, %esp
	pushl	$.LC1
	call	_Z5printPKc
	addl	$16, %esp
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.L28
.L29:
	movl	-16(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	subl	$1, -16(%ebp)
.L28:
	cmpl	$0, -16(%ebp)
	jns	.L29
	subl	$12, %esp
	pushl	-24(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z8printHexl, .-_Z8printHexl
	.globl	_Z9printHexVl
	.type	_Z9printHexVl, @function
_Z9printHexVl:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z4lenHl
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movw	$0, -10(%ebp)
	jmp	.L31
.L32:
	movswl	-10(%ebp), %eax
	leal	8(%eax), %eax
	addl	%ebp, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$15, %eax
	movswl	-10(%ebp), %edx
	addl	%edx, %edx
	movl	%edx, %ecx
	movl	-24(%ebp), %edx
	leal	(%ecx,%edx), %ebx
	subl	$12, %esp
	pushl	%eax
	call	_Z10hexToAsciic
	addl	$16, %esp
	movb	%al, (%ebx)
	movswl	-10(%ebp), %eax
	leal	8(%eax), %eax
	addl	%ebp, %eax
	movzbl	(%eax), %eax
	shrb	$4, %al
	movsbl	%al, %eax
	movswl	-10(%ebp), %edx
	addl	%edx, %edx
	leal	1(%edx), %ecx
	movl	-24(%ebp), %edx
	leal	(%ecx,%edx), %ebx
	subl	$12, %esp
	pushl	%eax
	call	_Z10hexToAsciic
	addl	$16, %esp
	movb	%al, (%ebx)
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L31:
	movswl	-10(%ebp), %eax
	cmpl	%eax, -20(%ebp)
	jg	.L32
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.L33
.L34:
	movl	-16(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	subl	$1, -16(%ebp)
.L33:
	cmpl	$0, -16(%ebp)
	jns	.L34
	subl	$12, %esp
	pushl	-24(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	_Z9printHexVl, .-_Z9printHexVl
	.globl	_Z10hexToAsciic
	.type	_Z10hexToAsciic, @function
_Z10hexToAsciic:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	cmpb	$9, -4(%ebp)
	jg	.L36
	movzbl	-4(%ebp), %eax
	addl	$48, %eax
	jmp	.L37
.L36:
	cmpb	$15, -4(%ebp)
	jg	.L38
	movzbl	-4(%ebp), %eax
	addl	$55, %eax
	jmp	.L37
.L38:
	movl	$0, %eax
.L37:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	_Z10hexToAsciic, .-_Z10hexToAsciic
	.globl	_Z3lenl
	.type	_Z3lenl, @function
_Z3lenl:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jns	.L41
	negl	8(%ebp)
.L41:
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%edx, %eax
	sarl	$2, %eax
	sarl	$31, %ecx
	movl	%ecx, %edx
	subl	%edx, %eax
	movl	%eax, 8(%ebp)
	addl	$1, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jg	.L41
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	_Z3lenl, .-_Z3lenl
	.globl	_Z4lenHl
	.type	_Z4lenHl, @function
_Z4lenHl:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jns	.L45
	negl	8(%ebp)
.L45:
	movl	8(%ebp), %eax
	leal	255(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$8, %eax
	movl	%eax, 8(%ebp)
	addl	$1, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jg	.L45
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	_Z4lenHl, .-_Z4lenHl
	.globl	_Z12scrollScreenv
	.type	_Z12scrollScreenv, @function
_Z12scrollScreenv:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	$0, -12(%ebp)
	jmp	.L48
.L51:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L49
	movl	screenRam, %eax
	movzwl	width, %edx
	movzwl	%dx, %edx
	imull	$14, %edx, %ecx
	movl	-12(%ebp), %edx
	addl	%ecx, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	screenRam, %edx
	movl	-12(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %edx
	movl	(%eax), %eax
	movl	%eax, (%edx)
	jmp	.L50
.L49:
	movl	screenRam, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	$42, %eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %edx
	movl	screenRam, %ebx
	movl	-12(%ebp), %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	addl	%ebx, %eax
	movzwl	(%edx), %ecx
	movw	%cx, (%eax)
	movzbl	2(%edx), %edx
	movb	%dl, 2(%eax)
.L50:
	addl	$1, -12(%ebp)
.L48:
	movzwl	width, %eax
	movzwl	%ax, %eax
	movzwl	height, %edx
	movzwl	%dx, %edx
	subl	$1, %edx
	imull	%edx, %eax
	cmpl	%eax, -12(%ebp)
	jl	.L51
	movzwl	width, %eax
	movzwl	%ax, %eax
	movzwl	height, %edx
	movzwl	%dx, %edx
	subl	$14, %edx
	imull	%edx, %eax
	movl	%eax, -16(%ebp)
	jmp	.L52
.L55:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L53
	movl	screenRam, %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	subl	$8, %esp
	pushl	$backColor
	pushl	%eax
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L54
.L53:
	movl	screenRam, %ecx
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	backColor, %edx
	movw	%dx, (%eax)
	movzbl	backColor+2, %edx
	movb	%dl, 2(%eax)
.L54:
	addl	$1, -16(%ebp)
.L52:
	movzwl	width, %eax
	movzwl	%ax, %edx
	movzwl	height, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	cmpl	%eax, -16(%ebp)
	jl	.L55
	subl	$8, %esp
	pushl	$41
	pushl	$0
	call	_Z7moveCsrii
	addl	$16, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	_Z12scrollScreenv, .-_Z12scrollScreenv
	.globl	_Z5printc
	.type	_Z5printc, @function
_Z5printc:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movb	%al, -28(%ebp)
	movsbl	-28(%ebp), %eax
	cmpl	$8, %eax
	je	.L57
	cmpl	$10, %eax
	jne	.L58
	movl	currentCursorLoc, %eax
	cmpl	$3279, %eax
	jle	.L59
	call	_Z12scrollScreenv
	jmp	.L61
.L59:
	movl	currentCursorLoc, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	1(%edx), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$0
	call	_Z7moveCsrii
	addl	$16, %esp
	jmp	.L61
.L57:
	movl	currentCursorLoc, %eax
	testl	%eax, %eax
	jle	.L63
	call	_Z6csrDecv
	subl	$12, %esp
	pushl	$32
	call	_Z5printc
	addl	$16, %esp
	call	_Z6csrDecv
	jmp	.L63
.L58:
	movl	currentCursorLoc, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	addl	%eax, %eax
	movswl	%ax, %ebx
	movl	currentCursorLoc, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movswl	%ax, %ecx
	movsbl	-28(%ebp), %edi
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	backColor, %esi
	movw	%si, (%eax)
	movzbl	backColor+2, %edx
	movb	%dl, 2(%eax)
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	foreColor, %esi
	movw	%si, (%eax)
	movzbl	foreColor+2, %edx
	movb	%dl, 2(%eax)
	pushl	%ebx
	pushl	%ecx
	pushl	%edi
	call	_Z8drawCharcss5ColorS_
	addl	$32, %esp
	call	_Z6csrIncv
	jmp	.L61
.L63:
	nop
.L61:
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	_Z5printc, .-_Z5printc
	.globl	_Z7moveCsrii
	.type	_Z7moveCsrii, @function
_Z7moveCsrii:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, currentCursorLoc
	subl	$8, %esp
	pushl	$15
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
	subl	$8, %esp
	pushl	$14
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	_Z7moveCsrii, .-_Z7moveCsrii
	.globl	_Z6csrIncv
	.type	_Z6csrIncv, @function
_Z6csrIncv:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	currentCursorLoc, %eax
	addl	$1, %eax
	movl	%eax, currentCursorLoc
	movl	currentCursorLoc, %eax
	cmpl	$3359, %eax
	jle	.L66
	call	_Z12scrollScreenv
.L66:
	subl	$8, %esp
	pushl	$15
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
	subl	$8, %esp
	pushl	$14
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	_Z6csrIncv, .-_Z6csrIncv
	.globl	_Z6csrDecv
	.type	_Z6csrDecv, @function
_Z6csrDecv:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	currentCursorLoc, %eax
	testl	%eax, %eax
	jle	.L69
	movl	currentCursorLoc, %eax
	subl	$1, %eax
	movl	%eax, currentCursorLoc
	subl	$8, %esp
	pushl	$15
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
	subl	$8, %esp
	pushl	$14
	pushl	$980
	call	_Z4outbth
	addl	$16, %esp
	movl	currentCursorLoc, %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	_Z4outbth
	addl	$16, %esp
.L69:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	_Z6csrDecv, .-_Z6csrDecv
	.globl	_Z12setForeColor5Color
	.type	_Z12setForeColor5Color, @function
_Z12setForeColor5Color:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movzwl	8(%ebp), %eax
	movw	%ax, foreColor
	movzbl	10(%ebp), %eax
	movb	%al, foreColor+2
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	_Z12setForeColor5Color, .-_Z12setForeColor5Color
	.globl	_Z12setBackColor5Color
	.type	_Z12setBackColor5Color, @function
_Z12setBackColor5Color:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movzwl	8(%ebp), %eax
	movw	%ax, backColor
	movzbl	10(%ebp), %eax
	movb	%al, backColor+2
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	_Z12setBackColor5Color, .-_Z12setBackColor5Color
	.globl	_Z8drawLinessss5Color
	.type	_Z8drawLinessss5Color, @function
_Z8drawLinessss5Color:
.LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$116, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%bx, -76(%ebp)
	movw	%cx, -80(%ebp)
	movw	%dx, -84(%ebp)
	movw	%ax, -88(%ebp)
	movzwl	-76(%ebp), %eax
	cmpw	-84(%ebp), %ax
	jle	.L73
	filds	-84(%ebp)
	fstps	-12(%ebp)
	jmp	.L74
.L87:
	filds	-80(%ebp)
	movswl	-80(%ebp), %edx
	movswl	-88(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	movswl	-76(%ebp), %edx
	movswl	-84(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fdivrp	%st, %st(1)
	filds	-76(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fldz
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L141
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L77
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-64(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-64(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L78
.L77:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L78:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L79
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	leal	-61(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	1(%eax), %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-61(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L80
.L79:
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	1(%eax), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L80
.L141:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L142
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L83
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	leal	-58(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-58(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L84
.L83:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L84:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L85
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-55(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	-1(%eax), %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-55(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L80
.L85:
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	-1(%eax), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L80
.L142:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L86
	movl	screenRam, %edx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L80
.L86:
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L80:
	flds	-12(%ebp)
	fld1
	faddp	%st, %st(1)
	fstps	-12(%ebp)
.L74:
	filds	-76(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L87
	jmp	.L88
.L73:
	movzwl	-76(%ebp), %eax
	cmpw	-84(%ebp), %ax
	jge	.L88
	filds	-76(%ebp)
	fstps	-12(%ebp)
	jmp	.L89
.L102:
	filds	-80(%ebp)
	movswl	-80(%ebp), %edx
	movswl	-88(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	movswl	-76(%ebp), %edx
	movswl	-84(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fdivrp	%st, %st(1)
	filds	-76(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fldz
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L143
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L92
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-52(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-52(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L93
.L92:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L93:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L94
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	leal	-49(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	1(%eax), %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-49(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L95
.L94:
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	1(%eax), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L95
.L143:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L144
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L98
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	leal	-46(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-46(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L99
.L98:
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L99:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L100
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-43(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	-1(%eax), %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-43(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L95
.L100:
	flds	-16(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ebx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	leal	-1(%eax), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L95
.L144:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L101
	movl	screenRam, %edx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L95
.L101:
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L95:
	flds	-12(%ebp)
	fld1
	faddp	%st, %st(1)
	fstps	-12(%ebp)
.L89:
	filds	-84(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L102
.L88:
	movzwl	-80(%ebp), %eax
	cmpw	-88(%ebp), %ax
	jle	.L103
	filds	-88(%ebp)
	fstps	-16(%ebp)
	jmp	.L104
.L117:
	filds	-80(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movswl	-80(%ebp), %edx
	movswl	-88(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fdivrp	%st, %st(1)
	movswl	-76(%ebp), %edx
	movswl	-84(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fmulp	%st, %st(1)
	filds	-76(%ebp)
	faddp	%st, %st(1)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fldz
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L145
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L107
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-40(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L108
.L107:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L108:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L109
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	leal	-37(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-37(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L110
.L109:
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%edx, %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L110
.L145:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L146
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L113
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	leal	-34(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-34(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L114
.L113:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L114:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L115
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-31(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	$1073741823, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-31(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L110
.L115:
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	$3, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L110
.L146:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L116
	movl	screenRam, %edx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L110
.L116:
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L110:
	flds	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstps	-16(%ebp)
.L104:
	filds	-80(%ebp)
	flds	-16(%ebp)
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L117
	jmp	.L149
.L103:
	movzwl	-80(%ebp), %eax
	cmpw	-88(%ebp), %ax
	jge	.L149
	filds	-80(%ebp)
	fstps	-16(%ebp)
	jmp	.L119
.L132:
	filds	-80(%ebp)
	flds	-16(%ebp)
	fsubp	%st, %st(1)
	movswl	-80(%ebp), %edx
	movswl	-88(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fdivrp	%st, %st(1)
	movswl	-76(%ebp), %edx
	movswl	-84(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, -108(%ebp)
	fildl	-108(%ebp)
	fmulp	%st, %st(1)
	filds	-76(%ebp)
	faddp	%st, %st(1)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fldz
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L147
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L122
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-28(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L123
.L122:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L123:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L124
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	leal	-25(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-25(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L125
.L124:
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%edx, %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L125
.L147:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fldz
	fcomip	%st(1), %st
	fstp	%st(0)
	jbe	.L148
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L128
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	leal	-22(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-22(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L129
.L128:
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
.L129:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L130
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	leal	-19(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movl	screenRam, %edx
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	$1073741823, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	-19(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L125
.L130:
	flds	-12(%ebp)
	fnstcw	-86(%ebp)
	movzwl	-86(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -82(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	fildl	-108(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	$3, %eax
	leal	(%ecx,%eax), %ebx
	leal	-104(%ebp), %edx
	subl	$4, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %ecx
	movw	%cx, (%eax)
	movzbl	26(%ebp), %ecx
	movb	%cl, 2(%eax)
	leal	-4(%esp), %esp
	fstps	(%esp)
	pushl	%edx
	call	_Z12antiAliasingf5Color
	addl	$12, %esp
	movzwl	-104(%ebp), %eax
	movw	%ax, (%ebx)
	movzbl	-102(%ebp), %eax
	movb	%al, 2(%ebx)
	jmp	.L125
.L148:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L131
	movl	screenRam, %edx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %ecx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L125
.L131:
	movl	screenRam, %ecx
	flds	-12(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %eax
	movl	%eax, %edx
	flds	-16(%ebp)
	fldcw	-82(%ebp)
	fistpl	-108(%ebp)
	fldcw	-86(%ebp)
	movl	-108(%ebp), %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L125:
	flds	-16(%ebp)
	fld1
	faddp	%st, %st(1)
	fstps	-16(%ebp)
.L119:
	filds	-88(%ebp)
	flds	-16(%ebp)
	fxch	%st(1)
	fcomip	%st(1), %st
	fstp	%st(0)
	jnb	.L132
.L149:
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	_Z8drawLinessss5Color, .-_Z8drawLinessss5Color
	.globl	_Z13drawRectanglessss5Color
	.type	_Z13drawRectanglessss5Color, @function
_Z13drawRectanglessss5Color:
.LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%bx, -28(%ebp)
	movw	%cx, -32(%ebp)
	movw	%dx, -36(%ebp)
	movw	%ax, -40(%ebp)
	movswl	-32(%ebp), %esi
	movswl	-36(%ebp), %ebx
	movswl	-32(%ebp), %ecx
	movswl	-28(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %edi
	movw	%di, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	-44(%ebp)
	call	_Z8drawLinessss5Color
	addl	$32, %esp
	movswl	-40(%ebp), %esi
	movswl	-28(%ebp), %ebx
	movswl	-32(%ebp), %ecx
	movswl	-28(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %edi
	movw	%di, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	-44(%ebp)
	call	_Z8drawLinessss5Color
	addl	$32, %esp
	movswl	-40(%ebp), %esi
	movswl	-36(%ebp), %ebx
	movswl	-32(%ebp), %ecx
	movswl	-36(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %edi
	movw	%di, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	-44(%ebp)
	call	_Z8drawLinessss5Color
	addl	$32, %esp
	movswl	-40(%ebp), %esi
	movswl	-36(%ebp), %ebx
	movswl	-40(%ebp), %ecx
	movswl	-28(%ebp), %eax
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	24(%ebp), %edi
	movw	%di, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	-44(%ebp)
	call	_Z8drawLinessss5Color
	addl	$32, %esp
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	_Z13drawRectanglessss5Color, .-_Z13drawRectanglessss5Color
	.globl	_Z13fillRectanglessss5Color
	.type	_Z13fillRectanglessss5Color, @function
_Z13fillRectanglessss5Color:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%bx, -28(%ebp)
	movw	%cx, -32(%ebp)
	movw	%dx, -36(%ebp)
	movw	%ax, -40(%ebp)
	movzwl	-32(%ebp), %eax
	cmpw	-40(%ebp), %ax
	jle	.L152
	movzwl	-40(%ebp), %eax
	movw	%ax, -14(%ebp)
	movzwl	-32(%ebp), %eax
	movw	%ax, -40(%ebp)
	movzwl	-14(%ebp), %eax
	movw	%ax, -32(%ebp)
.L152:
	movzwl	-28(%ebp), %eax
	cmpw	-36(%ebp), %ax
	jle	.L153
	movzwl	-36(%ebp), %eax
	movw	%ax, -16(%ebp)
	movzwl	-28(%ebp), %eax
	movw	%ax, -36(%ebp)
	movzwl	-16(%ebp), %eax
	movw	%ax, -28(%ebp)
.L153:
	movzwl	-32(%ebp), %eax
	movw	%ax, -10(%ebp)
	jmp	.L154
.L159:
	movzwl	-28(%ebp), %eax
	movw	%ax, -12(%ebp)
	jmp	.L155
.L158:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L156
	movl	screenRam, %ecx
	movswl	-12(%ebp), %ebx
	movswl	-10(%ebp), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	leal	(%ecx,%eax), %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L157
.L156:
	movl	screenRam, %ecx
	movswl	-12(%ebp), %ebx
	movswl	-10(%ebp), %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L157:
	movzwl	-12(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -12(%ebp)
.L155:
	movzwl	-12(%ebp), %eax
	cmpw	-36(%ebp), %ax
	jle	.L158
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L154:
	movzwl	-10(%ebp), %eax
	cmpw	-40(%ebp), %ax
	jle	.L159
	nop
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	_Z13fillRectanglessss5Color, .-_Z13fillRectanglessss5Color
	.globl	_Z12antiAliasingf5Color
	.type	_Z12antiAliasingf5Color, @function
_Z12antiAliasingf5Color:
.LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movzbl	18(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%ebp)
	fildl	-8(%ebp)
	fmuls	12(%ebp)
	fnstcw	-2(%ebp)
	movzwl	-2(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -4(%ebp)
	fldcw	-4(%ebp)
	fistpl	-8(%ebp)
	fldcw	-2(%ebp)
	movzbl	-8(%ebp), %eax
	movb	%al, 18(%ebp)
	movzbl	17(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%ebp)
	fildl	-8(%ebp)
	fmuls	12(%ebp)
	fldcw	-4(%ebp)
	fistpl	-8(%ebp)
	fldcw	-2(%ebp)
	movzbl	-8(%ebp), %eax
	movb	%al, 17(%ebp)
	movzbl	16(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%ebp)
	fildl	-8(%ebp)
	fmuls	12(%ebp)
	fldcw	-4(%ebp)
	fistpl	-8(%ebp)
	fldcw	-2(%ebp)
	movzbl	-8(%ebp), %eax
	movb	%al, 16(%ebp)
	movl	8(%ebp), %eax
	movzwl	16(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	18(%ebp), %edx
	movb	%dl, 2(%eax)
	movl	8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE21:
	.size	_Z12antiAliasingf5Color, .-_Z12antiAliasingf5Color
	.globl	_Z8drawCharcss5ColorS_
	.type	_Z8drawCharcss5ColorS_, @function
_Z8drawCharcss5ColorS_:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movb	%cl, -28(%ebp)
	movw	%dx, -32(%ebp)
	movw	%ax, -36(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L163
.L172:
	movl	$0, -16(%ebp)
	jmp	.L164
.L169:
	movsbl	-28(%ebp), %eax
	imull	$14, %eax, %eax
	leal	4099(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	-16(%ebp), %eax
	movl	$128, %ebx
	movl	%eax, %ecx
	sarl	%cl, %ebx
	movl	%ebx, %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L165
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L166
	movl	screenRam, %edx
	movswl	-32(%ebp), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ebx
	movswl	-36(%ebp), %ecx
	movl	-12(%ebp), %eax
	addl	%eax, %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	20(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L167
.L166:
	movl	screenRam, %ecx
	movswl	-32(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	movswl	-36(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	20(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	22(%ebp), %edx
	movb	%dl, 2(%eax)
	jmp	.L167
.L165:
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L168
	movl	screenRam, %edx
	movswl	-32(%ebp), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %ebx
	movswl	-36(%ebp), %ecx
	movl	-12(%ebp), %eax
	addl	%eax, %ecx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L167
.L168:
	movl	screenRam, %ecx
	movswl	-32(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	movswl	-36(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	leal	(%ebx,%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L167:
	addl	$1, -16(%ebp)
.L164:
	cmpl	$7, -16(%ebp)
	jle	.L169
	movzbl	bpp, %eax
	cmpb	$32, %al
	jne	.L170
	movl	screenRam, %edx
	movswl	-32(%ebp), %ecx
	movswl	-36(%ebp), %ebx
	movl	-12(%ebp), %eax
	addl	%eax, %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	$8, %eax
	sall	$2, %eax
	addl	%eax, %edx
	subl	$8, %esp
	leal	24(%ebp), %eax
	pushl	%eax
	pushl	%edx
	call	_ZN7Color32aSERK5Color
	addl	$16, %esp
	jmp	.L171
.L170:
	movl	screenRam, %ecx
	movswl	-32(%ebp), %edx
	movswl	-36(%ebp), %ebx
	movl	-12(%ebp), %eax
	addl	%eax, %ebx
	movzwl	width, %eax
	movzwl	%ax, %eax
	imull	%ebx, %eax
	addl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	$24, %eax
	addl	%ecx, %eax
	movzwl	24(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	26(%ebp), %edx
	movb	%dl, 2(%eax)
.L171:
	addl	$1, -12(%ebp)
.L163:
	cmpl	$13, -12(%ebp)
	jle	.L172
	nop
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	_Z8drawCharcss5ColorS_, .-_Z8drawCharcss5ColorS_
	.ident	"GCC: (GNU) 13.1.0"
