	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_create_list
	.align	4, 0x90
_create_list:                           ## @create_list
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
	movl	$1, %edi
	movl	$16, %esi
	callq	_xcalloc
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_insert_at_begin
	.align	4, 0x90
_insert_at_begin:                       ## @insert_at_begin
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %edi
	callq	_get_new_node
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_link_nodes
	movl	$2, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_insert_at_end
	.align	4, 0x90
_insert_at_end:                         ## @insert_at_end
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %edi
	callq	_get_new_node
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_get_last_node
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_link_nodes
	movl	$2, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_insert_before_data
	.align	4, 0x90
_insert_before_data:                    ## @insert_before_data
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
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	%edx, -24(%rbp)
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_serch_back_node
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB3_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB3_3
LBB3_2:
	movl	-24(%rbp), %edi
	callq	_get_new_node
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_link_nodes
	movl	$2, -4(%rbp)
LBB3_3:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_insert_after_data
	.align	4, 0x90
_insert_after_data:                     ## @insert_after_data
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
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	%edx, -24(%rbp)
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_serch_node
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB4_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB4_3
LBB4_2:
	movl	-24(%rbp), %edi
	callq	_get_new_node
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_link_nodes
	movl	$2, -4(%rbp)
LBB4_3:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_delete_begin
	.align	4, 0x90
_delete_begin:                          ## @delete_begin
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
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB5_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB5_3
LBB5_2:
	movq	-16(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rsi
	callq	_unlink_nodes
	movl	$2, -4(%rbp)
LBB5_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_is_empty
	.align	4, 0x90
_is_empty:                              ## @is_empty
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
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB6_2
## BB#1:
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	LBB6_3
LBB6_2:
	movl	$1, -4(%rbp)
	jmp	LBB6_4
LBB6_3:
	movl	$0, -4(%rbp)
LBB6_4:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_delete_data
	.align	4, 0x90
_delete_data:                           ## @delete_data
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
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB7_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB7_5
LBB7_2:
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_serch_back_node
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB7_4
## BB#3:
	movl	$-1, -4(%rbp)
	jmp	LBB7_5
LBB7_4:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_unlink_nodes
	movl	$2, -4(%rbp)
LBB7_5:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_delete_end
	.align	4, 0x90
_delete_end:                            ## @delete_end
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
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB8_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB8_3
LBB8_2:
	movq	-16(%rbp), %rdi
	callq	_get_second_last_node
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	_unlink_nodes
	movl	$2, -4(%rbp)
LBB8_3:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_is_at_begining
	.align	4, 0x90
_is_at_begining:                        ## @is_at_begining
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
	xorl	%eax, %eax
	movl	$1, %ecx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	movl	(%rdi), %esi
	cmpl	-12(%rbp), %esi
	cmovel	%ecx, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_is_before
	.align	4, 0x90
_is_before:                             ## @is_before
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp30:
	.cfi_def_cfa_offset 16
Ltmp31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp32:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	%edx, -24(%rbp)
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_serch_node
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB10_4
## BB#1:
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB10_3
## BB#2:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	cmpl	-24(%rbp), %ecx
	jne	LBB10_4
LBB10_3:
	movl	$1, -4(%rbp)
	jmp	LBB10_5
LBB10_4:
	movl	$0, -4(%rbp)
LBB10_5:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_find
	.align	4, 0x90
_find:                                  ## @find
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp33:
	.cfi_def_cfa_offset 16
Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp35:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -32(%rbp)
LBB11_1:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB11_5
## BB#2:                                ##   in Loop: Header=BB11_1 Depth=1
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	cmpl	-20(%rbp), %ecx
	jne	LBB11_4
## BB#3:
	movl	$1, -4(%rbp)
	jmp	LBB11_6
LBB11_4:                                ##   in Loop: Header=BB11_1 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	LBB11_1
LBB11_5:
	movl	$0, -4(%rbp)
LBB11_6:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_is_after
	.align	4, 0x90
_is_after:                              ## @is_after
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp36:
	.cfi_def_cfa_offset 16
Ltmp37:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp38:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	%edx, -24(%rbp)
	movq	-16(%rbp), %rdi
	movl	-24(%rbp), %esi
	callq	_serch_node
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB12_4
## BB#1:
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	LBB12_3
## BB#2:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	cmpl	-20(%rbp), %ecx
	jne	LBB12_4
LBB12_3:
	movl	$1, -4(%rbp)
	jmp	LBB12_5
LBB12_4:
	movl	$0, -4(%rbp)
LBB12_5:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_is_at_end
	.align	4, 0x90
_is_at_end:                             ## @is_at_end
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp39:
	.cfi_def_cfa_offset 16
Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp41:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	callq	_get_last_node
	xorl	%esi, %esi
	movl	$1, %ecx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	cmpl	-12(%rbp), %edx
	cmovel	%ecx, %esi
	movl	%esi, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_examine_del_beg
	.align	4, 0x90
_examine_del_beg:                       ## @examine_del_beg
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp42:
	.cfi_def_cfa_offset 16
Ltmp43:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp44:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB14_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB14_3
LBB14_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-16(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rsi
	callq	_unlink_nodes
	movl	$2, -4(%rbp)
LBB14_3:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_examine_del_end
	.align	4, 0x90
_examine_del_end:                       ## @examine_del_end
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp45:
	.cfi_def_cfa_offset 16
Ltmp46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp47:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB15_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB15_3
LBB15_2:
	movq	-16(%rbp), %rdi
	callq	_get_second_last_node
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_unlink_nodes
	movl	$2, -4(%rbp)
LBB15_3:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_print_list
	.align	4, 0x90
_print_list:                            ## @print_list
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp48:
	.cfi_def_cfa_offset 16
Ltmp49:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp50:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -16(%rbp)
LBB16_1:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -16(%rbp)
	je	LBB16_3
## BB#2:                                ##   in Loop: Header=BB16_1 Depth=1
	leaq	L_.str(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	(%rax), %esi
	movb	$0, %al
	callq	_printf
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	movq	%rdi, -16(%rbp)
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	jmp	LBB16_1
LBB16_3:
	leaq	L_.str1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_sort
	.align	4, 0x90
_sort:                                  ## @sort
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp51:
	.cfi_def_cfa_offset 16
Ltmp52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp53:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_length
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	LBB17_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB17_6
LBB17_2:
	movl	$4, %esi
	movl	-20(%rbp), %edi
	callq	_xcalloc
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	movq	-32(%rbp), %rdx
	callq	_list_to_array
	cmpl	$1000, -20(%rbp)        ## imm = 0x3E8
	jge	LBB17_4
## BB#3:
	movq	-32(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_insertion_sort
	jmp	LBB17_5
LBB17_4:
	movq	-32(%rbp), %rdi
	movl	-20(%rbp), %esi
	callq	_merge_sort
LBB17_5:
	movq	-32(%rbp), %rdi
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rdx
	callq	_array_to_list
	movl	$2, -4(%rbp)
LBB17_6:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_length
	.align	4, 0x90
_length:                                ## @length
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp54:
	.cfi_def_cfa_offset 16
Ltmp55:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp56:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
	movq	-16(%rbp), %rdi
	callq	_is_empty
	cmpl	$1, %eax
	jne	LBB18_2
## BB#1:
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB18_6
LBB18_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
LBB18_3:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB18_5
## BB#4:                                ##   in Loop: Header=BB18_3 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movl	-20(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -20(%rbp)
	jmp	LBB18_3
LBB18_5:
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
LBB18_6:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_distroy
	.align	4, 0x90
_distroy:                               ## @distroy
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp57:
	.cfi_def_cfa_offset 16
Ltmp58:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp59:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, -16(%rbp)
LBB19_1:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -16(%rbp)
	je	LBB19_3
## BB#2:                                ##   in Loop: Header=BB19_1 Depth=1
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	jmp	LBB19_1
LBB19_3:
	movl	$2, %eax
	movq	$0, -8(%rbp)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"[%d] "

L_.str1:                                ## @.str1
	.asciz	"\n"


.subsections_via_symbols
