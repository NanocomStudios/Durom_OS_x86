	.file	"GUI.cpp"
	.text
	.globl	windowListHead
	.section	.bss
	.align 8
	.type	windowListHead, @object
	.size	windowListHead, 8
windowListHead:
	.zero	8
	.globl	borderColor
	.type	borderColor, @object
	.size	borderColor, 3
borderColor:
	.zero	3
	.globl	fillColor
	.type	fillColor, @object
	.size	fillColor, 3
fillColor:
	.zero	3
	.text
	.globl	_Z13getLastWindowv
	.type	_Z13getLastWindowv, @function
_Z13getLastWindowv:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	windowListHead(%rip), %rax
	testq	%rax, %rax
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	windowListHead(%rip), %rax
	movq	%rax, -8(%rbp)
.L5:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L4
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L5
.L4:
	movq	-8(%rbp), %rax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z13getLastWindowv, .-_Z13getLastWindowv
	.globl	_Z16getGraphicObjectP6Windows
	.type	_Z16getGraphicObjectP6Windows, @function
_Z16getGraphicObjectP6Windows:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, %eax
	movw	%ax, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L8:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L7
	movq	-8(%rbp), %rax
	movzwl	24(%rax), %eax
	cmpw	%ax, -28(%rbp)
	je	.L7
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L8
.L7:
	movq	-8(%rbp), %rax
	movzwl	24(%rax), %eax
	cmpw	%ax, -28(%rbp)
	jne	.L9
	movq	-8(%rbp), %rax
	jmp	.L10
.L9:
	movl	$0, %eax
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z16getGraphicObjectP6Windows, .-_Z16getGraphicObjectP6Windows
	.globl	_Z10openWindowssss
	.type	_Z10openWindowssss, @function
_Z10openWindowssss:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%ecx, %eax
	movl	%edi, %ecx
	movw	%cx, -36(%rbp)
	movl	%esi, %ecx
	movw	%cx, -40(%rbp)
	movw	%dx, -44(%rbp)
	movw	%ax, -48(%rbp)
	movl	$40, %edi
	call	_Z6malloci
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L12
	movl	$0, %eax
	jmp	.L16
.L12:
	movq	-8(%rbp), %rax
	movzwl	-36(%rbp), %edx
	movw	%dx, 4(%rax)
	movq	-8(%rbp), %rax
	movzwl	-40(%rbp), %edx
	movw	%dx, 6(%rax)
	movq	-8(%rbp), %rax
	movzwl	-44(%rbp), %edx
	movw	%dx, (%rax)
	movq	-8(%rbp), %rax
	movzwl	-48(%rbp), %edx
	movw	%dx, 2(%rax)
	movq	-8(%rbp), %rax
	movb	$1, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	call	_Z13getLastWindowv
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	testq	%rax, %rax
	je	.L14
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L15
.L14:
	movq	-8(%rbp), %rax
	movq	%rax, windowListHead(%rip)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
.L15:
	movl	$32, %edi
	call	_Z6malloci
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movw	$0, 24(%rax)
	movq	-16(%rbp), %rax
	movw	$0, (%rax)
	movq	-16(%rbp), %rax
	movw	$0, 2(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movl	$10, %edi
	call	_Z6malloci
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzwl	-48(%rbp), %edx
	movw	%dx, 2(%rax)
	movq	-24(%rbp), %rax
	movzwl	-44(%rbp), %edx
	movw	%dx, (%rax)
	movq	-24(%rbp), %rax
	movzwl	borderColor(%rip), %edx
	movw	%dx, 4(%rax)
	movzbl	borderColor+2(%rip), %edx
	movb	%dl, 6(%rax)
	movq	-24(%rbp), %rax
	movzwl	fillColor(%rip), %edx
	movw	%dx, 7(%rax)
	movzbl	fillColor+2(%rip), %edx
	movb	%dl, 9(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movb	$1, 26(%rax)
	movq	-8(%rbp), %rax
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z10openWindowssss, .-_Z10openWindowssss
	.globl	_Z11closeWindowP6Window
	.type	_Z11closeWindowP6Window, @function
_Z11closeWindowP6Window:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
.L18:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L19
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
.L19:
	movq	windowListHead(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jne	.L20
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, windowListHead(%rip)
.L20:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z11closeWindowP6Window, .-_Z11closeWindowP6Window
	.globl	_Z7initGUIv
	.type	_Z7initGUIv, @function
_Z7initGUIv:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$0, windowListHead(%rip)
	movb	$0, borderColor(%rip)
	movb	$0, borderColor+1(%rip)
	movb	$-1, borderColor+2(%rip)
	movb	$0, fillColor(%rip)
	movb	$-1, fillColor+1(%rip)
	movb	$-1, fillColor+2(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z7initGUIv, .-_Z7initGUIv
	.section	.rodata
.LC0:
	.string	"Drawing Complete\n"
	.text
	.globl	_Z11drawWindowsv
	.type	_Z11drawWindowsv, @function
_Z11drawWindowsv:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	windowListHead(%rip), %rax
	movq	%rax, -8(%rbp)
.L27:
	cmpq	$0, -8(%rbp)
	je	.L23
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
.L26:
	cmpq	$0, -16(%rbp)
	je	.L24
	movq	-16(%rbp), %rax
	movzbl	26(%rax), %eax
	cmpb	$1, %al
	jne	.L25
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movzwl	6(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%edx, %eax
	movswl	%ax, %ecx
	movq	-8(%rbp), %rax
	movzwl	4(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%edx, %eax
	movswl	%ax, %edx
	movq	-8(%rbp), %rax
	movzwl	6(%rax), %eax
	movl	%eax, %esi
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%esi, %eax
	movswl	%ax, %esi
	movq	-8(%rbp), %rax
	movzwl	4(%rax), %eax
	movl	%eax, %edi
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%edi, %eax
	movswl	%ax, %edi
	movq	-24(%rbp), %rax
	movzwl	4(%rax), %r8d
	movzbl	6(%rax), %eax
	salq	$16, %rax
	orq	%r8, %rax
	movq	%rax, %r8
	call	_Z13drawRectanglessss5Color
	movq	-8(%rbp), %rax
	movzwl	6(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movswl	%ax, %ecx
	movq	-8(%rbp), %rax
	movzwl	4(%rax), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movswl	%ax, %edx
	movq	-8(%rbp), %rax
	movzwl	6(%rax), %eax
	movl	%eax, %esi
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	addl	%esi, %eax
	addl	$1, %eax
	movswl	%ax, %esi
	movq	-8(%rbp), %rax
	movzwl	4(%rax), %eax
	movl	%eax, %edi
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	addl	%edi, %eax
	addl	$1, %eax
	movswl	%ax, %edi
	movq	-24(%rbp), %rax
	movzbl	7(%rax), %r8d
	movzbl	8(%rax), %r9d
	salq	$8, %r9
	orq	%r9, %r8
	movzbl	9(%rax), %eax
	salq	$16, %rax
	orq	%r8, %rax
	movq	%rax, %r8
	call	_Z13fillRectanglessss5Color
.L25:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L26
.L24:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L27
.L23:
	movl	$.LC0, %edi
	call	_Z5printPKc
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z11drawWindowsv, .-_Z11drawWindowsv
	.globl	_Z16bringWindowFrontP6Window
	.type	_Z16bringWindowFrontP6Window, @function
_Z16bringWindowFrontP6Window:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	call	_Z13getLastWindowv
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L29
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
.L29:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L30
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
.L30:
	movq	windowListHead(%rip), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L31
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, windowListHead(%rip)
.L31:
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 16(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z16bringWindowFrontP6Window, .-_Z16bringWindowFrontP6Window
	.ident	"GCC: (GNU) 7.5.0"
