	.file	"Nstring.cpp"
	.text
	.globl	_Z6strcmpPKclS0_l
	.type	_Z6strcmpPKclS0_l, @function
_Z6strcmpPKclS0_l:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-48(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jle	.L2
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
.L5:
	movq	-16(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jge	.L6
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L4
	subq	$1, -8(%rbp)
.L4:
	addq	$1, -16(%rbp)
	jmp	.L5
.L2:
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -24(%rbp)
.L8:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jge	.L6
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L7
	subq	$1, -8(%rbp)
.L7:
	addq	$1, -24(%rbp)
	jmp	.L8
.L6:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z6strcmpPKclS0_l, .-_Z6strcmpPKclS0_l
	.globl	_Z5toIntPKci
	.type	_Z5toIntPKci, @function
_Z5toIntPKci:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	$0, -24(%rbp)
	movl	-44(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
.L13:
	cmpl	$0, -28(%rbp)
	js	.L11
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jle	.L12
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jg	.L12
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movslq	%eax, %rbx
	movl	-44(%rbp), %eax
	subl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %esi
	movl	$10, %edi
	call	_Z3powii
	imulq	%rbx, %rax
	addq	%rax, -24(%rbp)
.L12:
	subl	$1, -28(%rbp)
	jmp	.L13
.L11:
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z5toIntPKci, .-_Z5toIntPKci
	.ident	"GCC: (GNU) 7.5.0"
