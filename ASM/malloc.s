	.file	"malloc.cpp"
	.text
	.globl	ram
	.section	.bss
	.align 8
	.type	ram, @object
	.size	ram, 8
ram:
	.zero	8
	.globl	isInit
	.type	isInit, @object
	.size	isInit, 1
isInit:
	.zero	1
	.text
	.globl	_Z10mallocInitv
	.type	_Z10mallocInitv, @function
_Z10mallocInitv:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$32256, ram(%rip)
	movb	$0, isInit(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z10mallocInitv, .-_Z10mallocInitv
	.globl	_Z6malloci
	.type	_Z6malloci, @function
_Z6malloci:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$32748, -20(%rbp)
	jg	.L3
	cmpl	$0, -20(%rbp)
	jns	.L4
.L3:
	movl	$0, %eax
	jmp	.L5
.L4:
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	movzbl	isInit(%rip), %eax
	testb	%al, %al
	jne	.L6
	movq	ram(%rip), %rax
	addq	$4, %rax
	movl	$-1, (%rax)
	movq	ram(%rip), %rax
	addq	$8, %rax
	movl	$-1, (%rax)
	movq	ram(%rip), %rax
	movl	$20, (%rax)
	movl	$20, -4(%rbp)
	jmp	.L7
.L6:
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	_Z12getFreeBlocki
	movl	%eax, -4(%rbp)
.L7:
	cmpl	$-1, -4(%rbp)
	je	.L8
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$8, %rdx
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	movq	ram(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	subq	$4, %rcx
	addq	%rcx, %rdx
	movl	8(%rax), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L9
	movq	ram(%rip), %rax
	movq	ram(%rip), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L9:
	movb	$1, isInit(%rip)
	movq	ram(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	jmp	.L5
.L8:
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z6malloci, .-_Z6malloci
	.globl	_Z4freePv
	.type	_Z4freePv, @function
_Z4freePv:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	ram(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, %rdx
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	cltq
	cmpq	%rax, %rdx
	jne	.L11
	movq	ram(%rip), %rdx
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	cltq
	subq	$4, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L12
	movb	$0, isInit(%rip)
	jmp	.L19
.L12:
	movq	ram(%rip), %rdx
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	cltq
	subq	$4, %rax
	addq	%rax, %rdx
	movq	ram(%rip), %rax
	movl	(%rdx), %edx
	movl	%edx, (%rax)
	jmp	.L19
.L11:
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L18:
	cmpl	$32759, -4(%rbp)
	jg	.L19
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	ram(%rip), %rcx
	subq	%rcx, %rdx
	cmpq	%rdx, %rax
	jne	.L15
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	-4(%rax), %eax
	movl	%eax, (%rdx)
	jmp	.L14
.L15:
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	ram(%rip), %rcx
	subq	%rcx, %rdx
	cmpq	%rdx, %rax
	jle	.L16
	movl	-4(%rbp), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	ram(%rip), %rcx
	subq	%rcx, %rdx
	cmpq	%rdx, %rax
	jl	.L19
.L16:
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L20
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L18
.L20:
	nop
.L14:
.L19:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z4freePv, .-_Z4freePv
	.globl	_Z12getFreeBlocki
	.type	_Z12getFreeBlocki, @function
_Z12getFreeBlocki:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	leal	-20(%rax), %edx
	movl	-20(%rbp), %eax
	addl	$8, %eax
	cmpl	%eax, %edx
	jl	.L22
	movq	ram(%rip), %rax
	addq	$4, %rax
	movl	$-1, (%rax)
	movq	ram(%rip), %rax
	movq	ram(%rip), %rdx
	addq	$8, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	leal	-8(%rax), %edx
	movq	ram(%rip), %rax
	subl	-20(%rbp), %edx
	movl	%edx, (%rax)
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	jmp	.L23
.L22:
	movq	ram(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L27:
	cmpl	$32759, -4(%rbp)
	jg	.L24
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L25
	movq	ram(%rip), %rax
	leaq	4(%rax), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	addq	$8, %rax
	movl	$-1, (%rax)
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	addl	$8, %eax
	jmp	.L23
.L25:
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	leal	-8(%rax), %ecx
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	-4(%rbp), %eax
	movl	-20(%rbp), %edx
	addl	$8, %edx
	cmpl	%edx, %eax
	jl	.L26
	movq	ram(%rip), %rax
	leaq	4(%rax), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movq	ram(%rip), %rdx
	addq	$8, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	addl	$8, %eax
	jmp	.L23
.L26:
	movq	ram(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L27
.L24:
	movl	$-1, %eax
.L23:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z12getFreeBlocki, .-_Z12getFreeBlocki
	.ident	"GCC: (GNU) 7.5.0"
