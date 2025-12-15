	.file	"Nstring.cpp"
	.text
	.globl	_Z6strcmpPKclS0_l
	.type	_Z6strcmpPKclS0_l, @function
_Z6strcmpPKclS0_l:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jle	.L2
	movl	20(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L3
.L5:
	movl	-8(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-8(%ebp), %ecx
	movl	16(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L4
	subl	$1, -4(%ebp)
.L4:
	addl	$1, -8(%ebp)
.L3:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L5
	jmp	.L6
.L2:
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L7
.L9:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	-12(%ebp), %ecx
	movl	16(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L8
	subl	$1, -4(%ebp)
.L8:
	addl	$1, -12(%ebp)
.L7:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L9
.L6:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z6strcmpPKclS0_l, .-_Z6strcmpPKclS0_l
	.globl	_Z5toIntPKci
	.type	_Z5toIntPKci, @function
_Z5toIntPKci:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	$0, -12(%ebp)
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	.L12
.L14:
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L13
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jg	.L13
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	leal	-48(%eax), %ebx
	movl	12(%ebp), %eax
	subl	-16(%ebp), %eax
	subl	$1, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$10
	call	_Z3powii
	addl	$16, %esp
	imull	%ebx, %eax
	addl	%eax, -12(%ebp)
.L13:
	subl	$1, -16(%ebp)
.L12:
	cmpl	$0, -16(%ebp)
	jns	.L14
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z5toIntPKci, .-_Z5toIntPKci
	.ident	"GCC: (GNU) 13.1.0"
