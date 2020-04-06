
LC0:
	.ascii " %d \0"
LC1:
	.ascii "\0"
LC2:
	.ascii "%d \0"
LC3:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$432, %esp
	call	___main
	movl	$0, 428(%esp)
	jmp	L2
L3:
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$200, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	-100(%eax), %edx
	movl	428(%esp), %eax
	movl	%edx, 24(%esp,%eax,4)
	movl	428(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	addl	$1, 428(%esp)
L2:
	cmpl	$99, 428(%esp)
	jle	L3
	movl	$LC1, (%esp)
	call	_puts
	movl	$0, 428(%esp)
	movl	$-1, 424(%esp)
	jmp	L4
L9:
	cmpl	$-1, 424(%esp)
	jne	L5
	movl	428(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	testl	%eax, %eax
	jle	L7
	movl	428(%esp), %eax
	movl	%eax, 424(%esp)
	jmp	L7
L5:
	movl	428(%esp), %eax
	movl	24(%esp,%eax,4), %eax
	testl	%eax, %eax
	jg	L7
	movl	428(%esp), %eax
	subl	424(%esp), %eax
	cmpl	$5, %eax
	jle	L8
	movl	424(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
L8:
	movl	$-1, 424(%esp)
L7:
	addl	$1, 428(%esp)
L4:
	cmpl	$99, 428(%esp)
	jle	L9
	cmpl	$0, 424(%esp)
	js	L10
	movl	424(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L10:
	movl	$LC1, (%esp)
	call	_puts
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
