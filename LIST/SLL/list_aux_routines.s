	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_xcalloc
	.align	4, 0x90
_xcalloc:                               ## @xcalloc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movslq	-4(%rbp), %rdi
	movslq	-8(%rbp), %rsi
	callq	_calloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB0_2
## BB#1:
	leaq	L_.str(%rip), %rsi
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -20(%rbp)         ## 4-byte Spill
LBB0_2:
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_get_new_node
	.align	4, 0x90
_get_new_node:                          ## @get_new_node
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$1, %eax
	movl	$16, %esi
	movl	%edi, -4(%rbp)
	movl	%eax, %edi
	callq	_xcalloc
	movq	%rax, -16(%rbp)
	movl	-4(%rbp), %esi
	movq	-16(%rbp), %rax
	movl	%esi, (%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_link_nodes
	.align	4, 0x90
_link_nodes:                            ## @link_nodes
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	8(%rsi), %rsi
	movq	-16(%rbp), %rdi
	movq	%rsi, 8(%rdi)
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movq	%rsi, 8(%rdi)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_unlink_nodes
	.align	4, 0x90
_unlink_nodes:                          ## @unlink_nodes
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rsi
	movq	8(%rsi), %rsi
	movq	-8(%rbp), %rdi
	movq	%rsi, 8(%rdi)
	movq	-16(%rbp), %rsi
	movq	%rsi, %rdi
	callq	_free
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_serch_node
	.align	4, 0x90
_serch_node:                            ## @serch_node
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -32(%rbp)
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB4_5
## BB#2:                                ##   in Loop: Header=BB4_1 Depth=1
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	cmpl	-20(%rbp), %ecx
	jne	LBB4_4
## BB#3:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB4_6
LBB4_4:                                 ##   in Loop: Header=BB4_1 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	LBB4_1
LBB4_5:
	movq	$0, -8(%rbp)
LBB4_6:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_serch_back_node
	.align	4, 0x90
_serch_back_node:                       ## @serch_back_node
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, -32(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB5_5
## BB#2:                                ##   in Loop: Header=BB5_1 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	cmpl	-20(%rbp), %ecx
	jne	LBB5_4
## BB#3:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_6
LBB5_4:                                 ##   in Loop: Header=BB5_1 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	LBB5_1
LBB5_5:
	movq	$0, -8(%rbp)
LBB5_6:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_get_last_node
	.align	4, 0x90
_get_last_node:                         ## @get_last_node
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB6_3
## BB#2:                                ##   in Loop: Header=BB6_1 Depth=1
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	LBB6_1
LBB6_3:
	movq	-16(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_get_second_last_node
	.align	4, 0x90
_get_second_last_node:                  ## @get_second_last_node
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp21:
	.cfi_def_cfa_offset 16
Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp23:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -24(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB7_3
## BB#2:                                ##   in Loop: Header=BB7_1 Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	LBB7_1
LBB7_3:
	movq	-16(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_list_to_array
	.align	4, 0x90
_list_to_array:                         ## @list_to_array
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp24:
	.cfi_def_cfa_offset 16
Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp26:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -40(%rbp)
LBB8_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -40(%rbp)
	je	LBB8_3
## BB#2:                                ##   in Loop: Header=BB8_1 Depth=1
	movq	-40(%rbp), %rax
	movl	(%rax), %ecx
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, -28(%rbp)
	movslq	%edx, %rax
	movq	-24(%rbp), %rdi
	movl	%ecx, (%rdi,%rax,4)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	LBB8_1
LBB8_3:
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_array_to_list
	.align	4, 0x90
_array_to_list:                         ## @array_to_list
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp27:
	.cfi_def_cfa_offset 16
Ltmp28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp29:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	-24(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, -40(%rbp)
	movl	$0, -28(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	LBB9_4
## BB#2:                                ##   in Loop: Header=BB9_1 Depth=1
	movslq	-28(%rbp), %rax
	movq	-8(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
## BB#3:                                ##   in Loop: Header=BB9_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB9_1
LBB9_4:
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"OUT OF MEMMORY"


.subsections_via_symbols
