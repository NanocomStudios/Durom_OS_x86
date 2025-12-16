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
	.string	""
	.string	"\0331234567890-=\b\tqwertyuiop[]\n"
	.string	"asdfghjkl;'`"
	.string	"\\zxcvbnm,./"
	.string	"*"
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"-"
	.string	""
	.string	""
	.string	"+"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	37
	.align 32
	.type	_ZL8kbdShift, @object
	.size	_ZL8kbdShift, 128
_ZL8kbdShift:
	.string	""
	.string	"\033!@#$%^&*()_+\b\tQWERTYUIOP{}\n"
	.string	"ASDFGHJKL:\"~"
	.string	"|ZXCVBNM<>?"
	.string	"*"
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"-"
	.string	""
	.string	""
	.string	"+"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	37
	.align 32
	.type	_ZL6kbdCap, @object
	.size	_ZL6kbdCap, 128
_ZL6kbdCap:
	.string	""
	.string	"\0331234567890-=\b\tQWERTYUIOP[]\n"
	.string	"ASDFGHJKL;'`"
	.string	"\\ZXCVBNM,./"
	.string	"*"
	.string	" "
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"-"
	.string	""
	.string	""
	.string	"+"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	37
	.text
	.globl	_Z7toAsciic
	.type	_Z7toAsciic, @function
_Z7toAsciic:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movzbl	keyFlags, %eax
	testb	%al, %al
	jne	.L2
	movsbl	-4(%ebp), %eax
	movzbl	_ZL4kbdl(%eax), %eax
	jmp	.L3
.L2:
	movzbl	keyFlags, %eax
	cmpb	$1, %al
	jne	.L4
	movsbl	-4(%ebp), %eax
	movzbl	_ZL8kbdShift(%eax), %eax
	jmp	.L3
.L4:
	movzbl	keyFlags, %eax
	cmpb	$2, %al
	jne	.L5
	movsbl	-4(%ebp), %eax
	movzbl	_ZL6kbdCap(%eax), %eax
	jmp	.L3
.L5:
	movzbl	keyFlags, %eax
	cmpb	$3, %al
	jne	.L6
	movsbl	-4(%ebp), %eax
	movzbl	_ZL4kbdl(%eax), %eax
	jmp	.L3
.L6:
	movsbl	-4(%ebp), %eax
	movzbl	_ZL4kbdl(%eax), %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
.L21:
	call	_Z7ps2Readv
	movb	%al, _ZZ7getCharvE3key
	movzbl	_ZZ7getCharvE3key, %eax
	testb	%al, %al
	js	.L8
	movzbl	_ZZ7getCharvE3key, %eax
	movzbl	%al, %eax
	cmpl	$58, %eax
	je	.L9
	cmpl	$58, %eax
	jg	.L10
	cmpl	$42, %eax
	je	.L11
	cmpl	$54, %eax
	je	.L12
	jmp	.L10
.L9:
	movzbl	keyFlags, %eax
	movzbl	%al, %eax
	andl	$2, %eax
	testl	%eax, %eax
	jne	.L13
	movzbl	keyFlags, %eax
	orl	$2, %eax
	movb	%al, keyFlags
	jmp	.L17
.L13:
	movzbl	keyFlags, %eax
	andl	$-3, %eax
	movb	%al, keyFlags
	jmp	.L17
.L11:
	movzbl	keyFlags, %eax
	orl	$1, %eax
	movb	%al, keyFlags
	jmp	.L17
.L12:
	movzbl	keyFlags, %eax
	orl	$1, %eax
	movb	%al, keyFlags
	jmp	.L17
.L10:
	movzbl	_ZZ7getCharvE3key, %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z7toAsciic
	addl	$16, %esp
	jmp	.L22
.L8:
	movzbl	_ZZ7getCharvE3key, %eax
	testb	%al, %al
	jns	.L21
	movzbl	_ZZ7getCharvE3key, %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	cmpl	$42, %eax
	je	.L18
	cmpl	$54, %eax
	je	.L19
	jmp	.L20
.L18:
	movzbl	keyFlags, %eax
	andl	$-2, %eax
	movb	%al, keyFlags
	jmp	.L20
.L19:
	movzbl	keyFlags, %eax
	andl	$-2, %eax
	movb	%al, keyFlags
	nop
.L20:
	movb	$0, _ZZ7getCharvE7lastKey
.L17:
	jmp	.L21
.L22:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z7getCharv, .-_Z7getCharv
	.ident	"GCC: (GNU) 13.1.0"
