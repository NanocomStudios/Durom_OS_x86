	.file	"VGA.cpp"
	.text
	.section	.text._ZN7Color32aSERK5Color,"axG",@progbits,_ZN7Color32aSERK5Color,comdat
	.align 2
	.weak	_ZN7Color32aSERK5Color
	.type	_ZN7Color32aSERK5Color, @function
_ZN7Color32aSERK5Color:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	-16(%rbp), %rax
	movzbl	1(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, 1(%rax)
	movq	-16(%rbp), %rax
	movzbl	2(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, 2(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
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
	.align 8
	.type	screenRam, @object
	.size	screenRam, 8
screenRam:
	.zero	8
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
	.align 8
	.type	vesaInfoBlock, @object
	.size	vesaInfoBlock, 8
vesaInfoBlock:
	.zero	8
	.text
	.globl	_Z11clearScreenv
	.type	_Z11clearScreenv, @function
_Z11clearScreenv:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
.L9:
	movzwl	height(%rip), %eax
	movzwl	%ax, %eax
	cmpl	%eax, -4(%rbp)
	jge	.L10
	movl	$0, -8(%rbp)
.L8:
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L5
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L6
	movq	screenRam(%rip), %rdx
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	$backColor, %esi
	movq	%rax, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L7
.L6:
	movq	screenRam(%rip), %rcx
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	backColor(%rip), %edx
	movw	%dx, (%rax)
	movzbl	backColor+2(%rip), %edx
	movb	%dl, 2(%rax)
.L7:
	addl	$1, -8(%rbp)
	jmp	.L8
.L5:
	addl	$1, -4(%rbp)
	jmp	.L9
.L10:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z11clearScreenv, .-_Z11clearScreenv
	.globl	_Z12clearConsolev
	.type	_Z12clearConsolev, @function
_Z12clearConsolev:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %esi
	movl	$0, %edi
	call	_Z7moveCsrii
	movb	$0, scroll(%rip)
	movl	$0, -4(%rbp)
.L13:
	cmpl	$3359, -4(%rbp)
	jg	.L12
	movl	$32, %edi
	call	_Z5printc
	addl	$1, -4(%rbp)
	jmp	.L13
.L12:
	movb	$1, scroll(%rip)
	movl	$0, %esi
	movl	$0, %edi
	call	_Z7moveCsrii
	nop
	leave
	.cfi_def_cfa 7, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movb	$-1, -1(%rbp)
	movb	$-1, -2(%rbp)
	movb	$-1, -3(%rbp)
	movb	$0, -4(%rbp)
	movb	$0, -5(%rbp)
	movb	$0, -6(%rbp)
	movq	$1280, vesaInfoBlock(%rip)
	movq	vesaInfoBlock(%rip), %rax
	movl	40(%rax), %eax
	testl	%eax, %eax
	je	.L15
	movq	vesaInfoBlock(%rip), %rax
	movl	40(%rax), %eax
	movl	%eax, %eax
	movq	%rax, screenRam(%rip)
	movq	vesaInfoBlock(%rip), %rax
	movzwl	20(%rax), %eax
	movw	%ax, height(%rip)
	movq	vesaInfoBlock(%rip), %rax
	movzwl	18(%rax), %eax
	movw	%ax, width(%rip)
	movq	vesaInfoBlock(%rip), %rax
	movzbl	25(%rax), %eax
	movb	%al, bpp(%rip)
	movb	$71, graphicMode(%rip)
	jmp	.L16
.L15:
	movb	$84, graphicMode(%rip)
.L16:
	movb	$-1, foreColor(%rip)
	movb	$-1, foreColor+1(%rip)
	movb	$-1, foreColor+2(%rip)
	movb	$36, backColor(%rip)
	movb	$10, backColor+1(%rip)
	movb	$48, backColor+2(%rip)
	call	_Z11clearScreenv
	movb	$1, scroll(%rip)
	movl	$.LC0, %edi
	call	_Z5printPKc
	movzbl	bpp(%rip), %eax
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$10, %edi
	call	_Z5printc
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z10initScreenv, .-_Z10initScreenv
	.globl	_Z5printPKc
	.type	_Z5printPKc, @function
_Z5printPKc:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
.L19:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L20
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	addl	$1, -4(%rbp)
	jmp	.L19
.L20:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z5printPKc, .-_Z5printPKc
	.globl	_Z8printIntl
	.type	_Z8printIntl, @function
_Z8printIntl:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z3lenl
	cltq
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, -32(%rbp)
	cmpq	$0, -56(%rbp)
	jns	.L22
	movl	$45, %edi
	call	_Z5printc
	negq	-56(%rbp)
.L22:
	movq	$0, -40(%rbp)
	movq	$0, -8(%rbp)
.L24:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jge	.L23
	movq	-56(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	movl	%edx, %eax
	leal	48(%rax), %ecx
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movq	-56(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -56(%rbp)
	addq	$1, -8(%rbp)
	jmp	.L24
.L23:
	movq	-24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
.L26:
	cmpq	$0, -16(%rbp)
	js	.L25
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	subq	$1, -16(%rbp)
	jmp	.L26
.L25:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	nop
	leave
	.cfi_def_cfa 7, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4lenHl
	cltq
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	addl	%eax, %eax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, -48(%rbp)
	movw	$0, -18(%rbp)
.L29:
	movswq	-18(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jle	.L28
	movswq	-18(%rbp), %rax
	leaq	-56(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	andl	$15, %eax
	movswl	-18(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rcx
	movq	-48(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	%eax, %edi
	call	_Z10hexToAsciic
	movb	%al, (%rbx)
	movswq	-18(%rbp), %rax
	leaq	-56(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	shrb	$4, %al
	movsbl	%al, %eax
	movswl	-18(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-48(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	%eax, %edi
	call	_Z10hexToAsciic
	movb	%al, (%rbx)
	movzwl	-18(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -18(%rbp)
	jmp	.L29
.L28:
	movl	$.LC1, %edi
	call	_Z5printPKc
	movq	-40(%rbp), %rax
	addq	%rax, %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
.L31:
	cmpq	$0, -32(%rbp)
	js	.L30
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	subq	$1, -32(%rbp)
	jmp	.L31
.L30:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z8printHexl, .-_Z8printHexl
	.globl	_Z9printHexVl
	.type	_Z9printHexVl, @function
_Z9printHexVl:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4lenHl
	cltq
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	addl	%eax, %eax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, -48(%rbp)
	movw	$0, -18(%rbp)
.L34:
	movswq	-18(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jle	.L33
	movswq	-18(%rbp), %rax
	leaq	-56(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	andl	$15, %eax
	movswl	-18(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rcx
	movq	-48(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	%eax, %edi
	call	_Z10hexToAsciic
	movb	%al, (%rbx)
	movswq	-18(%rbp), %rax
	leaq	-56(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	shrb	$4, %al
	movsbl	%al, %eax
	movswl	-18(%rbp), %edx
	addl	%edx, %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-48(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	%eax, %edi
	call	_Z10hexToAsciic
	movb	%al, (%rbx)
	movzwl	-18(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -18(%rbp)
	jmp	.L34
.L33:
	movq	-40(%rbp), %rax
	addq	%rax, %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
.L36:
	cmpq	$0, -32(%rbp)
	js	.L35
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	subq	$1, -32(%rbp)
	jmp	.L36
.L35:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z9printHexVl, .-_Z9printHexVl
	.globl	_Z10hexToAsciic
	.type	_Z10hexToAsciic, @function
_Z10hexToAsciic:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$9, -4(%rbp)
	jg	.L38
	movzbl	-4(%rbp), %eax
	addl	$48, %eax
	jmp	.L39
.L38:
	cmpb	$15, -4(%rbp)
	jg	.L40
	movzbl	-4(%rbp), %eax
	addl	$55, %eax
	jmp	.L39
.L40:
	movl	$0, %eax
.L39:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_Z10hexToAsciic, .-_Z10hexToAsciic
	.globl	_Z3lenl
	.type	_Z3lenl, @function
_Z3lenl:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jns	.L44
	negq	-24(%rbp)
.L44:
	movq	-24(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -24(%rbp)
	addq	$1, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jle	.L43
	jmp	.L44
.L43:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_Z3lenl, .-_Z3lenl
	.globl	_Z4lenHl
	.type	_Z4lenHl, @function
_Z4lenHl:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jns	.L49
	negq	-24(%rbp)
.L49:
	movq	-24(%rbp), %rax
	leaq	255(%rax), %rdx
	testq	%rax, %rax
	cmovs	%rdx, %rax
	sarq	$8, %rax
	movq	%rax, -24(%rbp)
	addq	$1, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jle	.L48
	jmp	.L49
.L48:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	_Z4lenHl, .-_Z4lenHl
	.globl	_Z12scrollScreenv
	.type	_Z12scrollScreenv, @function
_Z12scrollScreenv:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
.L55:
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	movzwl	height(%rip), %edx
	movzwl	%dx, %edx
	subl	$1, %edx
	imull	%edx, %eax
	cmpl	%eax, -4(%rbp)
	jge	.L52
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L53
	movq	screenRam(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rsi
	movzwl	width(%rip), %eax
	movzwl	%ax, %edx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movq	screenRam(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	jmp	.L54
.L53:
	movq	screenRam(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rax,%rdx), %rsi
	movzwl	width(%rip), %eax
	movzwl	%ax, %edx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	leaq	(%rcx,%rax), %rdx
	movq	screenRam(%rip), %rsi
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	%rcx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	addq	%rsi, %rax
	movzwl	(%rdx), %ecx
	movw	%cx, (%rax)
	movzbl	2(%rdx), %edx
	movb	%dl, 2(%rax)
.L54:
	addl	$1, -4(%rbp)
	jmp	.L55
.L52:
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	movzwl	height(%rip), %edx
	movzwl	%dx, %edx
	subl	$14, %edx
	imull	%edx, %eax
	movl	%eax, -8(%rbp)
.L59:
	movzwl	width(%rip), %eax
	movzwl	%ax, %edx
	movzwl	height(%rip), %eax
	movzwl	%ax, %eax
	imull	%edx, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L56
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L57
	movq	screenRam(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$backColor, %esi
	movq	%rax, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L58
.L57:
	movq	screenRam(%rip), %rcx
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	backColor(%rip), %edx
	movw	%dx, (%rax)
	movzbl	backColor+2(%rip), %edx
	movb	%dl, 2(%rax)
.L58:
	addl	$1, -8(%rbp)
	jmp	.L59
.L56:
	movl	$41, %esi
	movl	$0, %edi
	call	_Z7moveCsrii
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_Z12scrollScreenv, .-_Z12scrollScreenv
	.globl	_Z5printc
	.type	_Z5printc, @function
_Z5printc:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	cmpl	$8, %eax
	je	.L62
	cmpl	$10, %eax
	jne	.L68
	movl	currentCursorLoc(%rip), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	cmpl	$41, %eax
	jle	.L64
	call	_Z12scrollScreenv
	jmp	.L66
.L64:
	movl	currentCursorLoc(%rip), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	_Z7moveCsrii
	jmp	.L66
.L62:
	movl	currentCursorLoc(%rip), %eax
	testl	%eax, %eax
	jle	.L69
	call	_Z6csrDecv
	movl	$32, %edi
	call	_Z5printc
	call	_Z6csrDecv
	jmp	.L69
.L68:
	movl	currentCursorLoc(%rip), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	addl	%eax, %eax
	movswl	%ax, %edi
	movl	currentCursorLoc(%rip), %ecx
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
	movswl	%ax, %esi
	movsbl	-4(%rbp), %eax
	movzbl	backColor(%rip), %edx
	movzbl	backColor+1(%rip), %ecx
	salq	$8, %rcx
	orq	%rdx, %rcx
	movzbl	backColor+2(%rip), %edx
	salq	$16, %rdx
	orq	%rcx, %rdx
	movq	%rdx, %r8
	movzbl	foreColor(%rip), %edx
	movzbl	foreColor+1(%rip), %ecx
	salq	$8, %rcx
	orq	%rdx, %rcx
	movzbl	foreColor+2(%rip), %edx
	salq	$16, %rdx
	orq	%rcx, %rdx
	movq	%rdx, %rcx
	movl	%edi, %edx
	movl	%eax, %edi
	call	_Z8drawCharcss5ColorS_
	call	_Z6csrIncv
	jmp	.L66
.L69:
	nop
.L66:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	_Z5printc, .-_Z5printc
	.globl	_Z7moveCsrii
	.type	_Z7moveCsrii, @function
_Z7moveCsrii:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, currentCursorLoc(%rip)
	movl	$15, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
	movl	$14, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_Z7moveCsrii, .-_Z7moveCsrii
	.globl	_Z6csrIncv
	.type	_Z6csrIncv, @function
_Z6csrIncv:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	currentCursorLoc(%rip), %eax
	addl	$1, %eax
	movl	%eax, currentCursorLoc(%rip)
	movl	currentCursorLoc(%rip), %eax
	cmpl	$3359, %eax
	jle	.L72
	call	_Z12scrollScreenv
.L72:
	movl	$15, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
	movl	$14, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	_Z6csrIncv, .-_Z6csrIncv
	.globl	_Z6csrDecv
	.type	_Z6csrDecv, @function
_Z6csrDecv:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	currentCursorLoc(%rip), %eax
	testl	%eax, %eax
	jle	.L75
	movl	currentCursorLoc(%rip), %eax
	subl	$1, %eax
	movl	%eax, currentCursorLoc(%rip)
	movl	$15, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
	movl	$14, %esi
	movl	$980, %edi
	call	_Z4outbth
	movl	currentCursorLoc(%rip), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	_Z4outbth
.L75:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	_Z6csrDecv, .-_Z6csrDecv
	.globl	_Z12setForeColor5Color
	.type	_Z12setForeColor5Color, @function
_Z12setForeColor5Color:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movzwl	-8(%rbp), %eax
	movw	%ax, foreColor(%rip)
	movzbl	-6(%rbp), %eax
	movb	%al, foreColor+2(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_Z12setForeColor5Color, .-_Z12setForeColor5Color
	.globl	_Z12setBackColor5Color
	.type	_Z12setBackColor5Color, @function
_Z12setBackColor5Color:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movzwl	-8(%rbp), %eax
	movw	%ax, backColor(%rip)
	movzbl	-6(%rbp), %eax
	movb	%al, backColor+2(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	_Z12setBackColor5Color, .-_Z12setBackColor5Color
	.globl	_Z8drawLinessss5Color
	.type	_Z8drawLinessss5Color, @function
_Z8drawLinessss5Color:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%ecx, %eax
	movq	%r8, -104(%rbp)
	movl	%edi, %ecx
	movw	%cx, -84(%rbp)
	movl	%esi, %ecx
	movw	%cx, -88(%rbp)
	movw	%dx, -92(%rbp)
	movw	%ax, -96(%rbp)
	movzwl	-84(%rbp), %eax
	cmpw	-92(%rbp), %ax
	jle	.L79
	movswl	-92(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -20(%rbp)
.L96:
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jb	.L80
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm1
	movswl	-88(%rbp), %edx
	movswl	-96(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	movswl	-84(%rbp), %edx
	movswl	-92(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm2
	divss	%xmm2, %xmm0
	movaps	%xmm0, %xmm2
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm3
	subss	%xmm0, %xmm3
	movaps	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L159
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L84
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-72(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-72(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L85
.L84:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L85:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L86
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-69(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	leal	1(%rdx), %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-69(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L88
.L86:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	leal	1(%rax), %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L88
.L159:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L160
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L91
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-66(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-66(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L92
.L91:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L92:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L93
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-63(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	leal	-1(%rdx), %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-63(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L88
.L93:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	leal	-1(%rax), %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L88
.L160:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L95
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L88
.L95:
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-104(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-102(%rbp), %edx
	movb	%dl, 2(%rax)
.L88:
	movss	-20(%rbp), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	jmp	.L96
.L79:
	movzwl	-84(%rbp), %eax
	cmpw	-92(%rbp), %ax
	jge	.L80
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -20(%rbp)
.L112:
	movswl	-92(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	ucomiss	-20(%rbp), %xmm0
	jb	.L80
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm1
	movswl	-88(%rbp), %edx
	movswl	-96(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	movswl	-84(%rbp), %edx
	movswl	-92(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm2
	divss	%xmm2, %xmm0
	movaps	%xmm0, %xmm2
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm3
	subss	%xmm0, %xmm3
	movaps	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L161
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L100
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-60(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-60(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L101
.L100:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L101:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L102
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-57(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	leal	1(%rdx), %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-57(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L104
.L102:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	leal	1(%rax), %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L104
.L161:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L162
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L107
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-54(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-54(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L108
.L107:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L108:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L109
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-51(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	leal	-1(%rdx), %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-51(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L104
.L109:
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	leal	-1(%rax), %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L104
.L162:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L111
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L104
.L111:
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-104(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-102(%rbp), %edx
	movb	%dl, 2(%rax)
.L104:
	movss	-20(%rbp), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	jmp	.L112
.L80:
	movzwl	-88(%rbp), %eax
	cmpw	-96(%rbp), %ax
	jle	.L113
	movswl	-96(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -24(%rbp)
.L130:
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jnb	.L153
	jmp	.L167
.L153:
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movswl	-88(%rbp), %edx
	movswl	-96(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movswl	-84(%rbp), %edx
	movswl	-92(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm0, %xmm1
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L163
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L118
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-48(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L119
.L118:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L119:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L120
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-45(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-45(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L122
.L120:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rdx, %rax
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L122
.L163:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L164
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L125
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-42(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-42(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L126
.L125:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L126:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L127
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-39(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rax, %rdx
	leaq	-39(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L122
.L127:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	subq	$3, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L122
.L164:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L129
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L122
.L129:
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-104(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-102(%rbp), %edx
	movb	%dl, 2(%rax)
.L122:
	movss	-24(%rbp), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	jmp	.L130
.L113:
	movzwl	-88(%rbp), %eax
	cmpw	-96(%rbp), %ax
	jge	.L167
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -24(%rbp)
.L146:
	movswl	-96(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	ucomiss	-24(%rbp), %xmm0
	jnb	.L156
	jmp	.L167
.L156:
	movswl	-88(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	movss	-24(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movswl	-88(%rbp), %edx
	movswl	-96(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movswl	-84(%rbp), %edx
	movswl	-92(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm0, %xmm1
	movswl	-84(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L165
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L134
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-36(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L135
.L134:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L135:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L136
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-33(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	addq	$1, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-33(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L138
.L136:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rdx, %rax
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L138
.L165:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L166
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L141
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-30(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-30(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L142
.L141:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
.L142:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L143
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	leaq	-27(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rax, %rdx
	leaq	-27(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L138
.L143:
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	movss	-20(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm1
	cvttss2si	%xmm1, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	subq	$3, %rax
	leaq	(%rcx,%rax), %rbx
	leaq	-128(%rbp), %rax
	movq	-104(%rbp), %rsi
	movq	%rax, %rdi
	call	_Z12antiAliasingf5Color
	movzwl	-128(%rbp), %eax
	movw	%ax, (%rbx)
	movzbl	-126(%rbp), %eax
	movb	%al, 2(%rbx)
	jmp	.L138
.L166:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L145
	movq	screenRam(%rip), %rax
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	%edx, %rcx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-104(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L138
.L145:
	movq	screenRam(%rip), %rcx
	movss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movslq	%eax, %rdx
	movss	-24(%rbp), %xmm0
	cvttss2si	%xmm0, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-104(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-102(%rbp), %edx
	movb	%dl, 2(%rax)
.L138:
	movss	-24(%rbp), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -24(%rbp)
	jmp	.L146
.L167:
	nop
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	_Z8drawLinessss5Color, .-_Z8drawLinessss5Color
	.globl	_Z13drawRectanglessss5Color
	.type	_Z13drawRectanglessss5Color, @function
_Z13drawRectanglessss5Color:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%ecx, %eax
	movq	%r8, -24(%rbp)
	movl	%edi, %ecx
	movw	%cx, -4(%rbp)
	movl	%esi, %ecx
	movw	%cx, -8(%rbp)
	movw	%dx, -12(%rbp)
	movw	%ax, -16(%rbp)
	movswl	-8(%rbp), %ecx
	movswl	-12(%rbp), %edx
	movswl	-8(%rbp), %esi
	movswl	-4(%rbp), %eax
	movq	-24(%rbp), %r8
	movl	%eax, %edi
	call	_Z8drawLinessss5Color
	movswl	-16(%rbp), %ecx
	movswl	-4(%rbp), %edx
	movswl	-8(%rbp), %esi
	movswl	-4(%rbp), %eax
	movq	-24(%rbp), %r8
	movl	%eax, %edi
	call	_Z8drawLinessss5Color
	movswl	-16(%rbp), %ecx
	movswl	-12(%rbp), %edx
	movswl	-8(%rbp), %esi
	movswl	-12(%rbp), %eax
	movq	-24(%rbp), %r8
	movl	%eax, %edi
	call	_Z8drawLinessss5Color
	movswl	-16(%rbp), %ecx
	movswl	-12(%rbp), %edx
	movswl	-16(%rbp), %esi
	movswl	-4(%rbp), %eax
	movq	-24(%rbp), %r8
	movl	%eax, %edi
	call	_Z8drawLinessss5Color
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	_Z13drawRectanglessss5Color, .-_Z13drawRectanglessss5Color
	.globl	_Z13fillRectanglessss5Color
	.type	_Z13fillRectanglessss5Color, @function
_Z13fillRectanglessss5Color:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%ecx, %eax
	movq	%r8, -40(%rbp)
	movl	%edi, %ecx
	movw	%cx, -20(%rbp)
	movl	%esi, %ecx
	movw	%cx, -24(%rbp)
	movw	%dx, -28(%rbp)
	movw	%ax, -32(%rbp)
	movzwl	-24(%rbp), %eax
	cmpw	-32(%rbp), %ax
	jle	.L170
	movzwl	-32(%rbp), %eax
	movw	%ax, -6(%rbp)
	movzwl	-24(%rbp), %eax
	movw	%ax, -32(%rbp)
	movzwl	-6(%rbp), %eax
	movw	%ax, -24(%rbp)
.L170:
	movzwl	-20(%rbp), %eax
	cmpw	-28(%rbp), %ax
	jle	.L171
	movzwl	-28(%rbp), %eax
	movw	%ax, -8(%rbp)
	movzwl	-20(%rbp), %eax
	movw	%ax, -28(%rbp)
	movzwl	-8(%rbp), %eax
	movw	%ax, -20(%rbp)
.L171:
	movzwl	-24(%rbp), %eax
	movw	%ax, -2(%rbp)
.L177:
	movzwl	-2(%rbp), %eax
	cmpw	-32(%rbp), %ax
	jg	.L178
	movzwl	-20(%rbp), %eax
	movw	%ax, -4(%rbp)
.L176:
	movzwl	-4(%rbp), %eax
	cmpw	-28(%rbp), %ax
	jg	.L173
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L174
	movq	screenRam(%rip), %rax
	movswq	-4(%rbp), %rcx
	movswl	-2(%rbp), %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L175
.L174:
	movq	screenRam(%rip), %rcx
	movswq	-4(%rbp), %rdx
	movswl	-2(%rbp), %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-40(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-38(%rbp), %edx
	movb	%dl, 2(%rax)
.L175:
	movzwl	-4(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -4(%rbp)
	jmp	.L176
.L173:
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	jmp	.L177
.L178:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	_Z13fillRectanglessss5Color, .-_Z13fillRectanglessss5Color
	.globl	_Z12antiAliasingf5Color
	.type	_Z12antiAliasingf5Color, @function
_Z12antiAliasingf5Color:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	movq	%rsi, -24(%rbp)
	movzbl	-22(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2ss	%eax, %xmm0
	mulss	-12(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movb	%al, -22(%rbp)
	movzbl	-23(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2ss	%eax, %xmm0
	mulss	-12(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movb	%al, -23(%rbp)
	movzbl	-24(%rbp), %eax
	movzbl	%al, %eax
	cvtsi2ss	%eax, %xmm0
	mulss	-12(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movb	%al, -24(%rbp)
	movq	-8(%rbp), %rax
	movzwl	-24(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-22(%rbp), %edx
	movb	%dl, 2(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	_Z12antiAliasingf5Color, .-_Z12antiAliasingf5Color
	.globl	_Z8drawCharcss5ColorS_
	.type	_Z8drawCharcss5ColorS_, @function
_Z8drawCharcss5ColorS_:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edx, %eax
	movq	%rcx, -40(%rbp)
	movq	%r8, -48(%rbp)
	movl	%edi, %edx
	movb	%dl, -20(%rbp)
	movl	%esi, %edx
	movw	%dx, -24(%rbp)
	movw	%ax, -28(%rbp)
	movl	$0, -4(%rbp)
.L192:
	cmpl	$13, -4(%rbp)
	jg	.L193
	movl	$0, -8(%rbp)
.L189:
	cmpl	$7, -8(%rbp)
	jg	.L183
	movsbl	-20(%rbp), %eax
	imull	$14, %eax, %eax
	leal	4099(%rax), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movl	-8(%rbp), %eax
	movl	$128, %esi
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	.L184
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L185
	movq	screenRam(%rip), %rax
	movswl	-24(%rbp), %ecx
	movl	-8(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rcx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %edx
	addl	%edx, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L187
.L185:
	movq	screenRam(%rip), %rcx
	movswl	-24(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %eax
	addl	%eax, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-40(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-38(%rbp), %edx
	movb	%dl, 2(%rax)
	jmp	.L187
.L184:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L188
	movq	screenRam(%rip), %rax
	movswl	-24(%rbp), %ecx
	movl	-8(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rcx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %edx
	addl	%edx, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L187
.L188:
	movq	screenRam(%rip), %rcx
	movswl	-24(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %eax
	addl	%eax, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-48(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-46(%rbp), %edx
	movb	%dl, 2(%rax)
.L187:
	addl	$1, -8(%rbp)
	jmp	.L189
.L183:
	movzbl	bpp(%rip), %eax
	cmpb	$32, %al
	jne	.L190
	movq	screenRam(%rip), %rax
	movswl	-24(%rbp), %edx
	addl	$8, %edx
	movslq	%edx, %rcx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %edx
	addl	%edx, %esi
	movzwl	width(%rip), %edx
	movzwl	%dx, %edx
	imull	%esi, %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZN7Color32aSERK5Color
	jmp	.L191
.L190:
	movq	screenRam(%rip), %rcx
	movswl	-24(%rbp), %eax
	addl	$8, %eax
	movslq	%eax, %rdx
	movswl	-28(%rbp), %esi
	movl	-4(%rbp), %eax
	addl	%eax, %esi
	movzwl	width(%rip), %eax
	movzwl	%ax, %eax
	imull	%esi, %eax
	cltq
	addq	%rax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzwl	-48(%rbp), %edx
	movw	%dx, (%rax)
	movzbl	-46(%rbp), %edx
	movb	%dl, 2(%rax)
.L191:
	addl	$1, -4(%rbp)
	jmp	.L192
.L193:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	_Z8drawCharcss5ColorS_, .-_Z8drawCharcss5ColorS_
	.section	.rodata
	.align 4
.LC3:
	.long	1065353216
	.ident	"GCC: (GNU) 7.5.0"
