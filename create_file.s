
LC0:
	.ascii "Current working directory: %s\12\0"
LC1:
	.ascii "w\0"
LC2:
	.ascii "current-folder.exe\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$288, %esp
	call	___main
	movl	$260, 4(%esp)
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	_getcwd
	testl	%eax, %eax
	je	L2
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
L2:
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, 284(%esp)
	movl	284(%esp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	_getcwd;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
