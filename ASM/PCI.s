	.file	"PCI.cpp"
	.text
	.globl	pciNodeList
	.section	.bss
	.align 8
	.type	pciNodeList, @object
	.size	pciNodeList, 8
pciNodeList:
	.zero	8
	.text
	.globl	_Z17pciConfigReadWordhhhh
	.type	_Z17pciConfigReadWordhhhh, @function
_Z17pciConfigReadWordhhhh:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%ecx, %eax
	movl	%edi, %ecx
	movb	%cl, -36(%rbp)
	movl	%esi, %ecx
	movb	%cl, -40(%rbp)
	movb	%dl, -44(%rbp)
	movb	%al, -48(%rbp)
	movzbl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
	movzbl	-40(%rbp), %eax
	movl	%eax, -8(%rbp)
	movzbl	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	movw	$0, -14(%rbp)
	movl	-4(%rbp), %eax
	sall	$16, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	sall	$11, %eax
	orl	%eax, %edx
	movl	-12(%rbp), %eax
	sall	$8, %eax
	orl	%eax, %edx
	movzbl	-48(%rbp), %eax
	andl	$252, %eax
	orl	%edx, %eax
	orl	$-2147483648, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$3320, %edi
	call	_Z4outltj
	movl	$3324, %edi
	call	_Z3inlt
	movl	%eax, %edx
	movzbl	-48(%rbp), %eax
	andl	$2, %eax
	sall	$3, %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	movw	%ax, -14(%rbp)
	movzwl	-14(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z17pciConfigReadWordhhhh, .-_Z17pciConfigReadWordhhhh
	.globl	_Z19pciConfigReadDoublehhhh
	.type	_Z19pciConfigReadDoublehhhh, @function
_Z19pciConfigReadDoublehhhh:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%ecx, %eax
	movl	%edi, %ecx
	movb	%cl, -36(%rbp)
	movl	%esi, %ecx
	movb	%cl, -40(%rbp)
	movb	%dl, -44(%rbp)
	movb	%al, -48(%rbp)
	movzbl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
	movzbl	-40(%rbp), %eax
	movl	%eax, -8(%rbp)
	movzbl	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	-4(%rbp), %eax
	sall	$16, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	sall	$11, %eax
	orl	%eax, %edx
	movl	-12(%rbp), %eax
	sall	$8, %eax
	orl	%eax, %edx
	movzbl	-48(%rbp), %eax
	andl	$252, %eax
	orl	%edx, %eax
	orl	$-2147483648, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$3320, %edi
	call	_Z4outltj
	movl	$3324, %edi
	call	_Z3inlt
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z19pciConfigReadDoublehhhh, .-_Z19pciConfigReadDoublehhhh
	.globl	_Z7pciInitv
	.type	_Z7pciInitv, @function
_Z7pciInitv:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$14, %edi
	call	_Z6malloci
	movq	%rax, pciNodeList(%rip)
	movq	pciNodeList(%rip), %rax
	movq	%rax, -8(%rbp)
	movb	$0, -9(%rbp)
	movl	$0, -16(%rbp)
.L18:
	cmpl	$255, -16(%rbp)
	jg	.L19
	movl	$0, -20(%rbp)
.L17:
	cmpl	$31, -20(%rbp)
	jg	.L7
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$14, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	andl	$128, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L8
	movl	$0, -24(%rbp)
.L13:
	cmpl	$7, -24(%rbp)
	jg	.L14
	movl	-24(%rbp), %eax
	movzbl	%al, %edx
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$10, %ecx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movw	%ax, -28(%rbp)
	cmpw	$-1, -28(%rbp)
	je	.L10
	cmpb	$0, -9(%rbp)
	jne	.L11
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 1(%rax)
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 2(%rax)
	movzwl	-28(%rbp), %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 3(%rax)
	movzwl	-28(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 4(%rax)
	movl	-24(%rbp), %eax
	movzbl	%al, %edx
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$8, %ecx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 5(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 6(%rax)
	movb	$1, -9(%rbp)
	jmp	.L10
.L11:
	movl	$14, %edi
	call	_Z6malloci
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 6(%rax)
	movq	-8(%rbp), %rax
	movq	6(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 1(%rax)
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 2(%rax)
	movzwl	-28(%rbp), %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 3(%rax)
	movzwl	-28(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 4(%rax)
	movl	-24(%rbp), %eax
	movzbl	%al, %edx
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$8, %ecx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 5(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 6(%rax)
.L10:
	addl	$1, -24(%rbp)
	jmp	.L13
.L8:
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$10, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movw	%ax, -26(%rbp)
	cmpw	$-1, -26(%rbp)
	je	.L14
	cmpb	$0, -9(%rbp)
	jne	.L15
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 1(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 2(%rax)
	movzwl	-26(%rbp), %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 3(%rax)
	movzwl	-26(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 4(%rax)
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$8, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 5(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 6(%rax)
	movb	$1, -9(%rbp)
	jmp	.L14
.L15:
	movl	$14, %edi
	call	_Z6malloci
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 6(%rax)
	movq	-8(%rbp), %rax
	movq	6(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 1(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 2(%rax)
	movzwl	-26(%rbp), %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 3(%rax)
	movzwl	-26(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 4(%rax)
	movl	-20(%rbp), %eax
	movzbl	%al, %esi
	movl	-16(%rbp), %eax
	movzbl	%al, %eax
	movl	$8, %ecx
	movl	$0, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 5(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 6(%rax)
.L14:
	addl	$1, -20(%rbp)
	jmp	.L17
.L7:
	addl	$1, -16(%rbp)
	jmp	.L18
.L19:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z7pciInitv, .-_Z7pciInitv
	.globl	_Z12printPciListv
	.type	_Z12printPciListv, @function
_Z12printPciListv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	pciNodeList(%rip), %rax
	movq	%rax, -8(%rbp)
.L22:
	cmpq	$0, -8(%rbp)
	je	.L23
	movq	-8(%rbp), %rax
	movzbl	3(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$32, %edi
	call	_Z5printc
	movq	-8(%rbp), %rax
	movzbl	4(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$32, %edi
	call	_Z5printc
	movq	-8(%rbp), %rax
	movzbl	5(%rax), %eax
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$10, %edi
	call	_Z5printc
	movq	-8(%rbp), %rax
	movq	6(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L22
.L23:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z12printPciListv, .-_Z12printPciListv
	.globl	_Z13getClassCounth
	.type	_Z13getClassCounth, @function
_Z13getClassCounth:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movq	pciNodeList(%rip), %rax
	movq	%rax, -8(%rbp)
	movw	$0, -10(%rbp)
.L27:
	cmpq	$0, -8(%rbp)
	je	.L25
	movq	-8(%rbp), %rax
	movzbl	3(%rax), %eax
	cmpb	%al, -20(%rbp)
	jne	.L26
	movzwl	-10(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -10(%rbp)
.L26:
	movq	-8(%rbp), %rax
	movq	6(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L27
.L25:
	movzwl	-10(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z13getClassCounth, .-_Z13getClassCounth
	.globl	_Z16getClassCategoryh
	.type	_Z16getClassCategoryh, @function
_Z16getClassCategoryh:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %eax
	movb	%al, -36(%rbp)
	movq	pciNodeList(%rip), %rax
	movq	%rax, -8(%rbp)
	movzbl	-36(%rbp), %eax
	movl	%eax, %edi
	call	_Z13getClassCounth
	movw	%ax, -12(%rbp)
	cmpw	$0, -12(%rbp)
	jne	.L30
	movl	$0, %eax
	jmp	.L31
.L30:
	movswq	-12(%rbp), %rax
	imull	$14, %eax, %eax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, -24(%rbp)
	movw	$0, -10(%rbp)
.L34:
	cmpq	$0, -8(%rbp)
	je	.L32
	movzwl	-10(%rbp), %eax
	cmpw	-12(%rbp), %ax
	jge	.L32
	movq	-8(%rbp), %rax
	movzbl	3(%rax), %eax
	cmpb	%al, -36(%rbp)
	jne	.L33
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	1(%rax), %eax
	movb	%al, 1(%rdx)
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	2(%rax), %eax
	movb	%al, 2(%rdx)
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	3(%rax), %eax
	movb	%al, 3(%rdx)
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	4(%rax), %eax
	movb	%al, 4(%rdx)
	movswq	-10(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	5(%rax), %eax
	movb	%al, 5(%rdx)
	movzwl	-10(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -10(%rbp)
.L33:
	movq	-8(%rbp), %rax
	movq	6(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L34
.L32:
	movq	-24(%rbp), %rax
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z16getClassCategoryh, .-_Z16getClassCategoryh
	.ident	"GCC: (GNU) 7.5.0"
