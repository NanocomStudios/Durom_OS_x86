	.file	"bootloader.cpp"
	.text
	.section	.rodata
.LC0:
	.string	"KERNEL  BIN"
.LC1:
	.string	"Kernel found!\n"
.LC2:
	.string	" Bytes\nLoading...\n"
.LC3:
	.string	"Kernel.bin not found!\n"
	.text
	.globl	_Z12searchKernelv
	.type	_Z12searchKernelv, @function
_Z12searchKernelv:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	_Z15getHddEntryListv
	movl	%eax, -20(%ebp)
	call	_Z17getPartitionCountv
	movw	%ax, -22(%ebp)
	subl	$12, %esp
	pushl	$512
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -28(%ebp)
	movw	$0, -10(%ebp)
	jmp	.L2
.L7:
	movswl	-10(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z12getPartitions
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movzwl	16(%eax), %eax
	cwtl
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	-32(%ebp), %eax
	movzwl	16(%eax), %eax
	cwtl
	leal	0(,%eax,4), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movzwl	2(%eax), %eax
	cwtl
	subl	$4, %esp
	pushl	$1
	pushl	%edx
	pushl	%eax
	call	_Z8setDrivescc
	addl	$16, %esp
	call	_Z7hddWaitv
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$1
	pushl	-28(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	movl	-32(%ebp), %eax
	movl	8(%eax), %edx
	movl	-28(%ebp), %eax
	movzwl	14(%eax), %eax
	movzwl	%ax, %eax
	leal	(%edx,%eax), %ecx
	movl	-28(%ebp), %eax
	movzbl	16(%eax), %eax
	movzbl	%al, %edx
	movl	-28(%ebp), %eax
	movl	36(%eax), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, -36(%ebp)
	movl	-28(%ebp), %eax
	movzbl	13(%eax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	movl	-28(%ebp), %eax
	movzbl	13(%eax), %eax
	movzbl	%al, %eax
	subl	$4, %esp
	pushl	-36(%ebp)
	pushl	%eax
	pushl	-40(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	movl	$0, -16(%ebp)
	jmp	.L3
.L6:
	movl	-16(%ebp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	pushl	$11
	pushl	$.LC0
	pushl	$11
	pushl	%eax
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L4
	subl	$12, %esp
	pushl	$.LC1
	call	_Z5printPKc
	addl	$16, %esp
	movl	-16(%ebp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	28(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC2
	call	_Z5printPKc
	addl	$16, %esp
	jmp	.L1
.L4:
	addl	$1, -16(%ebp)
.L3:
	movl	-28(%ebp), %eax
	movzbl	13(%eax), %eax
	movzbl	%al, %eax
	sall	$4, %eax
	cmpl	%eax, -16(%ebp)
	jl	.L6
	subl	$12, %esp
	pushl	$.LC3
	call	_Z5printPKc
	addl	$16, %esp
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L2:
	movzwl	-10(%ebp), %eax
	cmpw	-22(%ebp), %ax
	jl	.L7
	movb	$0, -43(%ebp)
	movb	$-1, -42(%ebp)
	movb	$-1, -41(%ebp)
	subl	$12, %esp
	subl	$4, %esp
	movl	%esp, %eax
	movzwl	-43(%ebp), %edx
	movw	%dx, (%eax)
	movzbl	-41(%ebp), %edx
	movb	%dl, 2(%eax)
	pushl	$20
	pushl	$400
	pushl	$100
	pushl	$20
	call	_Z8drawLinessss5Color
	addl	$32, %esp
.L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z12searchKernelv, .-_Z12searchKernelv
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	call	_Z12printPciListv
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	call	_Z7listHddv
	call	_Z18printPartitionListv
	call	_Z12searchKernelv
	nop
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	init
	.type	init, @function
init:
.LFB3:
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
	call	_Z7pciInitv
	call	_Z7hddInitv
	call	_Z15initFat32Drivesv
	call	main
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	init, .-init
	.ident	"GCC: (GNU) 13.1.0"
