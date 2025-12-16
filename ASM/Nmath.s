	.file	"Nmath.cpp"
	.text
	.globl	_Z3powii
	.type	_Z3powii, @function
_Z3powii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	$1, -8(%rbp)
	movl	$0, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.L2
	movl	-20(%rbp), %eax
	cltq
	movq	-8(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	addl	$1, -12(%rbp)
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3powii, .-_Z3powii
	.ident	"GCC: (GNU) 7.5.0"
