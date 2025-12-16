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
	.align 4
	.type	KscreenRam, @object
	.size	KscreenRam, 4
KscreenRam:
	.zero	4
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
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$136, %esp
	movb	$0, -107(%ebp)
	movb	$-1, -106(%ebp)
	movb	$0, -105(%ebp)
	subl	$12, %esp
	pushl	$.LC0
	call	_Z5printPKc
	addl	$16, %esp
	subl	$12, %esp
	pushl	$255
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -64(%ebp)
	movl	$0, -28(%ebp)
	pushl	$500
	pushl	$400
	pushl	$0
	pushl	$0
	call	_Z10openWindowssss
	addl	$16, %esp
	movl	%eax, -68(%ebp)
	pushl	$600
	pushl	$500
	pushl	$50
	pushl	$50
	call	_Z10openWindowssss
	addl	$16, %esp
	movl	%eax, -72(%ebp)
	movb	$0, -29(%ebp)
	movb	$0, -73(%ebp)
	subl	$8, %esp
	pushl	$0
	pushl	-68(%ebp)
	call	_Z16getGraphicObjectP6Windows
	addl	$16, %esp
	movl	8(%eax), %eax
	movb	$0, 7(%eax)
	movb	$0, 8(%eax)
	movb	$0, 9(%eax)
	subl	$8, %esp
	pushl	$224
	pushl	$502
	call	_Z4outbth
	addl	$16, %esp
	subl	$8, %esp
	pushl	$236
	pushl	$503
	call	_Z4outbth
	addl	$16, %esp
	subl	$12, %esp
	pushl	$98
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -80(%ebp)
	subl	$12, %esp
	pushl	-80(%ebp)
	call	_Z12getDriveInfoPv
	addl	$16, %esp
	movl	-80(%ebp), %eax
	addl	$52, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printPKc
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	subl	$12, %esp
	pushl	-80(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	call	_Z7pciInitv
	call	_Z12printPciListv
	subl	$12, %esp
	pushl	$512
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -84(%ebp)
	subl	$12, %esp
	pushl	$512
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -88(%ebp)
	subl	$4, %esp
	pushl	$0
	pushl	$1
	pushl	-84(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	movl	-84(%ebp), %eax
	movl	454(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$1
	pushl	-88(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	movl	-84(%ebp), %eax
	movl	454(%eax), %edx
	movl	-88(%ebp), %eax
	movzwl	14(%eax), %eax
	movzwl	%ax, %eax
	leal	(%edx,%eax), %ecx
	movl	-88(%ebp), %eax
	movzbl	16(%eax), %eax
	movzbl	%al, %edx
	movl	-88(%ebp), %eax
	movl	36(%eax), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, -92(%ebp)
	subl	$12, %esp
	pushl	$512
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -96(%ebp)
	subl	$4, %esp
	pushl	-92(%ebp)
	pushl	$1
	pushl	-96(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	movl	-88(%ebp), %eax
	movzbl	13(%eax), %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movl	$0, -36(%ebp)
	jmp	.L2
.L7:
	movl	$0, -40(%ebp)
	jmp	.L3
.L4:
	movl	-36(%ebp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	-96(%ebp), %eax
	addl	%eax, %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	addl	$1, -40(%ebp)
.L3:
	cmpl	$7, -40(%ebp)
	jle	.L4
	subl	$12, %esp
	pushl	$46
	call	_Z5printc
	addl	$16, %esp
	movl	$8, -44(%ebp)
	jmp	.L5
.L6:
	movl	-36(%ebp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	-96(%ebp), %eax
	addl	%eax, %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	addl	$1, -44(%ebp)
.L5:
	cmpl	$10, -44(%ebp)
	jle	.L6
	subl	$12, %esp
	pushl	$.LC1
	call	_Z5printPKc
	addl	$16, %esp
	addl	$1, -36(%ebp)
.L2:
	cmpl	$15, -36(%ebp)
	jle	.L7
	nop
.L34:
	subl	$12, %esp
	pushl	$1
	call	_Z7ps2Waith
	addl	$16, %esp
	subl	$12, %esp
	pushl	$100
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$32, %eax
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L34
	call	_Z7getCharv
	movb	%al, -97(%ebp)
	movsbl	-97(%ebp), %eax
	cmpl	$8, %eax
	je	.L9
	cmpl	$10, %eax
	jne	.L10
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movl	-28(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	pushl	$5
	pushl	$.LC2
	pushl	$255
	pushl	-64(%ebp)
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L11
	call	_Z12clearConsolev
	jmp	.L12
.L11:
	pushl	$4
	pushl	$.LC3
	pushl	$255
	pushl	-64(%ebp)
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L13
	subl	$12, %esp
	pushl	$.LC4
	call	_Z5printPKc
	addl	$16, %esp
	jmp	.L12
.L13:
	pushl	$3
	pushl	$.LC5
	pushl	$255
	pushl	-64(%ebp)
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L14
	movl	$0, -48(%ebp)
	movl	$0, -52(%ebp)
	jmp	.L15
.L18:
	addl	$1, -52(%ebp)
.L16:
	movl	-52(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L17
	movl	-52(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L18
.L17:
	addl	$1, -48(%ebp)
	addl	$1, -52(%ebp)
.L15:
	movl	-52(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L16
	cmpl	$5, -48(%ebp)
	je	.L20
	subl	$12, %esp
	pushl	$.LC6
	call	_Z5printPKc
	addl	$16, %esp
	jmp	.L12
.L20:
	subl	$12, %esp
	pushl	$16
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -104(%ebp)
	movl	$0, -48(%ebp)
	movl	$0, -56(%ebp)
	movl	$4, -60(%ebp)
	jmp	.L21
.L26:
	movl	$0, -56(%ebp)
	jmp	.L22
.L25:
	cmpl	$3, -60(%ebp)
	jle	.L23
	movl	-60(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	leal	-127(%ebp), %ecx
	movl	-56(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	addl	$1, -56(%ebp)
.L23:
	addl	$1, -60(%ebp)
.L22:
	movl	-60(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L24
	movl	-60(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L25
.L24:
	leal	-127(%ebp), %edx
	movl	-56(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-48(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-104(%ebp), %eax
	leal	(%edx,%eax), %ebx
	subl	$8, %esp
	pushl	-56(%ebp)
	leal	-127(%ebp), %eax
	pushl	%eax
	call	_Z5toIntPKci
	addl	$16, %esp
	movl	%eax, (%ebx)
	addl	$1, -48(%ebp)
	addl	$1, -60(%ebp)
.L21:
	movl	-60(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L26
	movl	-104(%ebp), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movswl	%ax, %esi
	movl	-104(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movswl	%ax, %ebx
	movl	-104(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movswl	%ax, %ecx
	movl	-104(%ebp), %eax
	movl	(%eax), %eax
	cwtl
	movl	%eax, -140(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	-107(%ebp), %edi
	movw	%di, (%eax)
	movzbl	-105(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	-140(%ebp)
	call	_Z13drawRectanglessss5Color
	addl	$32, %esp
	jmp	.L12
.L14:
	pushl	$5
	pushl	$.LC7
	pushl	$255
	pushl	-64(%ebp)
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L27
	subl	$12, %esp
	pushl	-68(%ebp)
	call	_Z11closeWindowP6Window
	addl	$16, %esp
	call	_Z11drawWindowsv
	jmp	.L12
.L27:
	pushl	$5
	pushl	$.LC8
	pushl	$255
	pushl	-64(%ebp)
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L28
	cmpb	$0, -29(%ebp)
	jne	.L29
	subl	$12, %esp
	pushl	-68(%ebp)
	call	_Z16bringWindowFrontP6Window
	addl	$16, %esp
	movb	$1, -29(%ebp)
	jmp	.L30
.L29:
	subl	$12, %esp
	pushl	-72(%ebp)
	call	_Z16bringWindowFrontP6Window
	addl	$16, %esp
	movb	$0, -29(%ebp)
.L30:
	call	_Z11drawWindowsv
	jmp	.L12
.L28:
	cmpl	$0, -28(%ebp)
	je	.L12
	subl	$12, %esp
	pushl	$39
	call	_Z5printc
	addl	$16, %esp
	subl	$12, %esp
	pushl	-64(%ebp)
	call	_Z5printPKc
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC9
	call	_Z5printPKc
	addl	$16, %esp
.L12:
	movl	$0, -28(%ebp)
	subl	$12, %esp
	pushl	$.LC10
	call	_Z5printPKc
	addl	$16, %esp
	jmp	.L8
.L9:
	cmpl	$0, -28(%ebp)
	jle	.L35
	subl	$1, -28(%ebp)
	subl	$12, %esp
	pushl	$8
	call	_Z5printc
	addl	$16, %esp
	jmp	.L35
.L10:
	movsbl	-97(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printc
	addl	$16, %esp
	movzbl	-97(%ebp), %edx
	movl	-64(%ebp), %ebx
	movl	-28(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, -28(%ebp)
	addl	%ebx, %eax
	movb	%dl, (%eax)
	cmpl	$255, -28(%ebp)
	jle	.L36
	subl	$12, %esp
	pushl	$.LC11
	call	_Z5printPKc
	addl	$16, %esp
	movl	$0, -28(%ebp)
	jmp	.L36
.L35:
	nop
	jmp	.L34
.L36:
	nop
.L8:
	jmp	.L34
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	init
	.type	init, @function
init:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	call	_Z10initScreenv
	call	_Z10mallocInitv
	call	_Z7initGUIv
	movl	$1280, %eax
	movzwl	20(%eax), %eax
	movw	%ax, Kheight
	movl	$1280, %eax
	movzwl	18(%eax), %eax
	movw	%ax, Kwidth
	movl	$1280, %eax
	movl	40(%eax), %eax
	movl	%eax, KscreenRam
	call	main
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	init, .-init
	.ident	"GCC: (GNU) 13.1.0"
