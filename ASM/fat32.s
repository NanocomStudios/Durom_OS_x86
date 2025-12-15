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
	.align 4
	.type	partitionList, @object
	.size	partitionList, 4
partitionList:
	.zero	4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, partitionList
	subl	$12, %esp
	pushl	$.LC0
	call	_Z5printPKc
	addl	$16, %esp
	call	_Z15getHddEntryListv
	movl	%eax, -20(%ebp)
	call	_Z11getHddCountv
	movw	%ax, -22(%ebp)
	subl	$12, %esp
	pushl	$512
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -28(%ebp)
	movw	$0, -10(%ebp)
	jmp	.L2
.L11:
	movswl	-10(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	.L3
	movswl	-10(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movswl	-10(%ebp), %eax
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
	movl	-28(%ebp), %eax
	addl	$446, %eax
	movl	%eax, -32(%ebp)
	subl	$4, %esp
	pushl	$0
	pushl	$1
	pushl	-28(%ebp)
	call	_Z11readSectorsPvhj
	addl	$16, %esp
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L3
	movl	-28(%ebp), %eax
	movzwl	510(%eax), %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movb	$0, -11(%ebp)
	jmp	.L4
.L10:
	movsbl	-11(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movzbl	4(%eax), %eax
	cmpb	$12, %al
	je	.L5
	movsbl	-11(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movzbl	4(%eax), %eax
	cmpb	$11, %al
	jne	.L6
.L5:
	movl	partitionList, %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L8
	subl	$12, %esp
	pushl	$22
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, partitionList
	movsbl	-11(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%eax, %edx
	movl	partitionList, %eax
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
	movl	partitionList, %eax
	movl	$0, 18(%eax)
	movl	partitionList, %eax
	movzwl	-10(%ebp), %edx
	movw	%dx, 16(%eax)
	jmp	.L6
.L9:
	movl	-16(%ebp), %eax
	movl	18(%eax), %eax
	movl	%eax, -16(%ebp)
.L8:
	movl	-16(%ebp), %eax
	movl	18(%eax), %eax
	testl	%eax, %eax
	jne	.L9
	subl	$12, %esp
	pushl	$22
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	movsbl	-11(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%eax, %edx
	movl	-36(%ebp), %eax
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
	movl	-36(%ebp), %eax
	movl	$0, 18(%eax)
	movl	-36(%ebp), %eax
	movzwl	-10(%ebp), %edx
	movw	%dx, 16(%eax)
	movl	-16(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 18(%eax)
.L6:
	movzbl	-11(%ebp), %eax
	addl	$1, %eax
	movb	%al, -11(%ebp)
.L4:
	cmpb	$3, -11(%ebp)
	jle	.L10
.L3:
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L2:
	movzwl	-10(%ebp), %eax
	cmpw	-22(%ebp), %ax
	jl	.L11
	subl	$12, %esp
	pushl	-28(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC1
	call	_Z5printPKc
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z15initFat32Drivesv, .-_Z15initFat32Drivesv
	.globl	_Z17getPartitionCountv
	.type	_Z17getPartitionCountv, @function
_Z17getPartitionCountv:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movw	$0, -2(%ebp)
	movl	partitionList, %eax
	movl	%eax, -8(%ebp)
	jmp	.L13
.L14:
	movzwl	-2(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -2(%ebp)
	movl	-8(%ebp), %eax
	movl	18(%eax), %eax
	movl	%eax, -8(%ebp)
.L13:
	cmpl	$0, -8(%ebp)
	jne	.L14
	movzwl	-2(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z17getPartitionCountv, .-_Z17getPartitionCountv
	.globl	_Z12getPartitions
	.type	_Z12getPartitions, @function
_Z12getPartitions:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movw	$0, -2(%ebp)
	movl	partitionList, %eax
	movl	%eax, -8(%ebp)
	jmp	.L17
.L19:
	movzwl	-2(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -2(%ebp)
	movl	-8(%ebp), %eax
	movl	18(%eax), %eax
	movl	%eax, -8(%ebp)
.L17:
	cmpl	$0, -8(%ebp)
	je	.L18
	movzwl	-2(%ebp), %eax
	cmpw	-20(%ebp), %ax
	jl	.L19
.L18:
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movw	$0, -10(%ebp)
	movl	partitionList, %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L23
	subl	$12, %esp
	pushl	$.LC2
	call	_Z5printPKc
	addl	$16, %esp
	jmp	.L23
.L24:
	movswl	-10(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC3
	call	_Z5printPKc
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	shrl	%eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC4
	call	_Z5printPKc
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movzwl	16(%eax), %eax
	cwtl
	subl	$12, %esp
	pushl	%eax
	call	_Z8printIntl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
	movl	-16(%ebp), %eax
	movl	18(%eax), %eax
	movl	%eax, -16(%ebp)
.L23:
	cmpl	$0, -16(%ebp)
	jne	.L24
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z18printPartitionListv, .-_Z18printPartitionListv
	.ident	"GCC: (GNU) 13.1.0"
