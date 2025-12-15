	.file	"malloc.cpp"
	.text
	.globl	ram
	.section	.bss
	.align 4
	.type	ram, @object
	.size	ram, 4
ram:
	.zero	4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$32256, ram
	movb	$0, isInit
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z10mallocInitv, .-_Z10mallocInitv
	.globl	_Z6malloci
	.type	_Z6malloci, @function
_Z6malloci:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$32748, 8(%ebp)
	jg	.L3
	cmpl	$0, 8(%ebp)
	jns	.L4
.L3:
	movl	$0, %eax
	jmp	.L5
.L4:
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movzbl	isInit, %eax
	testb	%al, %al
	jne	.L6
	movl	ram, %eax
	addl	$4, %eax
	movl	$-1, (%eax)
	movl	ram, %eax
	addl	$8, %eax
	movl	$-1, (%eax)
	movl	ram, %eax
	movl	$20, (%eax)
	movl	$20, -12(%ebp)
	jmp	.L7
.L6:
	subl	$12, %esp
	pushl	-16(%ebp)
	call	_Z12getFreeBlocki
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.L7:
	cmpl	$-1, -12(%ebp)
	je	.L8
	movl	ram, %eax
	movl	-12(%ebp), %edx
	subl	$8, %edx
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	movl	ram, %edx
	movl	-12(%ebp), %ecx
	subl	$4, %ecx
	addl	%ecx, %edx
	movl	8(%eax), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	addl	$4, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	je	.L9
	movl	ram, %eax
	movl	ram, %edx
	addl	$4, %edx
	movl	(%edx), %edx
	subl	$4, %edx
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
.L9:
	movb	$1, isInit
	movl	ram, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	jmp	.L5
.L8:
	movl	$0, %eax
.L5:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z6malloci, .-_Z6malloci
	.globl	_Z4freePv
	.type	_Z4freePv, @function
_Z4freePv:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	ram, %eax
	movl	8(%ebp), %edx
	subl	%eax, %edx
	movl	ram, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	.L11
	movl	ram, %edx
	movl	ram, %eax
	movl	(%eax), %eax
	subl	$4, %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	jne	.L12
	movb	$0, isInit
	jmp	.L19
.L12:
	movl	ram, %edx
	movl	ram, %eax
	movl	(%eax), %eax
	subl	$4, %eax
	addl	%eax, %edx
	movl	ram, %eax
	movl	(%edx), %edx
	movl	%edx, (%eax)
	jmp	.L19
.L11:
	movl	ram, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	.L14
.L18:
	movl	ram, %eax
	movl	-4(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	ram, %eax
	movl	8(%ebp), %edx
	subl	%eax, %edx
	cmpl	%edx, %ecx
	jne	.L15
	movl	ram, %eax
	movl	-4(%ebp), %edx
	subl	$4, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	-4(%eax), %eax
	movl	%eax, (%edx)
	jmp	.L13
.L15:
	movl	ram, %eax
	movl	-4(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	ram, %eax
	movl	8(%ebp), %edx
	subl	%eax, %edx
	cmpl	%edx, %ecx
	jle	.L16
	movl	ram, %eax
	movl	8(%ebp), %edx
	subl	%eax, %edx
	cmpl	%edx, -4(%ebp)
	jl	.L19
.L16:
	movl	ram, %eax
	movl	-4(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	je	.L20
	movl	ram, %eax
	movl	-4(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
.L14:
	cmpl	$32759, -4(%ebp)
	jle	.L18
	jmp	.L19
.L20:
	nop
.L13:
.L19:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z4freePv, .-_Z4freePv
	.globl	_Z12getFreeBlocki
	.type	_Z12getFreeBlocki, @function
_Z12getFreeBlocki:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 3, -12
	movl	ram, %eax
	movl	(%eax), %eax
	leal	-19(%eax), %edx
	movl	8(%ebp), %eax
	addl	$8, %eax
	cmpl	%eax, %edx
	jle	.L22
	movl	ram, %eax
	addl	$4, %eax
	movl	$-1, (%eax)
	movl	ram, %eax
	movl	ram, %edx
	addl	$8, %edx
	movl	(%eax), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	movl	(%eax), %eax
	leal	-8(%eax), %edx
	movl	ram, %eax
	subl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	ram, %eax
	movl	(%eax), %eax
	jmp	.L23
.L22:
	movl	ram, %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	jmp	.L24
.L27:
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	jne	.L25
	movl	ram, %eax
	leal	4(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	addl	$8, %eax
	movl	$-1, (%eax)
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$8, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	addl	$8, %eax
	jmp	.L23
.L25:
	movl	8(%ebp), %eax
	leal	7(%eax), %ecx
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	leal	-8(%eax), %ebx
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$8, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	%eax, %ebx
	movl	%ebx, %edx
	movl	%edx, %eax
	subl	-8(%ebp), %eax
	cmpl	%eax, %ecx
	jge	.L26
	movl	ram, %eax
	leal	4(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	ram, %edx
	addl	$8, %edx
	movl	(%eax), %eax
	movl	%eax, (%edx)
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$8, %edx
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	addl	%edx, %eax
	addl	$8, %eax
	jmp	.L23
.L26:
	movl	ram, %eax
	movl	-8(%ebp), %edx
	subl	$4, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
.L24:
	cmpl	$32759, -8(%ebp)
	jle	.L27
	movl	$-1, %eax
.L23:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z12getFreeBlocki, .-_Z12getFreeBlocki
	.ident	"GCC: (GNU) 13.1.0"
