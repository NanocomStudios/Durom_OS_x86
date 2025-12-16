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
	.align 8
	.type	hddEntryList, @object
	.size	hddEntryList, 8
hddEntryList:
	.zero	8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	hddEntryList(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z15getHddEntryListv, .-_Z15getHddEntryListv
	.globl	_Z11getHddCountv
	.type	_Z11getHddCountv, @function
_Z11getHddCountv:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzwl	hddCount(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z11getHddCountv, .-_Z11getHddCountv
	.globl	_Z7hddWaitv
	.type	_Z7hddWaitv, @function
_Z7hddWaitv:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.L7:
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	shrb	$7, %al
	testb	%al, %al
	je	.L8
	jmp	.L7
.L8:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z7hddWaitv, .-_Z7hddWaitv
	.globl	_Z7isReadyv
	.type	_Z7isReadyv, @function
_Z7isReadyv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	andl	$64, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z7isReadyv, .-_Z7isReadyv
	.globl	_Z7isErrorv
	.type	_Z7isErrorv, @function
_Z7isErrorv:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z7isErrorv, .-_Z7isErrorv
	.globl	_Z8setDrivescc
	.type	_Z8setDrivescc, @function
_Z8setDrivescc:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%edi, %edx
	movw	%dx, -20(%rbp)
	movl	%ecx, %edx
	movb	%dl, -24(%rbp)
	movb	%al, -28(%rbp)
	movzwl	currentHddPort(%rip), %eax
	cmpw	%ax, -20(%rbp)
	jne	.L14
	movzbl	masterSlaveState(%rip), %eax
	movzbl	%al, %edx
	movsbl	-24(%rbp), %eax
	cmpl	%eax, %edx
	je	.L17
.L14:
	movzwl	-20(%rbp), %eax
	movw	%ax, currentHddPort(%rip)
	movzbl	-24(%rbp), %eax
	movb	%al, masterSlaveState(%rip)
	movb	$1, lbaMode(%rip)
	movb	$-96, -3(%rbp)
	movzbl	masterSlaveState(%rip), %eax
	movzbl	%al, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-3(%rbp), %eax
	orl	%edx, %eax
	movb	%al, -3(%rbp)
	movzbl	lbaMode(%rip), %eax
	movzbl	%al, %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-3(%rbp), %eax
	orl	%edx, %eax
	movb	%al, -3(%rbp)
	movzbl	-3(%rbp), %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$6, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	movw	$0, -2(%rbp)
.L16:
	cmpw	$15, -2(%rbp)
	jg	.L13
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	jmp	.L16
.L17:
	nop
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z8setDrivescc, .-_Z8setDrivescc
	.globl	_Z12getDriveInfoPv
	.type	_Z12getDriveInfoPv, @function
_Z12getDriveInfoPv:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	$236, %esi
	movl	%eax, %edi
	call	_Z4outbth
	call	_Z7hddWaitv
	call	_Z15readDriveStatusv
	movzbl	%al, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L19
	movl	$0, %eax
	jmp	.L20
.L19:
	movw	$0, -2(%rbp)
.L24:
	movswq	-2(%rbp), %rax
	cmpq	$97, %rax
	ja	.L21
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
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
	je	.L23
	movzwl	currentHddPort(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inwt
	movw	%ax, -4(%rbp)
	movzwl	-4(%rbp), %eax
	sarl	$8, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -24(%rbp)
	movzwl	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -24(%rbp)
	movzwl	-2(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -2(%rbp)
	jmp	.L24
.L23:
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L25
	movzwl	currentHddPort(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inwt
	jmp	.L23
.L25:
	movl	$1, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z12getDriveInfoPv, .-_Z12getDriveInfoPv
	.globl	_Z15setDriveAddressj
	.type	_Z15setDriveAddressj, @function
_Z15setDriveAddressj:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movzbl	%al, %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$3, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	movl	-4(%rbp), %eax
	shrl	$8, %eax
	movzbl	%al, %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$4, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	movl	-4(%rbp), %eax
	shrl	$16, %eax
	movzbl	%al, %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$5, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_Z15setDriveAddressj, .-_Z15setDriveAddressj
	.globl	_Z14setSectorCounth
	.type	_Z14setSectorCounth, @function
_Z14setSectorCounth:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	-4(%rbp), %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$2, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_Z14setSectorCounth, .-_Z14setSectorCounth
	.globl	_Z12writeCommandh
	.type	_Z12writeCommandh, @function
_Z12writeCommandh:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	-4(%rbp), %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	_Z12writeCommandh, .-_Z12writeCommandh
	.globl	_Z15readDriveStatusv
	.type	_Z15readDriveStatusv, @function
_Z15readDriveStatusv:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_Z15readDriveStatusv, .-_Z15readDriveStatusv
	.globl	_Z11readSectorsPvhj
	.type	_Z11readSectorsPvhj, @function
_Z11readSectorsPvhj:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, %eax
	movl	%edx, -32(%rbp)
	movb	%al, -28(%rbp)
.L33:
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L32
	movzwl	currentHddPort(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inwt
	jmp	.L33
.L32:
	call	_Z7hddWaitv
	movzbl	-28(%rbp), %eax
	movl	%eax, %edi
	call	_Z14setSectorCounth
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	_Z15setDriveAddressj
	movb	$-96, -5(%rbp)
	movzbl	masterSlaveState(%rip), %eax
	movzbl	%al, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movzbl	-5(%rbp), %eax
	orl	%edx, %eax
	movb	%al, -5(%rbp)
	movzbl	lbaMode(%rip), %eax
	movzbl	%al, %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-5(%rbp), %eax
	orl	%edx, %eax
	movb	%al, -5(%rbp)
	movl	-32(%rbp), %eax
	shrl	$24, %eax
	andl	$15, %eax
	orb	%al, -5(%rbp)
	movzbl	-5(%rbp), %edx
	movzwl	currentHddPort(%rip), %eax
	addl	$6, %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z4outbth
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	$32, %esi
	movl	%eax, %edi
	call	_Z4outbth
	call	_Z7hddWaitv
	movl	$0, -4(%rbp)
.L37:
	movzbl	-28(%rbp), %eax
	sall	$8, %eax
	cmpl	%eax, -4(%rbp)
	jge	.L34
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L34
	movl	$1, %eax
	jmp	.L35
.L34:
	movl	$0, %eax
.L35:
	testb	%al, %al
	je	.L36
	movzwl	currentHddPort(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inwt
	movw	%ax, -8(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzwl	-8(%rbp), %eax
	movw	%ax, (%rdx)
	addl	$1, -4(%rbp)
	jmp	.L37
.L36:
	movzwl	currentHddPort(%rip), %eax
	addl	$7, %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inbt
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L38
	movzwl	currentHddPort(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	_Z3inwt
	jmp	.L36
.L38:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	_Z11readSectorsPvhj, .-_Z11readSectorsPvhj
	.globl	_Z7hddInitv
	.type	_Z7hddInitv, @function
_Z7hddInitv:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1, %edi
	call	_Z16getClassCategoryh
	movq	%rax, -16(%rbp)
	movl	$1, %edi
	call	_Z13getClassCounth
	movw	%ax, -18(%rbp)
	movzwl	-18(%rbp), %eax
	sall	$2, %eax
	movw	%ax, hddCount(%rip)
	movzwl	hddCount(%rip), %eax
	movswq	%ax, %rax
	sall	$2, %eax
	movl	%eax, %edi
	call	_Z6malloci
	movq	%rax, hddEntryList(%rip)
	movl	$0, -4(%rbp)
.L44:
	movswl	-18(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L41
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	5(%rax), %eax
	movzbl	%al, %eax
	andl	$5, %eax
	testl	%eax, %eax
	jne	.L42
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movw	$496, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movb	$0, 1(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$4, %rdx
	addq	%rdx, %rax
	movw	$496, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$4, %rdx
	addq	%rdx, %rax
	movb	$1, 1(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$8, %rdx
	addq	%rdx, %rax
	movw	$368, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$8, %rdx
	addq	%rdx, %rax
	movb	$0, 1(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$12, %rdx
	addq	%rdx, %rax
	movw	$368, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$12, %rdx
	addq	%rdx, %rax
	movb	$1, 1(%rax)
	jmp	.L43
.L42:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	2(%rax), %eax
	movzbl	%al, %edi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movzbl	%al, %esi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$16, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$10, %edi
	call	_Z5printc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	2(%rax), %eax
	movzbl	%al, %edi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movzbl	%al, %esi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$16, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movl	%eax, %ecx
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	andl	$-4, %ecx
	movl	%ecx, %edx
	movw	%dx, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movb	$0, 1(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	hddEntryList(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	$4, %rcx
	addq	%rcx, %rdx
	movzwl	2(%rax), %eax
	movw	%ax, 2(%rdx)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$4, %rdx
	addq	%rdx, %rax
	movb	$1, 1(%rax)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	2(%rax), %eax
	movzbl	%al, %edi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movzbl	%al, %esi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$24, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movzwl	%ax, %eax
	movq	%rax, %rdi
	call	_Z8printHexl
	movl	$10, %edi
	call	_Z5printc
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	2(%rax), %eax
	movzbl	%al, %edi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movzbl	%al, %esi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	$24, %ecx
	movl	%edi, %edx
	movl	%eax, %edi
	call	_Z17pciConfigReadWordhhhh
	movl	%eax, %ecx
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$8, %rdx
	addq	%rdx, %rax
	andl	$-4, %ecx
	movl	%ecx, %edx
	movw	%dx, 2(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$8, %rdx
	addq	%rdx, %rax
	movb	$0, 1(%rax)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$8, %rdx
	addq	%rdx, %rax
	movq	hddEntryList(%rip), %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$4, %rcx
	addq	$12, %rcx
	addq	%rcx, %rdx
	movzwl	2(%rax), %eax
	movw	%ax, 2(%rdx)
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	$12, %rdx
	addq	%rdx, %rax
	movb	$1, 1(%rax)
.L43:
	addl	$1, -4(%rbp)
	jmp	.L44
.L41:
	movl	$0, -8(%rbp)
.L49:
	movzwl	hddCount(%rip), %eax
	cwtl
	cmpl	%eax, -8(%rbp)
	jge	.L50
	movq	hddEntryList(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movq	hddEntryList(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movzwl	2(%rax), %eax
	cwtl
	movl	$1, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z8setDrivescc
	movl	$0, %edi
	call	_Z14setSectorCounth
	movl	$0, %edi
	call	_Z15setDriveAddressj
	movl	$236, %edi
	call	_Z12writeCommandh
	call	_Z15readDriveStatusv
	movb	%al, -19(%rbp)
	cmpb	$0, -19(%rbp)
	je	.L46
	movzbl	-19(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L46
	movzbl	-19(%rbp), %eax
	andl	$32, %eax
	testl	%eax, %eax
	je	.L47
.L46:
	movq	hddEntryList(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	jmp	.L48
.L47:
	movq	hddEntryList(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movb	$1, (%rax)
.L48:
	addl	$1, -8(%rbp)
	jmp	.L49
.L50:
	nop
	leave
	.cfi_def_cfa 7, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$98, %edi
	call	_Z6malloci
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
.L55:
	movzwl	hddCount(%rip), %eax
	cwtl
	cmpl	%eax, -4(%rbp)
	jge	.L52
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$1, %al
	jne	.L53
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movzbl	1(%rax), %eax
	movsbl	%al, %ecx
	movq	hddEntryList(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movzwl	2(%rax), %eax
	cwtl
	movl	$1, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z8setDrivescc
	call	_Z7hddWaitv
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z12getDriveInfoPv
	testb	%al, %al
	sete	%al
	testb	%al, %al
	jne	.L56
	movq	-16(%rbp), %rax
	addq	$52, %rax
	movq	%rax, %rdi
	call	_Z5printPKc
	movl	$10, %edi
	call	_Z5printc
.L53:
	addl	$1, -4(%rbp)
	jmp	.L55
.L56:
	nop
.L52:
	movl	$.LC0, %edi
	call	_Z5printPKc
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z4freePv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	_Z7listHddv, .-_Z7listHddv
	.ident	"GCC: (GNU) 7.5.0"
