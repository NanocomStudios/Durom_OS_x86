	.file	"fat32.cpp"
	.text
	.globl	partitionCount
	.section	.bss
	.align 2
	.type	partitionCount, @object
	.size	partitionCount, 2
partitionCount:
	.zero	2
	.globl	partitionList
	.align 8
	.type	partitionList, @object
	.size	partitionList, 8
partitionList:
	.zero	8
	.section	.rodata
.LC0:
	.string	"Init fat32\n"
.LC1:
	.string	"Init fat32 done\n"
	.text
	.globl	_Z15initFat32Drivesv
	.type	_Z15initFat32Drivesv, @function
_Z15initFat32Drivesv:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	$0, partitionList(%rip)
	movl	$.LC0, %edi
	call	_Z5printPKc
	call	_Z15getHddEntryListv
	movq	%rax, -24(%rbp)
	call	_Z11getHddCountv
	movw	%ax, -26(%rbp)
	movl	$512, %edi
	call	_Z6malloci
	movq	%rax, -40(%rbp)
	movw	$0, -2(%rbp)
.L11:
	movzwl	-2(%rbp), %eax
	cmpw	-26(%rbp), %ax
	jge	.L2
	movswq	-2(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L3
	movswq	-2(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movswq	-2(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzwl	2(%rax), %eax
	cwtl
	movl	$1, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z8setDrivescc
	call	_Z7hddWaitv
	movq	-40(%rbp), %rax
	addq	$446, %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	_Z11readSectorsPvhj
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L3
	movq	-40(%rbp), %rax
	movzwl	510(%rax), %eax
	movzwl	%ax, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$10, %edi
	call	_Z5printc
	movb	$0, -3(%rbp)
.L10:
	cmpb	$3, -3(%rbp)
	jg	.L3
	movsbq	-3(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	4(%rax), %eax
	cmpb	$12, %al
	je	.L6
	movsbq	-3(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	4(%rax), %eax
	cmpb	$11, %al
	jne	.L7
.L6:
	movq	partitionList(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L8
	movl	$26, %edi
	call	_Z6malloci
	movq	%rax, partitionList(%rip)
	movsbq	-3(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	partitionList(%rip), %rcx
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	partitionList(%rip), %rax
	movq	$0, 18(%rax)
	movq	partitionList(%rip), %rax
	movzwl	-2(%rbp), %edx
	movw	%dx, 16(%rax)
	jmp	.L7
.L8:
	movq	-16(%rbp), %rax
	movq	18(%rax), %rax
	testq	%rax, %rax
	je	.L9
	movq	-16(%rbp), %rax
	movq	18(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L8
.L9:
	movl	$26, %edi
	call	_Z6malloci
	movq	%rax, -56(%rbp)
	movsbq	-3(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	-56(%rbp), %rcx
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-56(%rbp), %rax
	movq	$0, 18(%rax)
	movq	-56(%rbp), %rax
	movzwl	-2(%rbp), %edx
	movw	%dx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 18(%rax)
.L7:
	movzbl	-3(%rbp), %eax
	addl	$1, %eax
	movb	%al, -3(%rbp)
	jmp	.L10
.L3:
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	jmp	.L11
.L2:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	movl	$.LC1, %edi
	call	_Z5printPKc
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z15initFat32Drivesv, .-_Z15initFat32Drivesv
	.globl	_Z17getPartitionCountv
	.type	_Z17getPartitionCountv, @function
_Z17getPartitionCountv:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movw	$0, -2(%rbp)
	movq	partitionList(%rip), %rax
	movq	%rax, -16(%rbp)
.L14:
	cmpq	$0, -16(%rbp)
	je	.L13
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	movq	-16(%rbp), %rax
	movq	18(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L14
.L13:
	movzwl	-2(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z17getPartitionCountv, .-_Z17getPartitionCountv
	.globl	_Z12getPartitions
	.type	_Z12getPartitions, @function
_Z12getPartitions:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movw	%ax, -20(%rbp)
	movw	$0, -2(%rbp)
	movq	partitionList(%rip), %rax
	movq	%rax, -16(%rbp)
.L18:
	cmpq	$0, -16(%rbp)
	je	.L17
	movzwl	-2(%rbp), %eax
	cmpw	-20(%rbp), %ax
	jge	.L17
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	movq	-16(%rbp), %rax
	movq	18(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L18
.L17:
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z12getPartitions, .-_Z12getPartitions
	.section	.rodata
.LC2:
	.string	"No Partitions Available.\n"
.LC3:
	.string	"> "
.LC4:
	.string	" KB.  Drive -> "
	.text
	.globl	_Z18printPartitionListv
	.type	_Z18printPartitionListv, @function
_Z18printPartitionListv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movw	$0, -2(%rbp)
	movq	partitionList(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L23
	movl	$.LC2, %edi
	call	_Z5printPKc
.L23:
	cmpq	$0, -16(%rbp)
	je	.L24
	movswq	-2(%rbp), %rax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$.LC3, %edi
	call	_Z5printPKc
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	shrl	%eax
	movl	%eax, %eax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$.LC4, %edi
	call	_Z5printPKc
	movq	-16(%rbp), %rax
	movzwl	16(%rax), %eax
	movswq	%ax, %rax
	movq	%rax, %rdi
	call	_Z8printIntl
	movl	$10, %edi
	call	_Z5printc
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	movq	-16(%rbp), %rax
	movq	18(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L23
.L24:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z18printPartitionListv, .-_Z18printPartitionListv
	.ident	"GCC: (GNU) 7.5.0"
