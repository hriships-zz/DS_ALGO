	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
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
	subq	$16, %rsp
	leaq	-16(%rbp), %rdi
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	callq	_test_create
	movq	-16(%rbp), %rdi
	callq	_test_insert
	movq	-16(%rbp), %rdi
	callq	_test_delete
	movq	-16(%rbp), %rdi
	callq	_test_examine
	movq	-16(%rbp), %rdi
	callq	_test_distroy
	leaq	-16(%rbp), %rdi
	callq	_test_create
	movq	-16(%rbp), %rdi
	callq	_test_sorting
	xorl	%edi, %edi
	callq	_exit
	.cfi_endproc

	.globl	_test_create
	.align	4, 0x90
_test_create:                           ## @test_create
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
	movq	%rdi, -8(%rbp)
	movb	$0, %al
	callq	_create_list
	movq	-8(%rbp), %rdi
	movq	%rax, (%rdi)
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	setne	%cl
	xorb	$1, %cl
	andb	$1, %cl
	movzbl	%cl, %edx
	movslq	%edx, %rax
	cmpq	$0, %rax
	je	LBB1_2
## BB#1:
	leaq	L___func__.test_create(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$32, %edx
	leaq	L_.str1(%rip), %rcx
	callq	___assert_rtn
LBB1_2:
	jmp	LBB1_3
LBB1_3:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_insert
	.align	4, 0x90
_test_insert:                           ## @test_insert
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
	movl	$10, %esi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_insert_at_begin
	xorl	%esi, %esi
	movb	%sil, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -13(%rbp)          ## 1-byte Spill
	jne	LBB2_2
## BB#1:
	movl	$10, %esi
	movq	-8(%rbp), %rdi
	callq	_is_at_begining
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -13(%rbp)          ## 1-byte Spill
LBB2_2:
	movb	-13(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_4
## BB#3:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$40, %edx
	leaq	L_.str2(%rip), %rcx
	callq	___assert_rtn
LBB2_4:
	jmp	LBB2_5
LBB2_5:
	movl	$40, %esi
	movq	-8(%rbp), %rdi
	callq	_insert_at_end
	xorl	%esi, %esi
	movb	%sil, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -14(%rbp)          ## 1-byte Spill
	jne	LBB2_7
## BB#6:
	movl	$40, %esi
	movq	-8(%rbp), %rdi
	callq	_is_at_end
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -14(%rbp)          ## 1-byte Spill
LBB2_7:
	movb	-14(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_9
## BB#8:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$43, %edx
	leaq	L_.str3(%rip), %rcx
	callq	___assert_rtn
LBB2_9:
	jmp	LBB2_10
LBB2_10:
	movl	$40, %esi
	movl	$30, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_before_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -15(%rbp)          ## 1-byte Spill
	jne	LBB2_12
## BB#11:
	movl	$30, %esi
	movl	$40, %edx
	movq	-8(%rbp), %rdi
	callq	_is_before
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -15(%rbp)          ## 1-byte Spill
LBB2_12:
	movb	-15(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_14
## BB#13:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$46, %edx
	leaq	L_.str4(%rip), %rcx
	callq	___assert_rtn
LBB2_14:
	jmp	LBB2_15
LBB2_15:
	movl	$10, %esi
	movl	$5, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_before_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -16(%rbp)          ## 1-byte Spill
	jne	LBB2_17
## BB#16:
	movl	$5, %esi
	movl	$10, %edx
	movq	-8(%rbp), %rdi
	callq	_is_before
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -16(%rbp)          ## 1-byte Spill
LBB2_17:
	movb	-16(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_19
## BB#18:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$49, %edx
	leaq	L_.str5(%rip), %rcx
	callq	___assert_rtn
LBB2_19:
	jmp	LBB2_20
LBB2_20:
	movl	$100, %esi
	movl	$50, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_before_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	movb	%cl, -17(%rbp)          ## 1-byte Spill
	jne	LBB2_22
## BB#21:
	movl	$50, %esi
	movl	$100, %edx
	movq	-8(%rbp), %rdi
	callq	_is_before
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -17(%rbp)          ## 1-byte Spill
LBB2_22:
	movb	-17(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_24
## BB#23:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$52, %edx
	leaq	L_.str6(%rip), %rcx
	callq	___assert_rtn
LBB2_24:
	jmp	LBB2_25
LBB2_25:
	movl	$40, %esi
	movl	$50, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_after_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -18(%rbp)          ## 1-byte Spill
	jne	LBB2_27
## BB#26:
	movl	$50, %esi
	movl	$40, %edx
	movq	-8(%rbp), %rdi
	callq	_is_after
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -18(%rbp)          ## 1-byte Spill
LBB2_27:
	movb	-18(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_29
## BB#28:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$55, %edx
	leaq	L_.str7(%rip), %rcx
	callq	___assert_rtn
LBB2_29:
	jmp	LBB2_30
LBB2_30:
	movl	$5, %esi
	movl	$8, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_after_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -19(%rbp)          ## 1-byte Spill
	jne	LBB2_32
## BB#31:
	movl	$8, %esi
	movl	$5, %edx
	movq	-8(%rbp), %rdi
	callq	_is_after
	cmpl	$1, %eax
	sete	%cl
	movb	%cl, -19(%rbp)          ## 1-byte Spill
LBB2_32:
	movb	-19(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_34
## BB#33:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$58, %edx
	leaq	L_.str8(%rip), %rcx
	callq	___assert_rtn
LBB2_34:
	jmp	LBB2_35
LBB2_35:
	movl	$35, %esi
	movl	$45, %edx
	movq	-8(%rbp), %rdi
	callq	_insert_after_data
	xorl	%edx, %edx
	movb	%dl, %cl
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	movb	%cl, -20(%rbp)          ## 1-byte Spill
	jne	LBB2_37
## BB#36:
	movl	$45, %esi
	movl	$35, %edx
	movq	-8(%rbp), %rdi
	callq	_is_after
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -20(%rbp)          ## 1-byte Spill
LBB2_37:
	movb	-20(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB2_39
## BB#38:
	leaq	L___func__.test_insert(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$61, %edx
	leaq	L_.str9(%rip), %rcx
	callq	___assert_rtn
LBB2_39:
	jmp	LBB2_40
LBB2_40:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_delete
	.align	4, 0x90
_test_delete:                           ## @test_delete
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
	movq	-8(%rbp), %rdi
	callq	_delete_begin
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%dl, -13(%rbp)          ## 1-byte Spill
	jne	LBB3_2
## BB#1:
	movl	$5, %esi
	movq	-8(%rbp), %rdi
	callq	_is_at_begining
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -13(%rbp)          ## 1-byte Spill
LBB3_2:
	movb	-13(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB3_4
## BB#3:
	leaq	L___func__.test_delete(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$69, %edx
	leaq	L_.str10(%rip), %rcx
	callq	___assert_rtn
LBB3_4:
	jmp	LBB3_5
LBB3_5:
	movl	$50, %esi
	movq	-8(%rbp), %rdi
	callq	_delete_data
	xorl	%esi, %esi
	movb	%sil, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -14(%rbp)          ## 1-byte Spill
	jne	LBB3_7
## BB#6:
	movl	$50, %esi
	movq	-8(%rbp), %rdi
	callq	_find
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -14(%rbp)          ## 1-byte Spill
LBB3_7:
	movb	-14(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB3_9
## BB#8:
	leaq	L___func__.test_delete(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$72, %edx
	leaq	L_.str11(%rip), %rcx
	callq	___assert_rtn
LBB3_9:
	jmp	LBB3_10
LBB3_10:
	movl	$8, %esi
	movq	-8(%rbp), %rdi
	callq	_delete_data
	xorl	%esi, %esi
	movb	%sil, %cl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%cl, -15(%rbp)          ## 1-byte Spill
	jne	LBB3_12
## BB#11:
	movl	$8, %esi
	movq	-8(%rbp), %rdi
	callq	_find
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -15(%rbp)          ## 1-byte Spill
LBB3_12:
	movb	-15(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB3_14
## BB#13:
	leaq	L___func__.test_delete(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$75, %edx
	leaq	L_.str12(%rip), %rcx
	callq	___assert_rtn
LBB3_14:
	jmp	LBB3_15
LBB3_15:
	movl	$80, %esi
	movq	-8(%rbp), %rdi
	callq	_delete_data
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	sete	%cl
	xorb	$1, %cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movslq	%eax, %rdi
	cmpq	$0, %rdi
	je	LBB3_17
## BB#16:
	leaq	L___func__.test_delete(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$78, %edx
	leaq	L_.str13(%rip), %rcx
	callq	___assert_rtn
LBB3_17:
	jmp	LBB3_18
LBB3_18:
	movq	-8(%rbp), %rdi
	callq	_delete_end
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%dl, -16(%rbp)          ## 1-byte Spill
	jne	LBB3_20
## BB#19:
	movl	$40, %esi
	movq	-8(%rbp), %rdi
	callq	_is_at_end
	cmpl	$0, %eax
	sete	%cl
	movb	%cl, -16(%rbp)          ## 1-byte Spill
LBB3_20:
	movb	-16(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB3_22
## BB#21:
	leaq	L___func__.test_delete(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$81, %edx
	leaq	L_.str14(%rip), %rcx
	callq	___assert_rtn
LBB3_22:
	jmp	LBB3_23
LBB3_23:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_examine
	.align	4, 0x90
_test_examine:                          ## @test_examine
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
	subq	$32, %rsp
	leaq	-16(%rbp), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_examine_del_beg
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%dl, -17(%rbp)          ## 1-byte Spill
	jne	LBB4_2
## BB#1:
	cmpl	$10, -16(%rbp)
	sete	%al
	movb	%al, -17(%rbp)          ## 1-byte Spill
LBB4_2:
	movb	-17(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB4_4
## BB#3:
	leaq	L___func__.test_examine(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$90, %edx
	leaq	L_.str15(%rip), %rcx
	callq	___assert_rtn
LBB4_4:
	jmp	LBB4_5
LBB4_5:
	leaq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	callq	_examine_del_end
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movl	%eax, -12(%rbp)
	cmpl	$2, -12(%rbp)
	movb	%dl, -18(%rbp)          ## 1-byte Spill
	jne	LBB4_7
## BB#6:
	cmpl	$30, -16(%rbp)
	sete	%al
	movb	%al, -18(%rbp)          ## 1-byte Spill
LBB4_7:
	movb	-18(%rbp), %al          ## 1-byte Reload
	xorb	$1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB4_9
## BB#8:
	leaq	L___func__.test_examine(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$93, %edx
	leaq	L_.str16(%rip), %rcx
	callq	___assert_rtn
LBB4_9:
	jmp	LBB4_10
LBB4_10:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_distroy
	.align	4, 0x90
_test_distroy:                          ## @test_distroy
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
	leaq	-8(%rbp), %rax
	movq	%rdi, -8(%rbp)
	movq	%rax, %rdi
	callq	_distroy
	movq	-8(%rbp), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	callq	_length
	cmpl	$0, %eax
	sete	%cl
	xorb	$1, %cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movslq	%eax, %rdi
	cmpq	$0, %rdi
	je	LBB5_2
## BB#1:
	leaq	L___func__.test_distroy(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$99, %edx
	leaq	L_.str17(%rip), %rcx
	callq	___assert_rtn
LBB5_2:
	jmp	LBB5_3
LBB5_3:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_test_sorting
	.align	4, 0x90
_test_sorting:                          ## @test_sorting
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
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_time
	movl	%eax, %edx
	movl	%edx, %edi
	callq	_srand
	callq	_rand
	movl	$16, %edx
	movl	%edx, -24(%rbp)         ## 4-byte Spill
	cltd
	movl	-24(%rbp), %edi         ## 4-byte Reload
	idivl	%edi
	movl	%edx, -16(%rbp)
	movl	$0, -12(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	LBB6_4
## BB#2:                                ##   in Loop: Header=BB6_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	callq	_rand
	movl	$10, %ecx
	cltd
	idivl	%ecx
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movl	%edx, %esi
	callq	_insert_at_end
	movl	%eax, -36(%rbp)         ## 4-byte Spill
## BB#3:                                ##   in Loop: Header=BB6_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB6_1
LBB6_4:
	movq	-8(%rbp), %rdi
	callq	_sort
	movl	%eax, -20(%rbp)
	cmpl	$2, -20(%rbp)
	sete	%cl
	xorb	$1, %cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movslq	%eax, %rdi
	cmpq	$0, %rdi
	je	LBB6_6
## BB#5:
	leaq	L___func__.test_sorting(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$113, %edx
	leaq	L_.str18(%rip), %rcx
	callq	___assert_rtn
LBB6_6:
	jmp	LBB6_7
LBB6_7:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L___func__.test_create:                 ## @__func__.test_create
	.asciz	"test_create"

L_.str:                                 ## @.str
	.asciz	"client.c"

L_.str1:                                ## @.str1
	.asciz	"*list != NULL"

L___func__.test_insert:                 ## @__func__.test_insert
	.asciz	"test_insert"

L_.str2:                                ## @.str2
	.asciz	"insert_result == SUCCESS && is_at_begining(list, 10) == TRUE"

L_.str3:                                ## @.str3
	.asciz	"insert_result == SUCCESS && is_at_end(list, 40) == TRUE"

L_.str4:                                ## @.str4
	.asciz	"insert_result == SUCCESS && is_before(list, 30, 40) == TRUE"

L_.str5:                                ## @.str5
	.asciz	"insert_result == SUCCESS && is_before(list, 5, 10) == TRUE"

L_.str6:                                ## @.str6
	.asciz	"insert_result == ERROR && is_before(list, 50, 100) == FALSE"

L_.str7:                                ## @.str7
	.asciz	"insert_result == SUCCESS && is_after(list, 50, 40) == TRUE"

L_.str8:                                ## @.str8
	.asciz	"insert_result == SUCCESS && is_after(list, 8, 5) == TRUE"

L_.str9:                                ## @.str9
	.asciz	"insert_result == ERROR && is_after(list, 45, 35) == FALSE"

L___func__.test_delete:                 ## @__func__.test_delete
	.asciz	"test_delete"

L_.str10:                               ## @.str10
	.asciz	"delete_result == SUCCESS && is_at_begining(list, 5) == FALSE"

L_.str11:                               ## @.str11
	.asciz	"delete_result == SUCCESS && find(list, 50) == FALSE"

L_.str12:                               ## @.str12
	.asciz	"delete_result == SUCCESS && find(list, 8) == FALSE"

L_.str13:                               ## @.str13
	.asciz	"delete_result == ERROR"

L_.str14:                               ## @.str14
	.asciz	"delete_result == SUCCESS && is_at_end(list, 40) == FALSE"

L___func__.test_examine:                ## @__func__.test_examine
	.asciz	"test_examine"

L_.str15:                               ## @.str15
	.asciz	"examine_result == SUCCESS && examine_data == 10"

L_.str16:                               ## @.str16
	.asciz	"examine_result == SUCCESS && examine_data == 30"

L___func__.test_distroy:                ## @__func__.test_distroy
	.asciz	"test_distroy"

L_.str17:                               ## @.str17
	.asciz	"length(list) == 0"

L___func__.test_sorting:                ## @__func__.test_sorting
	.asciz	"test_sorting"

L_.str18:                               ## @.str18
	.asciz	"sort_result == SUCCESS"


.subsections_via_symbols
