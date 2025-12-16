	.file	"ps2.cpp"
	.text
	.globl	_Z7ps2Waith
	.type	_Z7ps2Waith, @function
_Z7ps2Waith:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	-4(%rbp), %eax
	cmpl	$1, %eax
	je	.L3
	cmpl	$2, %eax
	je	.L4
	jmp	.L9
.L3:
	movl	$100, %edi
	call	_Z3inbt
	andb	-4(%rbp), %al
	testb	%al, %al
	sete	%al
	testb	%al, %al
	je	.L7
	jmp	.L3
.L4:
	movl	$100, %edi
	call	_Z3inbt
	andb	-4(%rbp), %al
	testb	%al, %al
	setne	%al
	testb	%al, %al
	je	.L8
	jmp	.L4
.L7:
	nop
	jmp	.L9
.L8:
	nop
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7ps2Waith, .-_Z7ps2Waith
	.globl	_Z8ps2Writeh
	.type	_Z8ps2Writeh, @function
_Z8ps2Writeh:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movl	$2, %edi
	call	_Z7ps2Waith
	movl	$212, %esi
	movl	$100, %edi
	call	_Z4outbth
	movl	$2, %edi
	call	_Z7ps2Waith
	movzbl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$96, %edi
	call	_Z4outbth
.L12:
	call	_Z7ps2Readv
	cmpb	$-6, %al
	setne	%al
	testb	%al, %al
	je	.L13
	jmp	.L12
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z8ps2Writeh, .-_Z8ps2Writeh
	.globl	_Z7ps2Readv
	.type	_Z7ps2Readv, @function
_Z7ps2Readv:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, %edi
	call	_Z7ps2Waith
	movl	$96, %edi
	call	_Z3inbt
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z7ps2Readv, .-_Z7ps2Readv
	.ident	"GCC: (GNU) 7.5.0"
