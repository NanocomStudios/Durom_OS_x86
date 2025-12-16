	.file	"kernel.cpp"
	.text
	.globl	Kheight
	.section	.bss
	.align 2
	.type	Kheight, @object
	.size	Kheight, 2
Kheight:
	.zero	2
	.globl	Kwidth
	.align 2
	.type	Kwidth, @object
	.size	Kwidth, 2
Kwidth:
	.zero	2
	.globl	KscreenRam
	.align 8
	.type	KscreenRam, @object
	.size	KscreenRam, 8
KscreenRam:
	.zero	8
	.globl	step
	.align 4
	.type	step, @object
	.size	step, 4
step:
	.zero	4
	.section	.rodata
.LC0:
	.string	"DuRom x86 V1.0\n#>"
.LC1:
	.string	"\n"
.LC2:
	.string	"clear"
.LC3:
	.string	"help"
.LC4:
	.string	"Showing help.\n"
.LC5:
	.string	"box"
.LC6:
	.string	"Insufficient Argument count!\n"
.LC7:
	.string	"close"
.LC8:
	.string	"focus"
.LC9:
	.string	"' is not a valid Command.\n"
.LC10:
	.string	"#>"
.LC11:
	.string	"Input Buffer Exceeded!\n#>"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movb	$0, -131(%rbp)
	movb	$-1, -130(%rbp)
	movb	$0, -129(%rbp)
	movl	$.LC0, %edi
	call	_Z5printPKc
	movl	$255, %edi
	call	_Z6malloci
	movq	%rax, -48(%rbp)
	movl	$0, -4(%rbp)
	movl	$500, %ecx
	movl	$400, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	_Z10openWindowssss
	movq	%rax, -56(%rbp)
	movl	$600, %ecx
	movl	$500, %edx
	movl	$50, %esi
	movl	$50, %edi
	call	_Z10openWindowssss
	movq	%rax, -64(%rbp)
	movb	$0, -5(%rbp)
	movb	$0, -65(%rbp)
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_Z16getGraphicObjectP6Windows
	movq	16(%rax), %rax
	movb	$0, 7(%rax)
	movb	$0, 8(%rax)
	movb	$0, 9(%rax)
	movl	$224, %esi
	movl	$502, %edi
	call	_Z4outbth
	movl	$236, %esi
	movl	$503, %edi
	call	_Z4outbth
	movl	$98, %edi
	call	_Z6malloci
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_Z12getDriveInfoPv
	movq	-80(%rbp), %rax
	addq	$52, %rax
	movq	%rax, %rdi
	call	_Z5printPKc
	movl	$10, %edi
	call	_Z5printc
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	call	_Z7pciInitv
	call	_Z12printPciListv
	movl	$512, %edi
	call	_Z6malloci
	movq	%rax, -88(%rbp)
	movl	$512, %edi
	call	_Z6malloci
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rax
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	movq	-88(%rbp), %rax
	movl	454(%rax), %edx
	movq	-96(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	movq	-88(%rbp), %rax
	movl	454(%rax), %edx
	movq	-96(%rbp), %rax
	movzwl	14(%rax), %eax
	movzwl	%ax, %eax
	leal	(%rdx,%rax), %ecx
	movq	-96(%rbp), %rax
	movzbl	16(%rax), %eax
	movzbl	%al, %edx
	movq	-96(%rbp), %rax
	movl	36(%rax), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, -100(%rbp)
	movl	$512, %edi
	call	_Z6malloci
	movq	%rax, -112(%rbp)
	movl	-100(%rbp), %edx
	movq	-112(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	movq	-96(%rbp), %rax
	movzbl	13(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$10, %edi
	call	_Z5printc
	movl	$0, -12(%rbp)
.L7:
	cmpl	$15, -12(%rbp)
	jg	.L2
	movl	$0, -16(%rbp)
.L4:
	cmpl	$7, -16(%rbp)
	jg	.L3
	movl	-12(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	addl	$1, -16(%rbp)
	jmp	.L4
.L3:
	movl	$46, %edi
	call	_Z5printc
	movl	$8, -20(%rbp)
.L6:
	cmpl	$10, -20(%rbp)
	jg	.L5
	movl	-12(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z5printc
	addl	$1, -20(%rbp)
	jmp	.L6
.L5:
	movl	$.LC1, %edi
	call	_Z5printPKc
	addl	$1, -12(%rbp)
	jmp	.L7
.L2:
	movl	$1, %edi
	call	_Z7ps2Waith
	movl	$100, %edi
	call	_Z3inbt
	movzbl	%al, %eax
	andl	$32, %eax
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L2
	call	_Z7getCharv
	movb	%al, -113(%rbp)
	movsbl	-113(%rbp), %eax
	cmpl	$8, %eax
	je	.L10
	cmpl	$10, %eax
	jne	.L34
	movl	$10, %edi
	call	_Z5printc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-48(%rbp), %rax
	movl	$5, %ecx
	movl	$.LC2, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L12
	call	_Z12clearConsolev
	jmp	.L13
.L12:
	movq	-48(%rbp), %rax
	movl	$4, %ecx
	movl	$.LC3, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L14
	movl	$.LC4, %edi
	call	_Z5printPKc
	jmp	.L13
.L14:
	movq	-48(%rbp), %rax
	movl	$3, %ecx
	movl	$.LC5, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L15
	movl	$0, -24(%rbp)
	movl	$0, -28(%rbp)
.L19:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L16
.L18:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L17
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L17
	addl	$1, -28(%rbp)
	jmp	.L18
.L17:
	addl	$1, -24(%rbp)
	addl	$1, -28(%rbp)
	jmp	.L19
.L16:
	cmpl	$5, -24(%rbp)
	je	.L20
	movl	$.LC6, %edi
	call	_Z5printPKc
	jmp	.L13
.L20:
	movl	$16, %edi
	call	_Z6malloci
	movq	%rax, -128(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movl	$4, -36(%rbp)
.L26:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L22
	movl	$0, -32(%rbp)
.L25:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L23
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L23
	cmpl	$3, -36(%rbp)
	jle	.L24
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-32(%rbp), %eax
	cltq
	movb	%dl, -160(%rbp,%rax)
	addl	$1, -32(%rbp)
.L24:
	addl	$1, -36(%rbp)
	jmp	.L25
.L23:
	movl	-32(%rbp), %eax
	cltq
	movb	$0, -160(%rbp,%rax)
	movl	-32(%rbp), %edx
	leaq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_Z5toIntPKci
	movq	%rax, %rcx
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -24(%rbp)
	addl	$1, -36(%rbp)
	jmp	.L26
.L22:
	movq	-128(%rbp), %rax
	addq	$12, %rax
	movl	(%rax), %eax
	movswl	%ax, %ecx
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movl	(%rax), %eax
	movswl	%ax, %edx
	movq	-128(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	movswl	%ax, %esi
	movq	-128(%rbp), %rax
	movl	(%rax), %eax
	cwtl
	movzbl	-131(%rbp), %edi
	movzbl	-130(%rbp), %r8d
	salq	$8, %r8
	orq	%rdi, %r8
	movzbl	-129(%rbp), %edi
	salq	$16, %rdi
	orq	%r8, %rdi
	movq	%rdi, %r8
	movl	%eax, %edi
	call	_Z13drawRectanglessss5Color
	jmp	.L13
.L15:
	movq	-48(%rbp), %rax
	movl	$5, %ecx
	movl	$.LC7, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L27
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z11closeWindowP6Window
	call	_Z11drawWindowsv
	jmp	.L13
.L27:
	movq	-48(%rbp), %rax
	movl	$5, %ecx
	movl	$.LC8, %edx
	movl	$255, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L28
	cmpb	$0, -5(%rbp)
	jne	.L29
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16bringWindowFrontP6Window
	movb	$1, -5(%rbp)
	jmp	.L30
.L29:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_Z16bringWindowFrontP6Window
	movb	$0, -5(%rbp)
.L30:
	call	_Z11drawWindowsv
	jmp	.L13
.L28:
	cmpl	$0, -4(%rbp)
	je	.L13
	movl	$39, %edi
	call	_Z5printc
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z5printPKc
	movl	$.LC9, %edi
	call	_Z5printPKc
.L13:
	movl	$0, -4(%rbp)
	movl	$.LC10, %edi
	call	_Z5printPKc
	jmp	.L8
.L10:
	cmpl	$0, -4(%rbp)
	jle	.L35
	subl	$1, -4(%rbp)
	movl	$8, %edi
	call	_Z5printc
	jmp	.L35
.L34:
	movsbl	-113(%rbp), %eax
	movl	%eax, %edi
	call	_Z5printc
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-113(%rbp), %eax
	movb	%al, (%rdx)
	cmpl	$255, -4(%rbp)
	jle	.L36
	movl	$.LC11, %edi
	call	_Z5printPKc
	movl	$0, -4(%rbp)
	nop
	jmp	.L36
.L35:
	nop
	jmp	.L2
.L36:
	nop
.L8:
	jmp	.L2
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	init
	.type	init, @function
init:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z10initScreenv
	call	_Z10mallocInitv
	call	_Z7initGUIv
	movl	$1280, %eax
	movzwl	20(%rax), %eax
	movw	%ax, Kheight(%rip)
	movl	$1280, %eax
	movzwl	18(%rax), %eax
	movw	%ax, Kwidth(%rip)
	movl	$1280, %eax
	movl	40(%rax), %eax
	movl	%eax, %eax
	movq	%rax, KscreenRam(%rip)
	call	main
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	init, .-init
	.ident	"GCC: (GNU) 7.5.0"
