	.file	"GUI.cpp"
	.text
	.globl	windowListHead
	.section	.bss
	.align 4
	.type	windowListHead, @object
	.size	windowListHead, 4
windowListHead:
	.zero	4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	windowListHead, %eax
	testl	%eax, %eax
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	windowListHead, %eax
	movl	%eax, -4(%ebp)
	jmp	.L4
.L5:
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -4(%ebp)
.L4:
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L5
	movl	-4(%ebp), %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z13getLastWindowv, .-_Z13getLastWindowv
	.globl	_Z16getGraphicObjectP6Windows
	.type	_Z16getGraphicObjectP6Windows, @function
_Z16getGraphicObjectP6Windows:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	12(%ebp), %eax
	movw	%ax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	.L7
.L9:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -4(%ebp)
.L7:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	.L8
	movl	-4(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	%ax, -20(%ebp)
	jne	.L9
.L8:
	movl	-4(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	%ax, -20(%ebp)
	jne	.L10
	movl	-4(%ebp), %eax
	jmp	.L11
.L10:
	movl	$0, %eax
.L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z16getGraphicObjectP6Windows, .-_Z16getGraphicObjectP6Windows
	.globl	_Z10openWindowssss
	.type	_Z10openWindowssss, @function
_Z10openWindowssss:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%bx, -28(%ebp)
	movw	%cx, -32(%ebp)
	movw	%dx, -36(%ebp)
	movw	%ax, -40(%ebp)
	subl	$12, %esp
	pushl	$24
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L13
	movl	$0, %eax
	jmp	.L14
.L13:
	movl	-12(%ebp), %eax
	movzwl	-28(%ebp), %edx
	movw	%dx, 4(%eax)
	movl	-12(%ebp), %eax
	movzwl	-32(%ebp), %edx
	movw	%dx, 6(%eax)
	movl	-12(%ebp), %eax
	movzwl	-36(%ebp), %edx
	movw	%dx, (%eax)
	movl	-12(%ebp), %eax
	movzwl	-40(%ebp), %edx
	movw	%dx, 2(%eax)
	movl	-12(%ebp), %eax
	movb	$1, 20(%eax)
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	call	_Z13getLastWindowv
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	je	.L15
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 16(%eax)
	jmp	.L16
.L15:
	movl	-12(%ebp), %eax
	movl	%eax, windowListHead
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
.L16:
	subl	$12, %esp
	pushl	$16
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movw	$0, 12(%eax)
	movl	-20(%ebp), %eax
	movw	$0, (%eax)
	movl	-20(%ebp), %eax
	movw	$0, 2(%eax)
	movl	-20(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	subl	$12, %esp
	pushl	$10
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movzwl	-40(%ebp), %edx
	movw	%dx, 2(%eax)
	movl	-24(%ebp), %eax
	movzwl	-36(%ebp), %edx
	movw	%dx, (%eax)
	movl	-24(%ebp), %eax
	movzwl	borderColor, %edx
	movw	%dx, 4(%eax)
	movzbl	borderColor+2, %edx
	movb	%dl, 6(%eax)
	movl	-24(%ebp), %eax
	movzwl	fillColor, %edx
	movw	%dx, 7(%eax)
	movzbl	fillColor+2, %edx
	movb	%dl, 9(%eax)
	movl	-20(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-20(%ebp), %eax
	movb	$1, 14(%eax)
	movl	-12(%ebp), %eax
.L14:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z10openWindowssss, .-_Z10openWindowssss
	.globl	_Z11closeWindowP6Window
	.type	_Z11closeWindowP6Window, @function
_Z11closeWindowP6Window:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	.L18
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%ebp), %edx
	movl	16(%edx), %edx
	movl	%edx, 16(%eax)
.L18:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	.L19
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%ebp), %edx
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
.L19:
	movl	windowListHead, %eax
	cmpl	%eax, 8(%ebp)
	jne	.L20
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, windowListHead
.L20:
	subl	$12, %esp
	pushl	8(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z11closeWindowP6Window, .-_Z11closeWindowP6Window
	.globl	_Z7initGUIv
	.type	_Z7initGUIv, @function
_Z7initGUIv:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$0, windowListHead
	movb	$0, borderColor
	movb	$0, borderColor+1
	movb	$-1, borderColor+2
	movb	$0, fillColor
	movb	$-1, fillColor+1
	movb	$-1, fillColor+2
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	windowListHead, %eax
	movl	%eax, -28(%ebp)
	jmp	.L23
.L27:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -32(%ebp)
	jmp	.L24
.L26:
	movl	-32(%ebp), %eax
	movzbl	14(%eax), %eax
	cmpb	$1, %al
	jne	.L25
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	-28(%ebp), %eax
	movzwl	6(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%eax, %edx
	movl	-36(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%edx, %eax
	movswl	%ax, %edi
	movl	-28(%ebp), %eax
	movzwl	4(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%eax, %edx
	movl	-36(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%edx, %eax
	movswl	%ax, %esi
	movl	-28(%ebp), %eax
	movzwl	6(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%edx, %eax
	movswl	%ax, %ebx
	movl	-28(%ebp), %eax
	movzwl	4(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%edx, %eax
	cwtl
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	movl	-36(%ebp), %eax
	subl	$4, %esp
	movl	%esp, %edx
	movzwl	4(%eax), %ecx
	movw	%cx, (%edx)
	movzbl	6(%eax), %eax
	movb	%al, 2(%edx)
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	-44(%ebp)
	call	_Z13drawRectanglessss5Color
	addl	$32, %esp
	movl	-28(%ebp), %eax
	movzwl	6(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%eax, %edx
	movl	-36(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movswl	%ax, %edi
	movl	-28(%ebp), %eax
	movzwl	4(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%eax, %edx
	movl	-36(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movswl	%ax, %esi
	movl	-28(%ebp), %eax
	movzwl	6(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	2(%eax), %eax
	addl	%edx, %eax
	addl	$1, %eax
	movswl	%ax, %ebx
	movl	-28(%ebp), %eax
	movzwl	4(%eax), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movzwl	(%eax), %eax
	addl	%edx, %eax
	addl	$1, %eax
	cwtl
	movl	%eax, -44(%ebp)
	subl	$12, %esp
	movl	-36(%ebp), %eax
	subl	$4, %esp
	movl	%esp, %edx
	movzwl	7(%eax), %ecx
	movw	%cx, (%edx)
	movzbl	9(%eax), %eax
	movb	%al, 2(%edx)
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	-44(%ebp)
	call	_Z13fillRectanglessss5Color
	addl	$32, %esp
.L25:
	movl	-32(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -32(%ebp)
.L24:
	cmpl	$0, -32(%ebp)
	jne	.L26
	movl	-28(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -28(%ebp)
.L23:
	cmpl	$0, -28(%ebp)
	jne	.L27
	subl	$12, %esp
	pushl	$.LC0
	call	_Z5printPKc
	addl	$16, %esp
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z11drawWindowsv, .-_Z11drawWindowsv
	.globl	_Z16bringWindowFrontP6Window
	.type	_Z16bringWindowFrontP6Window, @function
_Z16bringWindowFrontP6Window:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	_Z13getLastWindowv
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	.L29
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%ebp), %edx
	movl	16(%edx), %edx
	movl	%edx, 16(%eax)
.L29:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	.L30
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%ebp), %edx
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
.L30:
	movl	windowListHead, %eax
	cmpl	%eax, 8(%ebp)
	jne	.L31
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, windowListHead
.L31:
	movl	-4(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	_Z16bringWindowFrontP6Window, .-_Z16bringWindowFrontP6Window
	.ident	"GCC: (GNU) 13.1.0"
