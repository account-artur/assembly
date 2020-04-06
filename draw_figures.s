
LC0:
	.ascii "\11    \0"
LC1:
	.ascii "* \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$1, 28(%esp)
	jmp	L2
L5:
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, 24(%esp)
	jmp	L3
L4:
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 24(%esp)
L3:
	movl	24(%esp), %eax
	cmpl	28(%esp), %eax
	jle	L4
	movl	$10, (%esp)
	call	_putchar
	addl	$1, 28(%esp)
L2:
	cmpl	$6, 28(%esp)
	jle	L5
	movl	$1, 20(%esp)
	jmp	L6
L9:
	movl	$1, 16(%esp)
	jmp	L7
L8:
	movl	$LC1, (%esp)
	call	_printf
	addl	$1, 16(%esp)
L7:
	cmpl	$6, 16(%esp)
	jle	L8
	movl	$10, (%esp)
	call	_putchar
	addl	$1, 20(%esp)
L6:
	cmpl	$6, 20(%esp)
	jle	L9
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef