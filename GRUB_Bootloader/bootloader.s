	.file	"bootloader.cpp"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"KERNEL  BIN"
.LC1:
	.string	"Kernel found!\n"
.LC2:
	.string	" Bytes\nLoading...\n"
.LC3:
	.string	"Kernel.bin not found!\n"
	.text
	.p2align 4
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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	_Z15getHddEntryListv
	movl	%eax, -48(%ebp)
	call	_Z17getPartitionCountv
	subl	$12, %esp
	pushl	$512
	movl	%eax, %esi
	call	_Z6malloci
	addl	$16, %esp
	testw	%si, %si
	jle	.L2
	movl	%eax, %ebx
	movswl	%si, %eax
	movl	$0, -44(%ebp)
	movl	%eax, -52(%ebp)
.L7:
	subl	$12, %esp
	pushl	-44(%ebp)
	call	_Z12getPartitions
	movl	-48(%ebp), %edx
	addl	$12, %esp
	movl	%eax, %esi
	movswl	16(%eax), %eax
	pushl	$1
	leal	(%edx,%eax,4), %eax
	movsbl	1(%eax), %ecx
	pushl	%ecx
	movswl	2(%eax), %eax
	pushl	%eax
	call	_Z8setDrivescc
	addl	$16, %esp
	call	_Z7hddWaitv
	subl	$4, %esp
	pushl	8(%esi)
	pushl	$1
	pushl	%ebx
	call	_Z11readSectorsPvhj
	movzbl	16(%ebx), %ecx
	imull	36(%ebx), %ecx
	movzwl	14(%ebx), %eax
	addl	%eax, %ecx
	movzbl	13(%ebx), %eax
	addl	8(%esi), %ecx
	movl	%ecx, %esi
	sall	$9, %eax
	movl	%eax, (%esp)
	call	_Z6malloci
	addl	$12, %esp
	pushl	%esi
	movl	%eax, %edi
	movzbl	13(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	cmpb	$0, 13(%ebx)
	je	.L3
	xorl	%esi, %esi
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	13(%ebx), %eax
	addl	$1, %esi
	addl	$32, %edi
	sall	$4, %eax
	cmpl	%esi, %eax
	jle	.L3
.L6:
	pushl	$11
	pushl	$.LC0
	pushl	$11
	pushl	%edi
	call	_Z6strcmpPKclS0_l
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L4
	subl	$12, %esp
	pushl	$.LC1
	call	_Z5printPKc
	popl	%edx
	pushl	28(%edi)
	call	_Z8printIntl
	movl	$.LC2, (%esp)
	call	_Z5printPKc
	addl	$16, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	subl	$12, %esp
	pushl	$.LC3
	call	_Z5printPKc
	addl	$1, -44(%ebp)
	addl	$16, %esp
	movl	-44(%ebp), %eax
	cmpl	%eax, -52(%ebp)
	jne	.L7
.L2:
	subl	$16, %esp
	movl	$-256, %eax
	movw	%ax, (%esp)
	movb	$-1, 2(%esp)
	pushl	$20
	pushl	$400
	pushl	$100
	pushl	$20
	call	_Z8drawLinessss5Color
	addl	$32, %esp
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
.LFE1:
	.size	_Z12searchKernelv, .-_Z12searchKernelv
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	.text
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB3:
	.cfi_startproc
	movb	$65, 753664
.L15:
	jmp	.L15
	.cfi_endproc
.LFE3:
	.size	init, .-init
	.ident	"GCC: (GNU) 13.1.0"
