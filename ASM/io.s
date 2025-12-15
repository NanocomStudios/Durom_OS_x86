	.file	"io.cpp"
	.text
	.globl	_Z4outbth
	.type	_Z4outbth, @function
_Z4outbth:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -4(%ebp)
	movb	%al, -8(%ebp)
	movzbl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
/APP
/  4 "../IO/io.cpp" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4outbth, .-_Z4outbth
	.globl	_Z3inbt
	.type	_Z3inbt, @function
_Z3inbt:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
/APP
/  10 "../IO/io.cpp" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	movb	%al, -1(%ebp)
	movzbl	-1(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z3inbt, .-_Z3inbt
	.globl	_Z4outwtt
	.type	_Z4outwtt, @function
_Z4outwtt:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -4(%ebp)
	movw	%ax, -8(%ebp)
	movzwl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
/APP
/  18 "../IO/io.cpp" 1
	outw %ax, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z4outwtt, .-_Z4outwtt
	.globl	_Z3inwt
	.type	_Z3inwt, @function
_Z3inwt:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
/APP
/  23 "../IO/io.cpp" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	movw	%ax, -2(%ebp)
	movzwl	-2(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z3inwt, .-_Z3inwt
	.globl	_Z4outltj
	.type	_Z4outltj, @function
_Z4outltj:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	movzwl	-4(%ebp), %edx
	movl	12(%ebp), %eax
/APP
/  30 "../IO/io.cpp" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z4outltj, .-_Z4outltj
	.globl	_Z3inlt
	.type	_Z3inlt, @function
_Z3inlt:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
/APP
/  35 "../IO/io.cpp" 1
	inl %dx, %eax
/  0 "" 2
/NO_APP
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z3inlt, .-_Z3inlt
	.ident	"GCC: (GNU) 13.1.0"
