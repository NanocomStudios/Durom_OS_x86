	.file	"hdd.cpp"
	.text
	.globl	currentHddPort
	.section	.bss
	.align 2
	.type	currentHddPort, @object
	.size	currentHddPort, 2
currentHddPort:
	.zero	2
	.globl	masterSlaveState
	.type	masterSlaveState, @object
	.size	masterSlaveState, 1
masterSlaveState:
	.zero	1
	.globl	lbaMode
	.type	lbaMode, @object
	.size	lbaMode, 1
lbaMode:
	.zero	1
	.globl	hddEntryList
	.align 4
	.type	hddEntryList, @object
	.size	hddEntryList, 4
hddEntryList:
	.zero	4
	.globl	hddCount
	.align 2
	.type	hddCount, @object
	.size	hddCount, 2
hddCount:
	.zero	2
	.text
	.globl	_Z15getHddEntryListv
	.type	_Z15getHddEntryListv, @function
_Z15getHddEntryListv:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	hddEntryList, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_Z15getHddEntryListv, .-_Z15getHddEntryListv
	.globl	_Z11getHddCountv
	.type	_Z11getHddCountv, @function
_Z11getHddCountv:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movzwl	hddCount, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_Z11getHddCountv, .-_Z11getHddCountv
	.globl	_Z7hddWaitv
	.type	_Z7hddWaitv, @function
_Z7hddWaitv:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	nop
.L6:
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	shrb	$7, %al
	testb	%al, %al
	jne	.L6
	nop
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_Z7hddWaitv, .-_Z7hddWaitv
	.globl	_Z7isReadyv
	.type	_Z7isReadyv, @function
_Z7isReadyv:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	andl	$64, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_Z7isReadyv, .-_Z7isReadyv
	.globl	_Z7isErrorv
	.type	_Z7isErrorv, @function
_Z7isErrorv:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	andl	$1, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_Z7isErrorv, .-_Z7isErrorv
	.globl	_Z8setDrivescc
	.type	_Z8setDrivescc, @function
_Z8setDrivescc:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movw	%cx, -28(%ebp)
	movb	%dl, -32(%ebp)
	movb	%al, -36(%ebp)
	movzwl	currentHddPort, %eax
	cmpw	%ax, -28(%ebp)
	jne	.L12
	movzbl	masterSlaveState, %eax
	movzbl	%al, %edx
	movsbl	-32(%ebp), %eax
	cmpl	%eax, %edx
	je	.L16
.L12:
	movzwl	-28(%ebp), %eax
	movw	%ax, currentHddPort
	movzbl	-32(%ebp), %eax
	movb	%al, masterSlaveState
	movb	$1, lbaMode
	movb	$-96, -11(%ebp)
	movzbl	masterSlaveState, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-11(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -11(%ebp)
	movzbl	lbaMode, %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-11(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -11(%ebp)
	movzbl	-11(%ebp), %edx
	movzwl	currentHddPort, %eax
	addl	$6, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	movw	$0, -10(%ebp)
	jmp	.L14
.L15:
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L14:
	cmpw	$15, -10(%ebp)
	jle	.L15
	jmp	.L11
.L16:
	nop
.L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_Z8setDrivescc, .-_Z8setDrivescc
	.globl	_Z12getDriveInfoPv
	.type	_Z12getDriveInfoPv, @function
_Z12getDriveInfoPv:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	$236
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	call	_Z7hddWaitv
	call	_Z15readDriveStatusv
	movzbl	%al, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L18
	movl	$0, %eax
	jmp	.L19
.L18:
	movw	$0, -10(%ebp)
	jmp	.L20
.L23:
	movzwl	currentHddPort, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inwt
	addl	$16, %esp
	movw	%ax, -12(%ebp)
	movzwl	-12(%ebp), %eax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movb	%dl, (%eax)
	addl	$1, 8(%ebp)
	movzwl	-12(%ebp), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movb	%dl, (%eax)
	addl	$1, 8(%ebp)
	movzwl	-10(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -10(%ebp)
.L20:
	movswl	-10(%ebp), %eax
	cmpl	$97, %eax
	ja	.L21
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L21
	movl	$1, %eax
	jmp	.L22
.L21:
	movl	$0, %eax
.L22:
	testb	%al, %al
	jne	.L23
	jmp	.L24
.L25:
	movzwl	currentHddPort, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inwt
	addl	$16, %esp
.L24:
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	jne	.L25
	movl	$1, %eax
.L19:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	_Z12getDriveInfoPv, .-_Z12getDriveInfoPv
	.globl	_Z15setDriveAddressj
	.type	_Z15setDriveAddressj, @function
_Z15setDriveAddressj:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	movzbl	%al, %edx
	movzwl	currentHddPort, %eax
	addl	$3, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	movl	8(%ebp), %eax
	shrl	$8, %eax
	movzbl	%al, %edx
	movzwl	currentHddPort, %eax
	addl	$4, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	movl	8(%ebp), %eax
	shrl	$16, %eax
	movzbl	%al, %edx
	movzwl	currentHddPort, %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	_Z15setDriveAddressj, .-_Z15setDriveAddressj
	.globl	_Z14setSectorCounth
	.type	_Z14setSectorCounth, @function
_Z14setSectorCounth:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	movzbl	-12(%ebp), %edx
	movzwl	currentHddPort, %eax
	addl	$2, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	_Z14setSectorCounth, .-_Z14setSectorCounth
	.globl	_Z12writeCommandh
	.type	_Z12writeCommandh, @function
_Z12writeCommandh:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	movzbl	-12(%ebp), %edx
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	_Z12writeCommandh, .-_Z12writeCommandh
	.globl	_Z15readDriveStatusv
	.type	_Z15readDriveStatusv, @function
_Z15readDriveStatusv:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	_Z15readDriveStatusv, .-_Z15readDriveStatusv
	.globl	_Z11readSectorsPvhj
	.type	_Z11readSectorsPvhj, @function
_Z11readSectorsPvhj:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	jmp	.L32
.L33:
	movzwl	currentHddPort, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inwt
	addl	$16, %esp
.L32:
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	jne	.L33
	call	_Z7hddWaitv
	movzbl	-28(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z14setSectorCounth
	addl	$16, %esp
	subl	$12, %esp
	pushl	16(%ebp)
	call	_Z15setDriveAddressj
	addl	$16, %esp
	movb	$-96, -13(%ebp)
	movzbl	masterSlaveState, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-13(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -13(%ebp)
	movzbl	lbaMode, %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-13(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -13(%ebp)
	movl	16(%ebp), %eax
	shrl	$24, %eax
	andl	$15, %eax
	orb	%al, -13(%ebp)
	movzbl	-13(%ebp), %edx
	movzwl	currentHddPort, %eax
	addl	$6, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$8, %esp
	pushl	$32
	pushl	%eax
	call	_Z4outbth
	addl	$16, %esp
	call	_Z7hddWaitv
	movl	$0, -12(%ebp)
	jmp	.L34
.L37:
	movzwl	currentHddPort, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inwt
	addl	$16, %esp
	movw	%ax, -16(%ebp)
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzwl	-16(%ebp), %eax
	movw	%ax, (%edx)
	addl	$1, -12(%ebp)
.L34:
	movzbl	-28(%ebp), %eax
	sall	$8, %eax
	cmpl	%eax, -12(%ebp)
	jge	.L35
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L35
	movl	$1, %eax
	jmp	.L36
.L35:
	movl	$0, %eax
.L36:
	testb	%al, %al
	jne	.L37
	jmp	.L38
.L39:
	movzwl	currentHddPort, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inwt
	addl	$16, %esp
.L38:
	movzwl	currentHddPort, %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z3inbt
	addl	$16, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	jne	.L39
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	_Z11readSectorsPvhj, .-_Z11readSectorsPvhj
	.globl	_Z7hddInitv
	.type	_Z7hddInitv, @function
_Z7hddInitv:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	subl	$12, %esp
	pushl	$1
	call	_Z16getClassCategoryh
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	subl	$12, %esp
	pushl	$1
	call	_Z13getClassCounth
	addl	$16, %esp
	movw	%ax, -22(%ebp)
	movzwl	-22(%ebp), %eax
	sall	$2, %eax
	movw	%ax, hddCount
	movzwl	hddCount, %eax
	cwtl
	sall	$2, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, hddEntryList
	movl	$0, -12(%ebp)
	jmp	.L42
.L45:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	andl	$5, %eax
	testl	%eax, %eax
	jne	.L43
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	%edx, %eax
	movw	$496, 2(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	%edx, %eax
	movb	$0, 1(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$4, %edx
	addl	%edx, %eax
	movw	$496, 2(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$4, %edx
	addl	%edx, %eax
	movb	$1, 1(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$8, %edx
	addl	%edx, %eax
	movw	$368, 2(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$8, %edx
	addl	%edx, %eax
	movb	$0, 1(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$12, %edx
	addl	%edx, %eax
	movw	$368, 2(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$12, %edx
	addl	%edx, %eax
	movb	$1, 1(%eax)
	jmp	.L44
.L43:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	2(%eax), %eax
	movzbl	%al, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	pushl	$16
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	2(%eax), %eax
	movzbl	%al, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	pushl	$16
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movl	hddEntryList, %edx
	movl	-12(%ebp), %ecx
	sall	$4, %ecx
	addl	%ecx, %edx
	andl	$-4, %eax
	movw	%ax, 2(%edx)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	%edx, %eax
	movb	$0, 1(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	%edx, %eax
	movl	hddEntryList, %edx
	movl	-12(%ebp), %ecx
	sall	$4, %ecx
	addl	$4, %ecx
	addl	%ecx, %edx
	movzwl	2(%eax), %eax
	movw	%ax, 2(%edx)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$4, %edx
	addl	%edx, %eax
	movb	$1, 1(%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	2(%eax), %eax
	movzbl	%al, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	pushl	$24
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movzwl	%ax, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z8printHexl
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	2(%eax), %eax
	movzbl	%al, %ebx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	pushl	$24
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	call	_Z17pciConfigReadWordhhhh
	addl	$16, %esp
	movl	hddEntryList, %edx
	movl	-12(%ebp), %ecx
	sall	$4, %ecx
	addl	$8, %ecx
	addl	%ecx, %edx
	andl	$-4, %eax
	movw	%ax, 2(%edx)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$8, %edx
	addl	%edx, %eax
	movb	$0, 1(%eax)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$8, %edx
	addl	%edx, %eax
	movl	hddEntryList, %edx
	movl	-12(%ebp), %ecx
	sall	$4, %ecx
	addl	$12, %ecx
	addl	%ecx, %edx
	movzwl	2(%eax), %eax
	movw	%ax, 2(%edx)
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$4, %edx
	addl	$12, %edx
	addl	%edx, %eax
	movb	$1, 1(%eax)
.L44:
	addl	$1, -12(%ebp)
.L42:
	movswl	-22(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jl	.L45
	movl	$0, -16(%ebp)
	jmp	.L46
.L50:
	movl	hddEntryList, %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	hddEntryList, %eax
	movl	-16(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movzwl	2(%eax), %eax
	cwtl
	subl	$4, %esp
	pushl	$1
	pushl	%edx
	pushl	%eax
	call	_Z8setDrivescc
	addl	$16, %esp
	subl	$12, %esp
	pushl	$0
	call	_Z14setSectorCounth
	addl	$16, %esp
	subl	$12, %esp
	pushl	$0
	call	_Z15setDriveAddressj
	addl	$16, %esp
	subl	$12, %esp
	pushl	$236
	call	_Z12writeCommandh
	addl	$16, %esp
	call	_Z15readDriveStatusv
	movb	%al, -23(%ebp)
	cmpb	$0, -23(%ebp)
	je	.L47
	movzbl	-23(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L47
	movzbl	-23(%ebp), %eax
	andl	$32, %eax
	testl	%eax, %eax
	je	.L48
.L47:
	movl	hddEntryList, %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movb	$0, (%eax)
	jmp	.L49
.L48:
	movl	hddEntryList, %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movb	$1, (%eax)
.L49:
	addl	$1, -16(%ebp)
.L46:
	movzwl	hddCount, %eax
	cwtl
	cmpl	%eax, -16(%ebp)
	jl	.L50
	nop
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	_Z7hddInitv, .-_Z7hddInitv
	.section	.rodata
.LC0:
	.string	"Done.\n"
	.text
	.globl	_Z7listHddv
	.type	_Z7listHddv, @function
_Z7listHddv:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	subl	$12, %esp
	pushl	$98
	call	_Z6malloci
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L52
.L56:
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	.L53
	movl	hddEntryList, %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	hddEntryList, %eax
	movl	-12(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movzwl	2(%eax), %eax
	cwtl
	subl	$4, %esp
	pushl	$1
	pushl	%edx
	pushl	%eax
	call	_Z8setDrivescc
	addl	$16, %esp
	call	_Z7hddWaitv
	subl	$12, %esp
	pushl	-16(%ebp)
	call	_Z12getDriveInfoPv
	addl	$16, %esp
	testb	%al, %al
	sete	%al
	testb	%al, %al
	jne	.L57
	movl	-16(%ebp), %eax
	addl	$52, %eax
	subl	$12, %esp
	pushl	%eax
	call	_Z5printPKc
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	_Z5printc
	addl	$16, %esp
.L53:
	addl	$1, -12(%ebp)
.L52:
	movzwl	hddCount, %eax
	cwtl
	cmpl	%eax, -12(%ebp)
	jl	.L56
	jmp	.L55
.L57:
	nop
.L55:
	subl	$12, %esp
	pushl	$.LC0
	call	_Z5printPKc
	addl	$16, %esp
	subl	$12, %esp
	pushl	-16(%ebp)
	call	_Z4freePv
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	_Z7listHddv, .-_Z7listHddv
	.ident	"GCC: (GNU) 13.1.0"
