	.file	"ps2.cpp"
	.text
	.globl	_Z7ps2Waith
	.type	_Z7ps2Waith, @function
_Z7ps2Waith:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	movzbl	-12(%ebp), %eax
	cmpl	$1, %eax
	je	.L8
	cmpl	$2, %eax
	je	.L9
	jmp	.L7
.L8:
	nop
.L5:
	subl	$12, %esp
	pushl	$100
	call	_Z3inbt
	addl	$16, %esp
	andb	-12(%ebp), %al
	testb	%al, %al
	sete	%al
	testb	%al, %al
	jne	.L5
	jmp	.L4
.L9:
	nop
.L6:
	subl	$12, %esp
	pushl	$100
	call	_Z3inbt
	addl	$16, %esp
	andb	-12(%ebp), %al
	testb	%al, %al
	setne	%al
	testb	%al, %al
	jne	.L6
	nop
.L4:
.L7:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7ps2Waith, .-_Z7ps2Waith
	.globl	_Z8ps2Writeh
	.type	_Z8ps2Writeh, @function
_Z8ps2Writeh:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	subl	$12, %esp
	pushl	$2
	call	_Z7ps2Waith
	addl	$16, %esp
	subl	$8, %esp
	pushl	$212
	pushl	$100
	call	_Z4outbth
	addl	$16, %esp
	subl	$12, %esp
	pushl	$2
	call	_Z7ps2Waith
	addl	$16, %esp
	movzbl	-12(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$96
	call	_Z4outbth
	addl	$16, %esp
	nop
.L11:
	call	_Z7ps2Readv
	cmpb	$-6, %al
	setne	%al
	testb	%al, %al
	jne	.L11
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z8ps2Writeh, .-_Z8ps2Writeh
	.globl	_Z7ps2Readv
	.type	_Z7ps2Readv, @function
_Z7ps2Readv:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	$1
	call	_Z7ps2Waith
	addl	$16, %esp
	subl	$12, %esp
	pushl	$96
	call	_Z3inbt
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z7ps2Readv, .-_Z7ps2Readv
	.ident	"GCC: (GNU) 13.1.0"
