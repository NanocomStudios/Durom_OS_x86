	.file	"PCI.cpp"
	.text
	.globl	pciNodeList
	.section	.bss
	.align 4
	.type	pciNodeList, @object
	.size	pciNodeList, 4
pciNodeList:
	.zero	4
	.text
	.globl	_Z17pciConfigReadWordhhhh
	.type	_Z17pciConfigReadWordhhhh, @function
_Z17pciConfigReadWordhhhh:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movb	%bl, -44(%ebp)
	movb	%cl, -48(%ebp)
	movb	%dl, -52(%ebp)
	movb	%al, -56(%ebp)
	movzbl	-44(%ebp), %eax
	movl	%eax, -12(%ebp)
	movzbl	-48(%ebp), %eax
	movl	%eax, -16(%ebp)
	movzbl	-52(%ebp), %eax
	movl	%eax, -20(%ebp)
	movw	$0, -22(%ebp)
	movl	-12(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	sall	$11, %eax
	orl	%eax, %edx
	movl	-20(%ebp), %eax
	sall	$8, %eax
	orl	%eax, %edx
	movzbl	-56(%ebp), %eax
	andl	$252, %eax
	orl	%edx, %eax
	orl	$-2147483648, %eax
	movl	%eax, -28(%ebp)
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	$3320
	call	_Z4outltj
	addl	$16, %esp
	subl	$12, %esp
	pushl	$3324
	call	_Z3inlt
	addl	$16, %esp
	movzbl	-56(%ebp), %edx
	andl	$2, %edx
	sall	$3, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	movw	%ax, -22(%ebp)
	movzwl	-22(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z17pciConfigReadWordhhhh, .-_Z17pciConfigReadWordhhhh
	.globl	_Z19pciConfigReadDoublehhhh
	.type	_Z19pciConfigReadDoublehhhh, @function
_Z19pciConfigReadDoublehhhh:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movb	%bl, -44(%ebp)
	movb	%cl, -48(%ebp)
	movb	%dl, -52(%ebp)
	movb	%al, -56(%ebp)
	movzbl	-44(%ebp), %eax
	movl	%eax, -12(%ebp)
	movzbl	-48(%ebp), %eax
	movl	%eax, -16(%ebp)
	movzbl	-52(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	-12(%ebp), %eax
	sall	$16, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	sall	$11, %eax
	orl	%eax, %edx
	movl	-20(%ebp), %eax
	sall	$8, %eax
	orl	%eax, %edx
	movzbl	-56(%ebp), %eax
	andl	$252, %eax
	orl	%edx, %eax
	orl	$-2147483648, %eax
	movl	%eax, -28(%ebp)
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	$3320
	call	_Z4outltj
	addl	$16, %esp
	subl	$12, %esp
	pushl	$3324
	call	_Z3inlt
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z19pciConfigReadDoublehhhh, .-_Z19pciConfigReadDoublehhhh
	.globl	_Z7pciInitv
	.type	_Z7pciInitv, @function
_Z7pciInitv:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, pciNodeList
	movl	pciNodeList, %eax
	movl	%eax, -12(%ebp)
	movb	$0, -13(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L6
.L16:
	movl	$0, -24(%ebp)
	jmp	.L7
.L15:
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$14
	pushl	$0
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movzwl	%ax, %eax
	andl	$128, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L8
	movl	$0, -28(%ebp)
	jmp	.L9
.L12:
	movl	-28(%ebp), %eax
	movzbl	%al, %ecx
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$10
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movw	%ax, -32(%ebp)
	cmpw	$-1, -32(%ebp)
	je	.L10
	cmpb	$0, -13(%ebp)
	jne	.L11
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, (%eax)
	movl	-24(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 1(%eax)
	movl	-28(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 2(%eax)
	movzwl	-32(%ebp), %eax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 3(%eax)
	movzwl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-28(%ebp), %eax
	movzbl	%al, %ecx
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$8
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 5(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 6(%eax)
	movb	$1, -13(%ebp)
	jmp	.L10
.L11:
	subl	$12, %esp
	pushl	$10
	call	_Z6malloci
	addl	$16, %esp
	movl	-12(%ebp), %edx
	movl	%eax, 6(%edx)
	movl	-12(%ebp), %eax
	movl	6(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, (%eax)
	movl	-24(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 1(%eax)
	movl	-28(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 2(%eax)
	movzwl	-32(%ebp), %eax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 3(%eax)
	movzwl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-28(%ebp), %eax
	movzbl	%al, %ecx
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$8
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 5(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 6(%eax)
.L10:
	addl	$1, -28(%ebp)
.L9:
	cmpl	$7, -28(%ebp)
	jle	.L12
	jmp	.L13
.L8:
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$10
	pushl	$0
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movw	%ax, -30(%ebp)
	cmpw	$-1, -30(%ebp)
	je	.L13
	cmpb	$0, -13(%ebp)
	jne	.L14
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, (%eax)
	movl	-24(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 1(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 2(%eax)
	movzwl	-30(%ebp), %eax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 3(%eax)
	movzwl	-30(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$8
	pushl	$0
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 5(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 6(%eax)
	movb	$1, -13(%ebp)
	jmp	.L13
.L14:
	subl	$12, %esp
	pushl	$10
	call	_Z6malloci
	addl	$16, %esp
	movl	-12(%ebp), %edx
	movl	%eax, 6(%edx)
	movl	-12(%ebp), %eax
	movl	6(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, (%eax)
	movl	-24(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 1(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 2(%eax)
	movzwl	-30(%ebp), %eax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 3(%eax)
	movzwl	-30(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-24(%ebp), %eax
	movzbl	%al, %edx
	movl	-20(%ebp), %eax
	movzbl	%al, %eax
	pushl	$8
	pushl	$0
	pushl	%edx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, 5(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 6(%eax)
.L13:
	addl	$1, -24(%ebp)
.L7:
	cmpl	$31, -24(%ebp)
	jle	.L15
	addl	$1, -20(%ebp)
.L6:
	cmpl	$255, -20(%ebp)
	jle	.L16
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z7pciInitv, .-_Z7pciInitv
	.globl	_Z12printPciListv
	.type	_Z12printPciListv, @function
_Z12printPciListv:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	pciNodeList, %eax
	movl	%eax, -12(%ebp)
	jmp	.L18
.L19:
	movl	-12(%ebp), %eax
	movzbl	3(%eax), %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$32
	call	_Z5printc
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$32
	call	_Z5printc
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movl	6(%eax), %eax
	movl	%eax, -12(%ebp)
.L18:
	cmpl	$0, -12(%ebp)
	jne	.L19
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z12printPciListv, .-_Z12printPciListv
	.globl	_Z13getClassCounth
	.type	_Z13getClassCounth, @function
_Z13getClassCounth:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	pciNodeList, %eax
	movl	%eax, -4(%ebp)
	movw	$0, -6(%ebp)
	jmp	.L21
.L23:
	movl	-4(%ebp), %eax
	movzbl	3(%eax), %eax
	cmpb	%al, -20(%ebp)
	jne	.L22
	movzwl	-6(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -6(%ebp)
.L22:
	movl	-4(%ebp), %eax
	movl	6(%eax), %eax
	movl	%eax, -4(%ebp)
.L21:
	cmpl	$0, -4(%ebp)
	jne	.L23
	movzwl	-6(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z13getClassCounth, .-_Z13getClassCounth
	.globl	_Z16getClassCategoryh
	.type	_Z16getClassCategoryh, @function
_Z16getClassCategoryh:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	pciNodeList, %eax
	movl	%eax, -12(%ebp)
	movzbl	-28(%ebp), %eax
	pushl	%eax
	call	_Z13getClassCounth
	addl	$4, %esp
	movw	%ax, -16(%ebp)
	cmpw	$0, -16(%ebp)
	jne	.L26
	movl	$0, %eax
	jmp	.L27
.L26:
	movswl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	movw	$0, -14(%ebp)
	jmp	.L28
.L31:
	movl	-12(%ebp), %eax
	movzbl	3(%eax), %eax
	cmpb	%al, -28(%ebp)
	jne	.L29
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	1(%eax), %eax
	movb	%al, 1(%edx)
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	2(%eax), %eax
	movb	%al, 2(%edx)
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	3(%eax), %eax
	movb	%al, 3(%edx)
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	movb	%al, 4(%edx)
	movswl	-14(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	5(%eax), %eax
	movb	%al, 5(%edx)
	movzwl	-14(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -14(%ebp)
.L29:
	movl	-12(%ebp), %eax
	movl	6(%eax), %eax
	movl	%eax, -12(%ebp)
.L28:
	cmpl	$0, -12(%ebp)
	je	.L30
	movzwl	-14(%ebp), %eax
	cmpw	-16(%ebp), %ax
	jl	.L31
.L30:
	movl	-20(%ebp), %eax
.L27:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z16getClassCategoryh, .-_Z16getClassCategoryh
	.ident	"GCC: (GNU) 13.1.0"
