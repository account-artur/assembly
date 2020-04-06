
LC0:
	.ascii "Formula: t2 = ((2*x/(a*a))*(sin(a*x))-(((x*x)/a)-(2/(a*a*a)))*(cos(a*x)))\0"
LC1:
	.ascii "Enter your 'a'\0"
LC2:
	.ascii "%f\0"
LC3:
	.ascii "Enter your 'x'\0"
LC4:
	.ascii "Your 'a' is: %.1lf\12\0"
LC5:
	.ascii "Your 'x' is: %.1lf\12\0"
LC6:
	.ascii "-----------------\0"
LC8:
	.ascii "Result: %.1lf\12\0"
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
	subl	$48, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_puts
	leal	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	$LC3, (%esp)
	call	_puts
	leal	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	flds	44(%esp)
	fstpl	4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	flds	40(%esp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	$LC6, (%esp)
	call	_puts
	flds	40(%esp)
	fld	%st(0)
	faddp	%st, %st(1)
	flds	44(%esp)
	flds	44(%esp)
	fmulp	%st, %st(1)
	fdivrp	%st, %st(1)
	fstpl	24(%esp)
	flds	44(%esp)
	flds	40(%esp)
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fmull	24(%esp)
	fstpl	24(%esp)
	flds	40(%esp)
	flds	40(%esp)
	fmulp	%st, %st(1)
	flds	44(%esp)
	fdivrp	%st, %st(1)
	flds	44(%esp)
	flds	44(%esp)
	fmulp	%st, %st(1)
	flds	44(%esp)
	fmulp	%st, %st(1)
	flds	LC7
	fdivp	%st, %st(1)
	fsubrp	%st, %st(1)
	fstpl	16(%esp)
	flds	44(%esp)
	flds	40(%esp)
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fmull	16(%esp)
	fsubrl	24(%esp)
	fstpl	4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.section .rdata,"dr"
	.align 4
LC7:
	.long	1073741824
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
