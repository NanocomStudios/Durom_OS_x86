	.file	"keyboard.cpp"
	.text
	.globl	keyFlags
	.section	.bss
	.type	keyFlags, @object
	.size	keyFlags, 1
keyFlags:
	.zero	1
	.section	.rodata
	.align 32
	.type	_ZL4kbdl, @object
	.size	_ZL4kbdl, 128
_ZL4kbdl:
	.byte	0
	.byte	27
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	48
	.byte	45
	.byte	61
	.byte	8
	.byte	9
	.byte	113
	.byte	119
	.byte	101
	.byte	114
	.byte	116
	.byte	121
	.byte	117
	.byte	105
	.byte	111
	.byte	112
	.byte	91
	.byte	93
	.byte	10
	.byte	0
	.byte	97
	.byte	115
	.byte	100
	.byte	102
	.byte	103
	.byte	104
	.byte	106
	.byte	107
	.byte	108
	.byte	59
	.byte	39
	.byte	96
	.byte	0
	.byte	92
	.byte	122
	.byte	120
	.byte	99
	.byte	118
	.byte	98
	.byte	110
	.byte	109
	.byte	44
	.byte	46
	.byte	47
	.byte	0
	.byte	42
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	38
	.align 32
	.type	_ZL8kbdShift, @object
	.size	_ZL8kbdShift, 128
_ZL8kbdShift:
	.byte	0
	.byte	27
	.byte	33
	.byte	64
	.byte	35
	.byte	36
	.byte	37
	.byte	94
	.byte	38
	.byte	42
	.byte	40
	.byte	41
	.byte	95
	.byte	43
	.byte	8
	.byte	9
	.byte	81
	.byte	87
	.byte	69
	.byte	82
	.byte	84
	.byte	89
	.byte	85
	.byte	73
	.byte	79
	.byte	80
	.byte	123
	.byte	125
	.byte	10
	.byte	0
	.byte	65
	.byte	83
	.byte	68
	.byte	70
	.byte	71
	.byte	72
	.byte	74
	.byte	75
	.byte	76
	.byte	58
	.byte	34
	.byte	126
	.byte	0
	.byte	124
	.byte	90
	.byte	88
	.byte	67
	.byte	86
	.byte	66
	.byte	78
	.byte	77
	.byte	60
	.byte	62
	.byte	63
	.byte	0
	.byte	42
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	38
	.align 32
	.type	_ZL6kbdCap, @object
	.size	_ZL6kbdCap, 128
_ZL6kbdCap:
	.byte	0
	.byte	27
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	48
	.byte	45
	.byte	61
	.byte	8
	.byte	9
	.byte	81
	.byte	87
	.byte	69
	.byte	82
	.byte	84
	.byte	89
	.byte	85
	.byte	73
	.byte	79
	.byte	80
	.byte	91
	.byte	93
	.byte	10
	.byte	0
	.byte	65
	.byte	83
	.byte	68
	.byte	70
	.byte	71
	.byte	72
	.byte	74
	.byte	75
	.byte	76
	.byte	59
	.byte	39
	.byte	96
	.byte	0
	.byte	92
	.byte	90
	.byte	88
	.byte	67
	.byte	86
	.byte	66
	.byte	78
	.byte	77
	.byte	44
	.byte	46
	.byte	47
	.byte	0
	.byte	42
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	38
	.text
	.globl	_Z7toAsciic
	.type	_Z7toAsciic, @function
_Z7toAsciic:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	keyFlags(%rip), %eax
	testb	%al, %al
	jne	.L2
	movsbl	-4(%rbp), %eax
	cltq
	movzbl	_ZL4kbdl(%rax), %eax
	jmp	.L3
.L2:
	movzbl	keyFlags(%rip), %eax
	cmpb	$1, %al
	jne	.L4
	movsbl	-4(%rbp), %eax
	cltq
	movzbl	_ZL8kbdShift(%rax), %eax
	jmp	.L3
.L4:
	movzbl	keyFlags(%rip), %eax
	cmpb	$2, %al
	jne	.L5
	movsbl	-4(%rbp), %eax
	cltq
	movzbl	_ZL6kbdCap(%rax), %eax
	jmp	.L3
.L5:
	movzbl	keyFlags(%rip), %eax
	cmpb	$3, %al
	jne	.L6
	movsbl	-4(%rbp), %eax
	cltq
	movzbl	_ZL4kbdl(%rax), %eax
	jmp	.L3
.L6:
	movsbl	-4(%rbp), %eax
	cltq
	movzbl	_ZL4kbdl(%rax), %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z7toAsciic, .-_Z7toAsciic
	.local	_ZZ7getCharvE7lastKey
	.comm	_ZZ7getCharvE7lastKey,1,1
	.local	_ZZ7getCharvE3key
	.comm	_ZZ7getCharvE3key,1,1
	.globl	_Z7getCharv
	.type	_Z7getCharv, @function
_Z7getCharv:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.L21:
	call	_Z7ps2Readv
	movb	%al, _ZZ7getCharvE3key(%rip)
	movzbl	_ZZ7getCharvE3key(%rip), %eax
	testb	%al, %al
	js	.L8
	movzbl	_ZZ7getCharvE3key(%rip), %eax
	movzbl	%al, %eax
	cmpl	$54, %eax
	je	.L10
	cmpl	$58, %eax
	je	.L11
	cmpl	$42, %eax
	je	.L12
	jmp	.L22
.L11:
	movzbl	keyFlags(%rip), %eax
	movzbl	%al, %eax
	andl	$2, %eax
	testl	%eax, %eax
	jne	.L13
	movzbl	keyFlags(%rip), %eax
	orl	$2, %eax
	movb	%al, keyFlags(%rip)
	jmp	.L17
.L13:
	movzbl	keyFlags(%rip), %eax
	andl	$-3, %eax
	movb	%al, keyFlags(%rip)
	jmp	.L17
.L12:
	movzbl	keyFlags(%rip), %eax
	orl	$1, %eax
	movb	%al, keyFlags(%rip)
	jmp	.L17
.L10:
	movzbl	keyFlags(%rip), %eax
	orl	$1, %eax
	movb	%al, keyFlags(%rip)
	jmp	.L17
.L22:
	movzbl	_ZZ7getCharvE3key(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	_Z7toAsciic
	jmp	.L23
.L8:
	movzbl	_ZZ7getCharvE3key(%rip), %eax
	testb	%al, %al
	jns	.L21
	movzbl	_ZZ7getCharvE3key(%rip), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	cmpl	$42, %eax
	je	.L19
	cmpl	$54, %eax
	je	.L20
	jmp	.L18
.L19:
	movzbl	keyFlags(%rip), %eax
	andl	$-2, %eax
	movb	%al, keyFlags(%rip)
	jmp	.L18
.L20:
	movzbl	keyFlags(%rip), %eax
	andl	$-2, %eax
	movb	%al, keyFlags(%rip)
	nop
.L18:
	movb	$0, _ZZ7getCharvE7lastKey(%rip)
.L17:
	jmp	.L21
.L23:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z7getCharv, .-_Z7getCharv
	.ident	"GCC: (GNU) 7.5.0"
