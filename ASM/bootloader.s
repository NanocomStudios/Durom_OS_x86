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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	call	_Z15getHddEntryListv
	movq	%rax, -16(%rbp)
	call	_Z17getPartitionCountv
	movw	%ax, -18(%rbp)
	movl	$512, %edi
	call	_Z6malloci
	movq	%rax, -32(%rbp)
	movw	$0, -2(%rbp)
.L7:
	movzwl	-2(%rbp), %eax
	cmpw	-18(%rbp), %ax
	jge	.L2
	movswl	-2(%rbp), %eax
	movl	%eax, %edi
	call	_Z12getPartitions
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movzwl	16(%rax), %eax
	movswq	%ax, %rax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movq	-40(%rbp), %rax
	movzwl	16(%rax), %eax
	movswq	%ax, %rax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzwl	2(%rax), %eax
	cwtl
	movl	$1, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z8setDrivescc
	call	_Z7hddWaitv
	movq	-40(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	movq	-40(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movzwl	14(%rax), %eax
	movzwl	%ax, %eax
	leal	(%rdx,%rax), %ecx
	movq	-32(%rbp), %rax
	movzbl	16(%rax), %eax
	movzbl	%al, %edx
	movq	-32(%rbp), %rax
	movl	36(%rax), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rax
	movzbl	13(%rax), %eax
	movzbl	%al, %eax
	sall	$9, %eax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, -56(%rbp)
	movq	-32(%rbp), %rax
	movzbl	13(%rax), %eax
	movzbl	%al, %ecx
	movl	-44(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	movl	$0, -8(%rbp)
.L6:
	movq	-32(%rbp), %rax
	movzbl	13(%rax), %eax
	movzbl	%al, %eax
	sall	$4, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L3
	movl	-8(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	$11, %ecx
	movl	$.LC0, %edx
	movl	$11, %esi
	movq	%rax, %rdi
	call	_Z6strcmpPKclS0_l
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L4
	movl	$.LC1, %edi
	call	_Z5printPKc
	movl	-8(%rbp), %eax
	cltq
	salq	$5, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	28(%rax), %eax
	movl	%eax, %eax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$.LC2, %edi
	call	_Z5printPKc
	jmp	.L1
.L4:
	addl	$1, -8(%rbp)
	jmp	.L6
.L3:
	movl	$.LC3, %edi
	call	_Z5printPKc
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	jmp	.L7
.L2:
	movb	$0, -59(%rbp)
	movb	$-1, -58(%rbp)
	movb	$-1, -57(%rbp)
	movzbl	-59(%rbp), %eax
	movzbl	-58(%rbp), %edx
	salq	$8, %rdx
	orq	%rax, %rdx
	movzbl	-57(%rbp), %eax
	salq	$16, %rax
	orq	%rdx, %rax
	movq	%rax, %r8
	movl	$20, %ecx
	movl	$400, %edx
	movl	$100, %esi
	movl	$20, %edi
	call	_Z8drawLinessss5Color
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z12searchKernelv, .-_Z12searchKernelv
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z12printPciListv
	movl	$10, %edi
	call	_Z5printc
	call	_Z7listHddv
	call	_Z18printPartitionListv
	call	_Z12searchKernelv
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.globl	init
	.type	init, @function
init:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z10initScreenv
	call	_Z10mallocInitv
	call	_Z7initGUIv
	call	_Z7pciInitv
	call	_Z7hddInitv
	call	_Z15initFat32Drivesv
	call	main
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	init, .-init
	.ident	"GCC: (GNU) 7.5.0"
