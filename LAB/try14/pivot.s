	.file	"pivot.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.p2align 4,,15
	.globl	compare_2_combinations
	.def	compare_2_combinations;	.scl	2;	.type	32;	.endef
	.seh_proc	compare_2_combinations
compare_2_combinations:
.LVL0:
.LFB5614:
	.file 1 "./pivot.c"
	.loc 1 174 58 view -0
	.cfi_startproc
	.loc 1 174 58 is_stmt 0 view .LVU1
	.seh_endprologue
	.loc 1 175 5 is_stmt 1 view .LVU2
.LVL1:
	.loc 1 176 5 view .LVU3
	.loc 1 178 5 view .LVU4
	.loc 1 179 16 is_stmt 0 view .LVU5
	movl	$1, %eax
	.loc 1 178 11 view .LVU6
	movsd	8(%rcx), %xmm0
	.loc 1 178 22 view .LVU7
	movsd	8(%rdx), %xmm1
	.loc 1 178 8 view .LVU8
	comisd	%xmm1, %xmm0
	ja	.L1
	.loc 1 180 12 is_stmt 1 view .LVU9
	.loc 1 180 15 is_stmt 0 view .LVU10
	xorl	%eax, %eax
	comisd	%xmm0, %xmm1
	seta	%al
	negl	%eax
.L1:
	.loc 1 185 1 view .LVU11
	ret
	.cfi_endproc
.LFE5614:
	.seh_endproc
	.p2align 4,,15
	.def	main._omp_fn.0;	.scl	3;	.type	32;	.endef
	.seh_proc	main._omp_fn.0
main._omp_fn.0:
.LVL2:
.LFB5619:
	.loc 1 311 9 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 311 9 is_stmt 0 view .LVU13
	pushq	%r15
	.seh_pushreg	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	subq	$152, %rsp
	.seh_stackalloc	152
	.cfi_def_cfa_offset 224
	.seh_endprologue
	.loc 1 311 9 view .LVU14
	movl	(%rcx), %esi
	movl	%esi, 136(%rsp)
.LVL3:
.LBB95:
.LBB96:
	.loc 1 312 14 is_stmt 1 view .LVU15
	call	omp_get_num_threads
.LVL4:
	.loc 1 312 14 is_stmt 0 view .LVU16
	movl	%eax, %ebx
	call	omp_get_thread_num
.LVL5:
	imull	$200, %eax, %edi
	leal	200(%rdi), %edx
	movl	%edi, 108(%rsp)
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	cmpl	%edi, %esi
	movl	%edx, 60(%rsp)
	jle	.L5
.LBB97:
	.loc 1 314 26 view .LVU17
	movl	m(%rip), %edx
	movl	%eax, %ecx
	addl	%ebx, %eax
	.loc 1 314 30 view .LVU18
	movslq	n(%rip), %r10
	imull	$200, %eax, %eax
.LBB98:
.LBB99:
.LBB100:
	.loc 1 321 34 view .LVU19
	movq	cache_eu_dist(%rip), %r13
	.loc 1 322 43 view .LVU20
	movq	euclidean_distance(%rip), %r14
.LBE100:
.LBE99:
.LBE98:
	.loc 1 314 26 view .LVU21
	imull	%edx, %ecx
	subl	%edi, %eax
	movq	.LC1(%rip), %xmm3
	.loc 1 314 30 view .LVU22
	movq	%r10, %r9
	movl	%eax, 140(%rsp)
	leal	-1(%r9), %eax
	movl	%r9d, %r11d
	.loc 1 314 17 view .LVU23
	imull	%r10d, %ecx
	movl	%eax, 36(%rsp)
	salq	$3, %r10
	andl	$-2, %r11d
	movq	%rax, 88(%rsp)
	leal	-2(%r9), %eax
	addq	$2, %rax
	movl	%ecx, %esi
.LVL6:
	.loc 1 314 17 view .LVU24
	movl	%ecx, 104(%rsp)
	imull	$200, %ebx, %ecx
	movq	%rax, 96(%rsp)
	movslq	%ecx, %rcx
	salq	$4, %rcx
	movq	%rcx, 128(%rsp)
	movslq	%edi, %rcx
	salq	$4, %rcx
	addq	object(%rip), %rcx
	movq	%rcx, 112(%rsp)
	movslq	%esi, %rcx
	movq	%rcx, 72(%rsp)
	leaq	0(%r13,%rcx,8), %rcx
	movq	%rcx, 64(%rsp)
	leal	-1(%rdx), %ecx
	movq	%rcx, 120(%rsp)
	movl	%r9d, %ecx
	shrl	%ecx
	salq	$4, %rcx
	movq	%rcx, %r15
.L10:
.LBE97:
.LBE96:
.LBE95:
	.loc 1 311 9 view .LVU25
	movl	108(%rsp), %eax
	movq	112(%rsp), %rbx
	movl	%eax, 56(%rsp)
	movq	120(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 80(%rsp)
	.p2align 4,,10
.L9:
.LVL7:
.LBB127:
.LBB125:
.LBB123:
	.loc 1 313 13 is_stmt 1 view .LVU26
	.loc 1 314 13 view .LVU27
	.loc 1 315 13 view .LVU28
.LBB106:
	.loc 1 316 13 is_stmt 0 view .LVU29
	testl	%edx, %edx
.LBE106:
	.loc 1 315 18 view .LVU30
	movq	(%rbx), %rdi
.LVL8:
	.loc 1 316 13 is_stmt 1 view .LVU31
.LBB107:
	.loc 1 316 18 view .LVU32
	.loc 1 316 13 is_stmt 0 view .LVU33
	jle	.L39
	testl	%r9d, %r9d
	jle	.L11
	movq	80(%rsp), %rax
	movq	%rbx, 48(%rsp)
	movl	104(%rsp), %esi
	movl	%edx, 40(%rsp)
	movq	64(%rsp), %rcx
	movq	88(%rsp), %r12
	leaq	(%rdi,%rax,4), %rax
	movq	%rax, %rbx
.LVL9:
	.p2align 4,,10
.L20:
.LBB104:
	.loc 1 317 17 is_stmt 1 view .LVU34
	.loc 1 318 17 view .LVU35
	.loc 1 319 17 view .LVU36
	.loc 1 319 21 is_stmt 0 view .LVU37
	movl	(%rdi), %eax
	imull	%r9d, %eax
.LVL10:
	.loc 1 320 17 is_stmt 1 view .LVU38
.LBB101:
	.loc 1 320 22 view .LVU39
	.loc 1 320 22 is_stmt 0 view .LVU40
	movslq	%eax, %r8
	leaq	(%r14,%r8,8), %rdx
	leaq	16(%r14,%r8,8), %r8
	cmpq	%r8, %rcx
	leaq	16(%rcx), %r8
	setnb	%bpl
	cmpq	%r8, %rdx
	setnb	%r8b
	orb	%r8b, %bpl
	je	.L19
.LBE101:
	.loc 1 319 21 view .LVU41
	xorl	%r8d, %r8d
	cmpl	$3, 36(%rsp)
	jbe	.L19
.LVL11:
	.p2align 4,,10
.L17:
.LBB102:
	.loc 1 321 21 is_stmt 1 discriminator 3 view .LVU42
	.loc 1 322 43 is_stmt 0 discriminator 3 view .LVU43
	movq	(%rdx,%r8), %xmm0
	movhpd	8(%rdx,%r8), %xmm0
	.loc 1 321 47 discriminator 3 view .LVU44
	movlpd	%xmm0, (%rcx,%r8)
	movhpd	%xmm0, 8(%rcx,%r8)
	.loc 1 321 47 discriminator 3 view .LVU45
	addq	$16, %r8
	cmpq	%r8, %r15
	jne	.L17
	cmpl	%r9d, %r11d
	je	.L23
.LVL12:
	.loc 1 321 21 is_stmt 1 view .LVU46
	.loc 1 322 48 is_stmt 0 view .LVU47
	addl	%r11d, %eax
.LVL13:
	.loc 1 322 48 view .LVU48
	cltq
	.loc 1 322 43 view .LVU49
	movsd	(%r14,%rax,8), %xmm0
	.loc 1 321 38 view .LVU50
	leal	(%rsi,%r11), %eax
	cltq
	.loc 1 321 47 view .LVU51
	movsd	%xmm0, 0(%r13,%rax,8)
.LVL14:
.L23:
	.loc 1 321 47 view .LVU52
	addq	$4, %rdi
	addq	%r10, %rcx
	addl	%r9d, %esi
.LVL15:
	.loc 1 321 47 view .LVU53
.LBE102:
.LBE104:
	.loc 1 316 13 view .LVU54
	cmpq	%rbx, %rdi
	jne	.L20
	movl	40(%rsp), %edx
	movq	48(%rsp), %rbx
.LVL16:
.L8:
	.loc 1 316 13 view .LVU55
.LBE107:
.LBB108:
.LBB109:
	.loc 1 326 17 is_stmt 1 view .LVU56
	.loc 1 327 17 view .LVU57
.LBB110:
	.loc 1 327 22 view .LVU58
	.loc 1 327 17 is_stmt 0 view .LVU59
	cmpl	$1, %r9d
	jle	.L11
	.loc 1 327 17 view .LVU60
	movq	%r14, 40(%rsp)
	movq	96(%rsp), %r14
	movl	$1, %ebp
.LBE110:
.LBE109:
	.loc 1 325 22 view .LVU61
	xorl	%eax, %eax
	movl	%r11d, 48(%rsp)
	movq	72(%rsp), %r11
.LVL17:
	.p2align 4,,10
.L12:
	.loc 1 325 22 view .LVU62
	movq	%rbp, %r8
	movsd	8(%rbx), %xmm2
	movl	%ebp, %r12d
.LVL18:
	.loc 1 325 22 view .LVU63
	movl	%ebp, %esi
	subq	%rax, %r8
	addq	%r11, %rax
	leaq	0(%r13,%rax,8), %rdi
.LVL19:
	.p2align 4,,10
.L15:
.LBB120:
.LBB118:
.LBB111:
.LBB112:
.LBB113:
	.loc 1 106 5 view .LVU64
	testl	%edx, %edx
	jle	.L13
	.loc 1 106 5 view .LVU65
	movq	%rdi, %rax
	.loc 1 106 14 view .LVU66
	xorl	%ecx, %ecx
.LBE113:
	.loc 1 104 12 view .LVU67
	pxor	%xmm1, %xmm1
.LVL20:
	.p2align 4,,10
.L14:
.LBB117:
.LBB114:
	.loc 1 107 9 is_stmt 1 view .LVU68
	.loc 1 108 9 view .LVU69
	.loc 1 109 9 view .LVU70
	.loc 1 111 9 view .LVU71
	.loc 1 109 47 is_stmt 0 view .LVU72
	movsd	(%rax), %xmm0
.LBE114:
	.loc 1 106 29 view .LVU73
	addl	$1, %ecx
.LVL21:
.LBB115:
	.loc 1 109 47 view .LVU74
	subsd	(%rax,%r8,8), %xmm0
	addq	%r10, %rax
.LVL22:
	.loc 1 109 47 view .LVU75
.LBE115:
	.loc 1 106 5 view .LVU76
	cmpl	%ecx, %edx
.LBB116:
	.loc 1 109 16 view .LVU77
	andpd	%xmm3, %xmm0
	maxsd	%xmm0, %xmm1
.LVL23:
	.loc 1 109 16 view .LVU78
.LBE116:
	.loc 1 106 5 view .LVU79
	jne	.L14
	addsd	%xmm1, %xmm2
.LVL24:
.L13:
	.loc 1 106 5 view .LVU80
.LBE117:
	.loc 1 115 5 is_stmt 1 view .LVU81
.LBE112:
.LBE111:
	.loc 1 327 57 is_stmt 0 view .LVU82
	addl	$1, %esi
.LVL25:
	.loc 1 327 57 view .LVU83
	addq	$1, %r8
	.loc 1 328 36 view .LVU84
	movsd	%xmm2, 8(%rbx)
	.loc 1 327 17 view .LVU85
	cmpl	%esi, %r9d
	jg	.L15
.LVL26:
	.loc 1 327 17 view .LVU86
.LBE118:
	.loc 1 326 17 is_stmt 1 view .LVU87
	.loc 1 327 17 view .LVU88
.LBB119:
	.loc 1 327 22 view .LVU89
	.loc 1 327 22 is_stmt 0 view .LVU90
	addq	$1, %rbp
.LVL27:
	.loc 1 327 22 view .LVU91
	movslq	%r12d, %rax
	.loc 1 327 17 view .LVU92
	cmpq	%rbp, %r14
	jne	.L12
	movq	40(%rsp), %r14
	movl	48(%rsp), %r11d
.LVL28:
.L11:
	.loc 1 327 17 view .LVU93
	addl	$1, 56(%rsp)
.LVL29:
	.loc 1 327 17 view .LVU94
	addq	$16, %rbx
	movl	56(%rsp), %eax
.LVL30:
	.loc 1 327 17 view .LVU95
	cmpl	60(%rsp), %eax
	jl	.L9
	movl	140(%rsp), %eax
.LVL31:
	.loc 1 327 17 view .LVU96
	addl	%eax, 108(%rsp)
	movl	108(%rsp), %edi
	movl	136(%rsp), %ebx
	movq	128(%rsp), %rcx
	leal	200(%rdi), %eax
	cmpl	%ebx, %eax
	cmovg	%ebx, %eax
	addq	%rcx, 112(%rsp)
	cmpl	%edi, %ebx
	movl	%eax, 60(%rsp)
	jg	.L10
.LVL32:
.L5:
	.loc 1 327 17 view .LVU97
.LBE119:
.LBE120:
.LBE108:
.LBE123:
.LBE125:
.LBE127:
	.loc 1 311 9 view .LVU98
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 64
	popq	%rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 56
	popq	%rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL33:
	.p2align 4,,10
.L19:
	.cfi_restore_state
.LBB128:
.LBB126:
.LBB124:
.LBB121:
.LBB105:
	.loc 1 319 21 view .LVU99
	xorl	%eax, %eax
.LVL34:
	.loc 1 319 21 view .LVU100
	jmp	.L22
.LVL35:
	.p2align 4,,10
.L25:
.LBB103:
	.loc 1 320 17 view .LVU101
	movq	%r8, %rax
.LVL36:
.L22:
	.loc 1 321 21 is_stmt 1 view .LVU102
	.loc 1 322 43 is_stmt 0 view .LVU103
	movsd	(%rdx,%rax,8), %xmm0
	leaq	1(%rax), %r8
	.loc 1 320 17 view .LVU104
	cmpq	%rax, %r12
	.loc 1 321 47 view .LVU105
	movsd	%xmm0, (%rcx,%rax,8)
.LVL37:
	.loc 1 320 17 view .LVU106
	jne	.L25
	jmp	.L23
.LVL38:
.L39:
	.loc 1 320 17 view .LVU107
.LBE103:
.LBE105:
.LBE121:
.LBB122:
	.loc 1 325 13 view .LVU108
	testl	%r9d, %r9d
	jg	.L8
	jmp	.L11
.LBE122:
.LBE124:
.LBE126:
.LBE128:
	.cfi_endproc
.LFE5619:
	.seh_endproc
	.p2align 4,,15
	.def	c_n_m.part.1;	.scl	3;	.type	32;	.endef
	.seh_proc	c_n_m.part.1
c_n_m.part.1:
.LVL39:
.LFB5620:
	.loc 1 119 19 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 119 19 is_stmt 0 view .LVU110
	.seh_endprologue
.LVL40:
.LBB131:
.LBB132:
	.loc 1 123 9 view .LVU111
	testl	%edx, %edx
	jle	.L43
	leal	1(%rdx), %r9d
.LBE132:
	.loc 1 122 13 view .LVU112
	movl	$1, %eax
.LBB133:
	.loc 1 123 18 view .LVU113
	movl	$1, %r8d
	addl	$1, %ecx
.LVL41:
	.p2align 4,,10
.L42:
	.loc 1 124 13 is_stmt 1 view .LVU114
	.loc 1 124 29 is_stmt 0 view .LVU115
	movl	%ecx, %edx
	subl	%r8d, %edx
	imull	%edx, %eax
.LVL42:
	.loc 1 124 20 view .LVU116
	cltd
	idivl	%r8d
.LVL43:
	.loc 1 123 34 view .LVU117
	addl	$1, %r8d
.LVL44:
	.loc 1 123 9 view .LVU118
	cmpl	%r9d, %r8d
	jne	.L42
.LBE133:
	.loc 1 126 9 is_stmt 1 view .LVU119
	.loc 1 126 17 is_stmt 0 view .LVU120
	movl	%eax, __c_n_m(%rip)
	.loc 1 127 9 is_stmt 1 view .LVU121
.LBE131:
	.loc 1 130 1 is_stmt 0 view .LVU122
	ret
.LVL45:
	.p2align 4,,10
.L43:
.LBB134:
	.loc 1 122 13 view .LVU123
	movl	$1, %eax
	.loc 1 126 9 is_stmt 1 view .LVU124
	.loc 1 126 17 is_stmt 0 view .LVU125
	movl	%eax, __c_n_m(%rip)
	.loc 1 127 9 is_stmt 1 view .LVU126
.LBE134:
	.loc 1 130 1 is_stmt 0 view .LVU127
	ret
	.cfi_endproc
.LFE5620:
	.seh_endproc
	.p2align 4,,15
	.def	gettimeofday.constprop.3;	.scl	3;	.type	32;	.endef
	.seh_proc	gettimeofday.constprop.3
gettimeofday.constprop.3:
.LVL46:
.LFB5621:
	.loc 1 11 5 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 11 5 is_stmt 0 view .LVU129
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$96, %rsp
	.seh_stackalloc	96
	.cfi_def_cfa_offset 112
	.seh_endprologue
.LVL47:
	.loc 1 12 5 is_stmt 1 view .LVU130
	.loc 1 13 5 view .LVU131
	.loc 1 14 5 view .LVU132
	.loc 1 15 5 view .LVU133
	.loc 1 11 5 is_stmt 0 view .LVU134
	movq	%rcx, %rbx
	.loc 1 15 5 view .LVU135
	leaq	32(%rsp), %rcx
.LVL48:
	.loc 1 15 5 view .LVU136
	call	*__imp_GetLocalTime(%rip)
.LVL49:
	.loc 1 16 5 is_stmt 1 view .LVU137
	.loc 1 16 21 is_stmt 0 view .LVU138
	movzwl	32(%rsp), %eax
.LBB135:
.LBB136:
	.file 2 "D:/mingw64/x86_64-w64-mingw32/include/time.h"
	.loc 2 240 62 view .LVU139
	leaq	48(%rsp), %rcx
.LBE136:
.LBE135:
	.loc 1 22 17 view .LVU140
	movl	$-1, 80(%rsp)
	.loc 1 16 28 view .LVU141
	subl	$1900, %eax
	movl	%eax, 68(%rsp)
	.loc 1 17 5 is_stmt 1 view .LVU142
	.loc 1 17 20 is_stmt 0 view .LVU143
	movzwl	34(%rsp), %eax
	.loc 1 17 28 view .LVU144
	subl	$1, %eax
	movl	%eax, 64(%rsp)
	.loc 1 18 5 is_stmt 1 view .LVU145
	.loc 1 18 21 is_stmt 0 view .LVU146
	movzwl	38(%rsp), %eax
	movl	%eax, 60(%rsp)
	.loc 1 19 5 is_stmt 1 view .LVU147
	.loc 1 19 21 is_stmt 0 view .LVU148
	movzwl	40(%rsp), %eax
	movl	%eax, 56(%rsp)
	.loc 1 20 5 is_stmt 1 view .LVU149
	.loc 1 20 20 is_stmt 0 view .LVU150
	movzwl	42(%rsp), %eax
	movl	%eax, 52(%rsp)
	.loc 1 21 5 is_stmt 1 view .LVU151
	.loc 1 21 20 is_stmt 0 view .LVU152
	movzwl	44(%rsp), %eax
	movl	%eax, 48(%rsp)
	.loc 1 22 5 is_stmt 1 view .LVU153
	.loc 1 23 5 view .LVU154
.LVL50:
.LBB138:
.LBI135:
	.loc 2 240 30 view .LVU155
.LBB137:
	.loc 2 240 55 view .LVU156
	.loc 2 240 62 is_stmt 0 view .LVU157
	call	*__imp__mktime64(%rip)
.LVL51:
	.loc 2 240 62 view .LVU158
.LBE137:
.LBE138:
	.loc 1 24 5 is_stmt 1 view .LVU159
	.loc 1 24 16 is_stmt 0 view .LVU160
	movl	%eax, (%rbx)
	.loc 1 25 5 is_stmt 1 view .LVU161
	.loc 1 25 22 is_stmt 0 view .LVU162
	movzwl	46(%rsp), %eax
.LVL52:
	.loc 1 25 37 view .LVU163
	imull	$1000, %eax, %eax
	.loc 1 25 17 view .LVU164
	movl	%eax, 4(%rbx)
	.loc 1 26 5 is_stmt 1 view .LVU165
	.loc 1 27 1 is_stmt 0 view .LVU166
	xorl	%eax, %eax
	addq	$96, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL53:
	.loc 1 27 1 view .LVU167
	ret
	.cfi_endproc
.LFE5621:
	.seh_endproc
	.p2align 4,,15
	.globl	gettimeofday
	.def	gettimeofday;	.scl	2;	.type	32;	.endef
	.seh_proc	gettimeofday
gettimeofday:
.LVL54:
.LFB5601:
	.loc 1 11 49 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 11 49 is_stmt 0 view .LVU169
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$96, %rsp
	.seh_stackalloc	96
	.cfi_def_cfa_offset 112
	.seh_endprologue
	.loc 1 12 5 is_stmt 1 view .LVU170
	.loc 1 13 5 view .LVU171
	.loc 1 14 5 view .LVU172
	.loc 1 15 5 view .LVU173
	.loc 1 11 49 is_stmt 0 view .LVU174
	movq	%rcx, %rbx
	.loc 1 15 5 view .LVU175
	leaq	32(%rsp), %rcx
.LVL55:
	.loc 1 15 5 view .LVU176
	call	*__imp_GetLocalTime(%rip)
.LVL56:
	.loc 1 16 5 is_stmt 1 view .LVU177
	.loc 1 16 21 is_stmt 0 view .LVU178
	movzwl	32(%rsp), %eax
.LBB139:
.LBB140:
	.loc 2 240 62 view .LVU179
	leaq	48(%rsp), %rcx
.LBE140:
.LBE139:
	.loc 1 22 17 view .LVU180
	movl	$-1, 80(%rsp)
	.loc 1 16 28 view .LVU181
	subl	$1900, %eax
	movl	%eax, 68(%rsp)
	.loc 1 17 5 is_stmt 1 view .LVU182
	.loc 1 17 20 is_stmt 0 view .LVU183
	movzwl	34(%rsp), %eax
	.loc 1 17 28 view .LVU184
	subl	$1, %eax
	movl	%eax, 64(%rsp)
	.loc 1 18 5 is_stmt 1 view .LVU185
	.loc 1 18 21 is_stmt 0 view .LVU186
	movzwl	38(%rsp), %eax
	movl	%eax, 60(%rsp)
	.loc 1 19 5 is_stmt 1 view .LVU187
	.loc 1 19 21 is_stmt 0 view .LVU188
	movzwl	40(%rsp), %eax
	movl	%eax, 56(%rsp)
	.loc 1 20 5 is_stmt 1 view .LVU189
	.loc 1 20 20 is_stmt 0 view .LVU190
	movzwl	42(%rsp), %eax
	movl	%eax, 52(%rsp)
	.loc 1 21 5 is_stmt 1 view .LVU191
	.loc 1 21 20 is_stmt 0 view .LVU192
	movzwl	44(%rsp), %eax
	movl	%eax, 48(%rsp)
	.loc 1 22 5 is_stmt 1 view .LVU193
	.loc 1 23 5 view .LVU194
.LVL57:
.LBB142:
.LBI139:
	.loc 2 240 30 view .LVU195
.LBB141:
	.loc 2 240 55 view .LVU196
	.loc 2 240 62 is_stmt 0 view .LVU197
	call	*__imp__mktime64(%rip)
.LVL58:
	.loc 2 240 62 view .LVU198
.LBE141:
.LBE142:
	.loc 1 24 5 is_stmt 1 view .LVU199
	.loc 1 24 16 is_stmt 0 view .LVU200
	movl	%eax, (%rbx)
	.loc 1 25 5 is_stmt 1 view .LVU201
	.loc 1 25 22 is_stmt 0 view .LVU202
	movzwl	46(%rsp), %eax
.LVL59:
	.loc 1 25 37 view .LVU203
	imull	$1000, %eax, %eax
	.loc 1 25 17 view .LVU204
	movl	%eax, 4(%rbx)
	.loc 1 26 5 is_stmt 1 view .LVU205
	.loc 1 27 1 is_stmt 0 view .LVU206
	xorl	%eax, %eax
	addq	$96, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL60:
	.loc 1 27 1 view .LVU207
	ret
	.cfi_endproc
.LFE5601:
	.seh_endproc
	.p2align 4,,15
	.globl	get_cpu_core_num
	.def	get_cpu_core_num;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cpu_core_num
get_cpu_core_num:
.LFB5602:
	.loc 1 33 24 is_stmt 1 view -0
	.cfi_startproc
	subq	$88, %rsp
	.seh_stackalloc	88
	.cfi_def_cfa_offset 96
	.seh_endprologue
	.loc 1 34 5 view .LVU209
	.loc 1 35 5 view .LVU210
	leaq	32(%rsp), %rcx
	call	*__imp_GetSystemInfo(%rip)
.LVL61:
	.loc 1 36 5 view .LVU211
	.loc 1 37 1 is_stmt 0 view .LVU212
	movl	64(%rsp), %eax
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5602:
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "uniformvector-2dim-5h.txt\0"
.LC4:
	.ascii "NOT DEBUG MODE!\0"
.LC5:
	.ascii "Usage: ./pivot <filename>\0"
.LC6:
	.ascii "r\0"
.LC7:
	.ascii "%s file not found.\12\0"
.LC8:
	.ascii "%d\0"
	.align 8
.LC9:
	.ascii "dim = %d, point number = %d, pivot numver = %d\12\0"
.LC10:
	.ascii "%lf\0"
.LC11:
	.ascii "points read finished.\0"
	.align 8
.LC12:
	.ascii "Euclidean distance calculated.\0"
.LC14:
	.ascii "\12\12qsort() time: %ld ms\12\0"
.LC15:
	.ascii "time cost: %ld ms \12\0"
	.align 8
.LC16:
	.ascii "first 10 elements in the object array:\0"
.LC17:
	.ascii "cost = %lf, values = \0"
.LC18:
	.ascii "%d \0"
	.align 8
.LC19:
	.ascii "last 10 elements in the object array:\0"
.LC20:
	.ascii "w\0"
.LC21:
	.ascii "object.txt\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LVL62:
.LFB5618:
	.loc 1 256 34 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 256 34 is_stmt 0 view .LVU214
	pushq	%r15
	.seh_pushreg	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.seh_pushreg	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.seh_pushreg	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.seh_pushreg	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rdi
	.seh_pushreg	%rdi
	.cfi_def_cfa_offset 56
	.cfi_offset 5, -56
	pushq	%rsi
	.seh_pushreg	%rsi
	.cfi_def_cfa_offset 64
	.cfi_offset 4, -64
	pushq	%rbx
	.seh_pushreg	%rbx
	.cfi_def_cfa_offset 72
	.cfi_offset 3, -72
	subq	$88, %rsp
	.seh_stackalloc	88
	.cfi_def_cfa_offset 160
	.seh_endprologue
	.loc 1 256 34 view .LVU215
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	call	__main
.LVL63:
	.loc 1 257 5 is_stmt 1 view .LVU216
	movl	$6, %ecx
	call	omp_set_num_threads
.LVL64:
	.loc 1 258 5 view .LVU217
	.loc 1 259 5 view .LVU218
.LBB213:
	.loc 1 260 9 view .LVU219
	leaq	.LC4(%rip), %rcx
	call	puts
.LVL65:
	.loc 1 261 9 view .LVU220
	.loc 1 262 9 view .LVU221
	.loc 1 262 12 is_stmt 0 view .LVU222
	cmpl	$2, %ebx
	je	.L158
	.loc 1 264 16 is_stmt 1 view .LVU223
	.loc 1 261 15 is_stmt 0 view .LVU224
	leaq	.LC2(%rip), %rsi
.LVL66:
	.loc 1 264 19 view .LVU225
	subl	$1, %ebx
.LVL67:
	.loc 1 264 19 view .LVU226
	jne	.L159
.LVL68:
.L50:
	.loc 1 268 9 is_stmt 1 view .LVU227
	.loc 1 271 9 view .LVU228
	.loc 1 272 9 view .LVU229
	.loc 1 272 22 is_stmt 0 view .LVU230
	leaq	.LC6(%rip), %rdx
	movq	%rsi, %rcx
	call	fopen
.LVL69:
	.loc 1 273 12 view .LVU231
	testq	%rax, %rax
	.loc 1 272 22 view .LVU232
	movq	%rax, %rbp
.LVL70:
	.loc 1 273 9 is_stmt 1 view .LVU233
	.loc 1 273 12 is_stmt 0 view .LVU234
	je	.L160
	.loc 1 277 9 is_stmt 1 view .LVU235
	leaq	dim(%rip), %r8
	movq	%rax, %rcx
.LBB214:
	.loc 1 288 18 is_stmt 0 view .LVU236
	xorl	%edi, %edi
.LBE214:
	.loc 1 277 9 view .LVU237
	leaq	.LC8(%rip), %rdx
	call	fscanf
.LVL71:
	.loc 1 278 9 is_stmt 1 view .LVU238
	leaq	n(%rip), %r8
	movq	%rbp, %rcx
	leaq	.LC8(%rip), %rdx
	call	fscanf
.LVL72:
	.loc 1 279 9 view .LVU239
	leaq	nums_p(%rip), %r8
	movq	%rbp, %rcx
	leaq	.LC8(%rip), %rdx
	call	fscanf
.LVL73:
	.loc 1 280 9 view .LVU240
	.loc 1 280 11 is_stmt 0 view .LVU241
	movl	nums_p(%rip), %r9d
	.loc 1 281 9 view .LVU242
	leaq	.LC9(%rip), %rcx
	movl	n(%rip), %r8d
.LBB217:
.LBB215:
	.loc 1 290 17 view .LVU243
	leaq	.LC10(%rip), %r12
.LBE215:
.LBE217:
	.loc 1 281 9 view .LVU244
	movl	dim(%rip), %edx
	.loc 1 280 11 view .LVU245
	movl	%r9d, m(%rip)
	.loc 1 281 9 is_stmt 1 view .LVU246
	call	printf
.LVL74:
	.loc 1 285 9 view .LVU247
	.loc 1 285 54 is_stmt 0 view .LVU248
	movslq	n(%rip), %rsi
.LVL75:
	.loc 1 285 54 view .LVU249
	movslq	dim(%rip), %rcx
	movq	%rsi, %r13
	movq	%rcx, %rbx
	imulq	%rsi, %rcx
	.loc 1 285 28 view .LVU250
	salq	$3, %rcx
	call	malloc
.LVL76:
	.loc 1 285 16 view .LVU251
	movq	%rax, points(%rip)
	.loc 1 286 9 is_stmt 1 view .LVU252
	.loc 1 286 76 is_stmt 0 view .LVU253
	movslq	m(%rip), %rax
	imulq	%rsi, %rax
	.loc 1 286 35 view .LVU254
	leaq	(%rax,%rax,2), %rcx
	salq	$4, %rcx
	call	malloc
.LVL77:
.LBB218:
	.loc 1 288 9 view .LVU255
	testl	%esi, %esi
.LBE218:
	.loc 1 286 23 view .LVU256
	movq	%rax, cache_eu_dist(%rip)
	.loc 1 288 9 is_stmt 1 view .LVU257
.LBB219:
	.loc 1 288 14 view .LVU258
.LVL78:
	.loc 1 288 9 is_stmt 0 view .LVU259
	jle	.L54
.LVL79:
	.p2align 4,,10
.L53:
.LBB216:
	.loc 1 289 22 view .LVU260
	xorl	%esi, %esi
	.loc 1 289 13 view .LVU261
	testl	%ebx, %ebx
	jle	.L56
.LVL80:
	.p2align 4,,10
.L55:
	.loc 1 290 17 is_stmt 1 discriminator 3 view .LVU262
	.loc 1 290 47 is_stmt 0 discriminator 3 view .LVU263
	imull	%edi, %ebx
	.loc 1 290 17 discriminator 3 view .LVU264
	movq	points(%rip), %rax
	movq	%r12, %rdx
	movq	%rbp, %rcx
	.loc 1 290 53 discriminator 3 view .LVU265
	addl	%esi, %ebx
	.loc 1 289 39 discriminator 3 view .LVU266
	addl	$1, %esi
.LVL81:
	.loc 1 290 53 discriminator 3 view .LVU267
	movslq	%ebx, %rbx
	.loc 1 290 17 discriminator 3 view .LVU268
	leaq	(%rax,%rbx,8), %r8
	call	fscanf
.LVL82:
	.loc 1 289 31 discriminator 3 view .LVU269
	movl	dim(%rip), %ebx
	.loc 1 289 13 discriminator 3 view .LVU270
	cmpl	%esi, %ebx
	jg	.L55
	movl	n(%rip), %r13d
.LVL83:
.L56:
	.loc 1 289 13 discriminator 3 view .LVU271
.LBE216:
	.loc 1 288 33 discriminator 2 view .LVU272
	addl	$1, %edi
.LVL84:
	.loc 1 288 9 discriminator 2 view .LVU273
	cmpl	%r13d, %edi
	jl	.L53
.LVL85:
.L54:
	.loc 1 288 9 discriminator 2 view .LVU274
.LBE219:
	.loc 1 293 9 is_stmt 1 view .LVU275
	leaq	.LC11(%rip), %rcx
	call	puts
.LVL86:
	.loc 1 294 9 view .LVU276
	movq	%rbp, %rcx
	call	fclose
.LVL87:
	.loc 1 295 9 view .LVU277
	leaq	56(%rsp), %rcx
	call	gettimeofday.constprop.3
.LVL88:
	.loc 1 296 9 view .LVU278
	.loc 1 296 66 is_stmt 0 view .LVU279
	movslq	n(%rip), %rax
	movq	%rax, %rbx
	imulq	%rax, %rax
	.loc 1 296 40 view .LVU280
	leaq	0(,%rax,8), %rcx
	call	malloc
.LVL89:
	.loc 1 297 62 view .LVU281
	movl	m(%rip), %r12d
	.loc 1 296 40 view .LVU282
	movq	%rax, %rsi
	.loc 1 296 28 view .LVU283
	movq	%rax, euclidean_distance(%rip)
	.loc 1 297 9 is_stmt 1 view .LVU284
.LVL90:
.LBB220:
.LBI220:
	.loc 1 119 19 view .LVU285
.LBB221:
	.loc 1 121 5 view .LVU286
	.loc 1 121 17 is_stmt 0 view .LVU287
	movl	__c_n_m(%rip), %eax
	.loc 1 121 8 view .LVU288
	testl	%eax, %eax
	jne	.L57
	movl	%r12d, %edx
	movl	%ebx, %ecx
	call	c_n_m.part.1
.LVL91:
.L57:
	.loc 1 121 8 view .LVU289
.LBE221:
.LBE220:
	.loc 1 297 62 view .LVU290
	movslq	%eax, %rcx
.LBB222:
	.loc 1 299 39 view .LVU291
	movslq	%r12d, %rbp
.LVL92:
	.loc 1 298 18 view .LVU292
	xorl	%r14d, %r14d
.LBE222:
	.loc 1 297 33 view .LVU293
	salq	$4, %rcx
.LBB237:
	.loc 1 299 39 view .LVU294
	salq	$2, %rbp
.LBE237:
	.loc 1 297 33 view .LVU295
	call	malloc
.LVL93:
	movl	n(%rip), %ecx
	leal	1(%r12), %edi
	.loc 1 297 16 view .LVU296
	movq	%rax, object(%rip)
	.loc 1 298 9 is_stmt 1 view .LVU297
.LBB238:
	.loc 1 298 14 view .LVU298
.LVL94:
	.loc 1 298 14 is_stmt 0 view .LVU299
	movq	%rax, %r13
	movl	%ecx, 32(%rsp)
	leal	1(%rcx), %ebx
	.loc 1 298 9 view .LVU300
	jmp	.L58
.LVL95:
	.p2align 4,,10
.L59:
	.loc 1 298 9 view .LVU301
	cmpl	%eax, %r14d
	jge	.L161
.L62:
	.loc 1 299 13 is_stmt 1 discriminator 3 view .LVU302
	.loc 1 299 39 is_stmt 0 discriminator 3 view .LVU303
	movq	%rbp, %rcx
	.loc 1 298 43 discriminator 3 view .LVU304
	addl	$1, %r14d
.LVL96:
	.loc 1 298 43 discriminator 3 view .LVU305
	addq	$16, %r13
	.loc 1 299 39 discriminator 3 view .LVU306
	call	malloc
.LVL97:
	.loc 1 300 28 discriminator 3 view .LVU307
	movq	$0x000000000, -8(%r13)
	.loc 1 299 30 discriminator 3 view .LVU308
	movq	%rax, -16(%r13)
	.loc 1 300 13 is_stmt 1 discriminator 3 view .LVU309
.LVL98:
.L58:
.LBB223:
.LBI223:
	.loc 1 119 19 discriminator 1 view .LVU310
.LBB224:
	.loc 1 121 5 discriminator 1 view .LVU311
	.loc 1 121 17 is_stmt 0 discriminator 1 view .LVU312
	movl	__c_n_m(%rip), %eax
	.loc 1 121 8 discriminator 1 view .LVU313
	testl	%eax, %eax
	jne	.L59
.LVL99:
.LBB225:
.LBB226:
.LBB227:
	.loc 1 123 9 view .LVU314
	testl	%r12d, %r12d
.LBE227:
	.loc 1 122 13 view .LVU315
	movl	$1, %eax
.LBB228:
	.loc 1 123 9 view .LVU316
	jle	.L60
	.loc 1 123 18 view .LVU317
	movl	$1, %ecx
.LVL100:
	.p2align 4,,10
.L61:
	.loc 1 124 13 is_stmt 1 view .LVU318
	.loc 1 124 29 is_stmt 0 view .LVU319
	movl	%ebx, %edx
	subl	%ecx, %edx
	imull	%edx, %eax
.LVL101:
	.loc 1 124 20 view .LVU320
	cltd
	idivl	%ecx
.LVL102:
	.loc 1 123 34 view .LVU321
	addl	$1, %ecx
.LVL103:
	.loc 1 123 9 view .LVU322
	cmpl	%edi, %ecx
	jne	.L61
.LVL104:
.L60:
	.loc 1 123 9 view .LVU323
.LBE228:
	.loc 1 126 9 is_stmt 1 view .LVU324
.LBE226:
.LBE225:
.LBE224:
.LBE223:
	.loc 1 298 9 is_stmt 0 view .LVU325
	cmpl	%eax, %r14d
.LBB235:
.LBB233:
.LBB231:
.LBB229:
	.loc 1 126 17 view .LVU326
	movl	%eax, __c_n_m(%rip)
	.loc 1 127 9 is_stmt 1 view .LVU327
.LVL105:
	.loc 1 127 9 is_stmt 0 view .LVU328
.LBE229:
.LBE231:
.LBE233:
.LBE235:
	.loc 1 298 9 view .LVU329
	jl	.L62
.L161:
.LVL106:
	.loc 1 298 9 view .LVU330
.LBE238:
.LBB239:
.LBB240:
	.loc 1 91 5 view .LVU331
	movl	32(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L63
.LBB241:
.LBB242:
.LBB243:
.LBB244:
	.loc 1 78 23 view .LVU332
	movl	dim(%rip), %r9d
	movslq	%ecx, %rax
.LBB245:
.LBB246:
.LBB247:
	.loc 1 72 18 view .LVU333
	xorl	%r12d, %r12d
.LBE247:
.LBE246:
.LBE245:
.LBE244:
.LBE243:
.LBE242:
.LBE241:
	.loc 1 91 14 view .LVU334
	xorl	%edi, %edi
.LBB304:
.LBB301:
.LBB298:
.LBB294:
.LBB288:
.LBB258:
.LBB248:
	.loc 1 72 18 view .LVU335
	movq	points(%rip), %r11
	leal	-1(%rcx), %r13d
	salq	$3, %rax
.LBE248:
.LBE258:
.LBE288:
	.loc 1 78 5 view .LVU336
	pxor	%xmm3, %xmm3
	movq	%rax, 40(%rsp)
	movq	%rsi, %rax
	leal	-1(%r9), %r15d
	movl	%r9d, %ebp
	movl	%r9d, %r14d
.LVL107:
	.loc 1 78 5 view .LVU337
	shrl	%ebp
	andl	$-2, %r14d
	salq	$4, %rbp
.LVL108:
	.p2align 4,,10
.L64:
	.loc 1 78 5 view .LVU338
	movslq	%r12d, %rdx
.LBE294:
.LBE298:
.LBE301:
.LBE304:
.LBE240:
.LBE239:
.LBB309:
.LBB236:
.LBB234:
.LBB232:
.LBB230:
	.loc 1 122 13 view .LVU339
	xorl	%r8d, %r8d
	leaq	(%r11,%rdx,8), %r10
	xorl	%edx, %edx
.LVL109:
	.loc 1 122 13 view .LVU340
.LBE230:
.LBE232:
.LBE234:
.LBE236:
.LBE309:
.LBB310:
.LBB307:
.LBB305:
	.loc 1 93 13 is_stmt 1 view .LVU341
	.loc 1 93 16 is_stmt 0 view .LVU342
	cmpl	%edx, %edi
	je	.L162
	.p2align 4,,10
.L65:
	.loc 1 96 17 is_stmt 1 view .LVU343
.LVL110:
.LBB302:
.LBI242:
	.loc 1 76 22 view .LVU344
.LBB299:
	.loc 1 77 5 view .LVU345
	.loc 1 78 5 view .LVU346
.LBB295:
	.loc 1 78 10 view .LVU347
	.loc 1 78 5 is_stmt 0 view .LVU348
	testl	%r9d, %r9d
	jle	.L125
	cmpl	$1, %r15d
	jbe	.L126
	movslq	%r8d, %rcx
.LBB289:
.LBB259:
.LBB260:
	.loc 1 72 22 view .LVU349
	pxor	%xmm1, %xmm1
	leaq	(%r11,%rcx,8), %rbx
	xorl	%ecx, %ecx
.LVL111:
	.p2align 4,,10
.L69:
	.loc 1 72 22 view .LVU350
.LBE260:
.LBE259:
	.loc 1 79 9 is_stmt 1 view .LVU351
.LBB270:
.LBI246:
	.loc 1 70 22 view .LVU352
.LBB249:
	.loc 1 72 5 view .LVU353
	.loc 1 72 5 is_stmt 0 view .LVU354
.LBE249:
.LBE270:
.LBB271:
.LBI259:
	.loc 1 70 22 is_stmt 1 view .LVU355
.LBB261:
	.loc 1 72 5 view .LVU356
	.loc 1 72 5 is_stmt 0 view .LVU357
.LBE261:
.LBE271:
.LBB272:
.LBB250:
	.loc 1 72 18 view .LVU358
	movq	(%r10,%rcx), %xmm0
.LBE250:
.LBE272:
.LBB273:
.LBB262:
	movq	(%rbx,%rcx), %xmm2
.LBE262:
.LBE273:
.LBB274:
.LBB251:
	movhpd	8(%r10,%rcx), %xmm0
.LBE251:
.LBE274:
.LBB275:
.LBB263:
	movhpd	8(%rbx,%rcx), %xmm2
	addq	$16, %rcx
.LBE263:
.LBE275:
	.loc 1 79 16 view .LVU359
	subpd	%xmm2, %xmm0
.LVL112:
	.loc 1 81 9 is_stmt 1 view .LVU360
	cmpq	%rcx, %rbp
	.loc 1 81 21 is_stmt 0 view .LVU361
	mulpd	%xmm0, %xmm0
	.loc 1 81 13 view .LVU362
	addpd	%xmm0, %xmm1
	.loc 1 81 13 view .LVU363
	jne	.L69
	cmpl	%r14d, %r9d
	haddpd	%xmm1, %xmm1
.LBE289:
	.loc 1 78 14 view .LVU364
	movl	%r14d, %ecx
	je	.L70
.L68:
.LVL113:
.LBB290:
	.loc 1 79 9 is_stmt 1 view .LVU365
.LBB276:
	.loc 1 70 22 view .LVU366
.LBB252:
	.loc 1 72 5 view .LVU367
	.loc 1 72 5 is_stmt 0 view .LVU368
.LBE252:
.LBE276:
.LBB277:
	.loc 1 70 22 is_stmt 1 view .LVU369
.LBB264:
	.loc 1 72 5 view .LVU370
	.loc 1 72 5 is_stmt 0 view .LVU371
.LBE264:
.LBE277:
.LBB278:
.LBB253:
	.loc 1 72 28 view .LVU372
	leal	(%r12,%rcx), %esi
.LBE253:
.LBE278:
.LBB279:
.LBB265:
	leal	(%r8,%rcx), %ebx
.LBE265:
.LBE279:
.LBB280:
.LBB254:
	movslq	%esi, %rsi
.LBE254:
.LBE280:
.LBE290:
	.loc 1 78 31 view .LVU373
	addl	$1, %ecx
.LVL114:
.LBB291:
.LBB281:
.LBB266:
	.loc 1 72 28 view .LVU374
	movslq	%ebx, %rbx
.LBE266:
.LBE281:
	.loc 1 79 16 view .LVU375
	movsd	(%r11,%rsi,8), %xmm0
.LBE291:
	.loc 1 78 5 view .LVU376
	cmpl	%ecx, %r9d
.LBB292:
	.loc 1 79 16 view .LVU377
	subsd	(%r11,%rbx,8), %xmm0
.LVL115:
	.loc 1 81 9 is_stmt 1 view .LVU378
	.loc 1 81 21 is_stmt 0 view .LVU379
	mulsd	%xmm0, %xmm0
.LVL116:
	.loc 1 81 13 view .LVU380
	addsd	%xmm0, %xmm1
.LVL117:
	.loc 1 81 13 view .LVU381
.LBE292:
	.loc 1 78 5 view .LVU382
	jle	.L70
.LBB293:
	.loc 1 79 9 is_stmt 1 view .LVU383
.LVL118:
.LBB282:
	.loc 1 70 22 view .LVU384
.LBB255:
	.loc 1 72 5 view .LVU385
	.loc 1 72 5 is_stmt 0 view .LVU386
.LBE255:
.LBE282:
.LBB283:
	.loc 1 70 22 is_stmt 1 view .LVU387
.LBB267:
	.loc 1 72 5 view .LVU388
	.loc 1 72 5 is_stmt 0 view .LVU389
.LBE267:
.LBE283:
.LBB284:
.LBB256:
	.loc 1 72 28 view .LVU390
	leal	(%r12,%rcx), %ebx
.LVL119:
	.loc 1 72 28 view .LVU391
.LBE256:
.LBE284:
.LBB285:
.LBB268:
	addl	%r8d, %ecx
.LVL120:
	.loc 1 72 28 view .LVU392
.LBE268:
.LBE285:
.LBB286:
.LBB257:
	movslq	%ebx, %rbx
.LBE257:
.LBE286:
.LBB287:
.LBB269:
	movslq	%ecx, %rcx
.LBE269:
.LBE287:
	.loc 1 79 16 view .LVU393
	movsd	(%r11,%rbx,8), %xmm0
	subsd	(%r11,%rcx,8), %xmm0
.LVL121:
	.loc 1 81 9 is_stmt 1 view .LVU394
	.loc 1 81 21 is_stmt 0 view .LVU395
	mulsd	%xmm0, %xmm0
.LVL122:
	.loc 1 81 13 view .LVU396
	addsd	%xmm0, %xmm1
.LVL123:
.L70:
	.loc 1 81 13 view .LVU397
	sqrtsd	%xmm1, %xmm1
.L67:
.LBE293:
.LBE295:
	.loc 1 83 5 is_stmt 1 view .LVU398
.LVL124:
	.loc 1 83 5 is_stmt 0 view .LVU399
.LBE299:
.LBE302:
	.loc 1 96 47 view .LVU400
	movsd	%xmm1, (%rax,%rdx,8)
.LVL125:
	.loc 1 96 47 view .LVU401
	leaq	1(%rdx), %rcx
	addl	%r9d, %r8d
	.loc 1 92 9 view .LVU402
	cmpq	%rdx, %r13
	je	.L163
.LVL126:
.L127:
	.loc 1 92 9 view .LVU403
	movq	%rcx, %rdx
.LVL127:
	.loc 1 93 13 is_stmt 1 view .LVU404
	.loc 1 93 16 is_stmt 0 view .LVU405
	cmpl	%edx, %edi
	jne	.L65
.L162:
	.loc 1 94 17 is_stmt 1 view .LVU406
	.loc 1 94 47 is_stmt 0 view .LVU407
	movq	$0x000000000, (%rax,%rdx,8)
.LVL128:
	.loc 1 94 47 view .LVU408
	leaq	1(%rdx), %rcx
	addl	%r9d, %r8d
	.loc 1 92 9 view .LVU409
	cmpq	%rdx, %r13
	jne	.L127
.LVL129:
.L163:
	.loc 1 92 9 view .LVU410
.LBE305:
	.loc 1 91 29 view .LVU411
	addl	$1, %edi
.LVL130:
	.loc 1 91 29 view .LVU412
	addq	40(%rsp), %rax
	addl	%r9d, %r12d
	.loc 1 91 5 view .LVU413
	cmpl	32(%rsp), %edi
	jne	.L64
.LVL131:
.L63:
	.loc 1 91 5 view .LVU414
.LBE307:
.LBE310:
	.loc 1 305 9 is_stmt 1 view .LVU415
	leaq	.LC12(%rip), %rcx
	call	puts
.LVL132:
	.loc 1 306 9 view .LVU416
.LBB311:
.LBI311:
	.loc 1 151 20 view .LVU417
.LBB312:
	.loc 1 153 5 view .LVU418
	.loc 1 153 26 is_stmt 0 view .LVU419
	movslq	m(%rip), %rsi
	movq	%rsi, %r12
	salq	$2, %rsi
	leal	-1(%r12), %ebx
	movq	%rsi, %rcx
	call	malloc
.LVL133:
.LBB313:
	.loc 1 154 5 view .LVU420
	testl	%r12d, %r12d
.LBE313:
	.loc 1 153 26 view .LVU421
	movq	%rax, %r13
.LVL134:
	.loc 1 154 5 is_stmt 1 view .LVU422
.LBB314:
	.loc 1 154 10 view .LVU423
	.loc 1 154 5 is_stmt 0 view .LVU424
	jle	.L78
	cmpl	$2, %ebx
	jbe	.L128
	movl	%r12d, %edx
	movdqa	.LC3(%rip), %xmm0
	shrl	$2, %edx
	movdqa	.LC13(%rip), %xmm1
	salq	$4, %rdx
	addq	%rax, %rdx
.LVL135:
	.p2align 4,,10
.L76:
	.loc 1 155 9 is_stmt 1 view .LVU425
	.loc 1 155 19 is_stmt 0 view .LVU426
	movups	%xmm0, (%rax)
	.loc 1 155 19 view .LVU427
	addq	$16, %rax
	paddd	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L76
	movl	%r12d, %eax
	andl	$-4, %eax
	cmpl	%eax, %r12d
	je	.L78
.L75:
.LVL136:
	.loc 1 155 9 is_stmt 1 view .LVU428
	.loc 1 155 15 is_stmt 0 view .LVU429
	movslq	%eax, %rdx
	.loc 1 155 19 view .LVU430
	movl	%eax, 0(%r13,%rdx,4)
	.loc 1 154 29 view .LVU431
	leal	1(%rax), %edx
.LVL137:
	.loc 1 154 5 view .LVU432
	cmpl	%edx, %r12d
	jle	.L78
	.loc 1 155 9 is_stmt 1 view .LVU433
	.loc 1 154 29 is_stmt 0 view .LVU434
	addl	$2, %eax
	.loc 1 155 15 view .LVU435
	movslq	%edx, %rcx
	.loc 1 154 5 view .LVU436
	cmpl	%eax, %r12d
	.loc 1 155 19 view .LVU437
	movl	%edx, 0(%r13,%rcx,4)
.LVL138:
	.loc 1 154 5 view .LVU438
	jle	.L78
	.loc 1 155 9 is_stmt 1 view .LVU439
	.loc 1 155 15 is_stmt 0 view .LVU440
	movslq	%eax, %rdx
	.loc 1 155 19 view .LVU441
	movl	%eax, 0(%r13,%rdx,4)
.L78:
	.loc 1 155 19 view .LVU442
	leaq	-4(%r13,%rsi), %rsi
.LBE314:
.LBB315:
	.loc 1 164 32 view .LVU443
	movslq	%ebx, %rax
	movl	n(%rip), %ecx
.LVL139:
	.loc 1 164 32 view .LVU444
	salq	$2, %rax
.LBE315:
	.loc 1 158 11 view .LVU445
	cmpl	%ecx, (%rsi)
.LBB322:
.LBB316:
	.loc 1 160 19 view .LVU446
	movq	object(%rip), %r14
.LBE316:
	.loc 1 164 32 view .LVU447
	leaq	0(%r13,%rax), %rdi
.LBE322:
	.loc 1 158 11 view .LVU448
	jge	.L73
	leaq	-4(%r13,%rax), %rbp
.LBB323:
.LBB317:
	.loc 1 160 40 view .LVU449
	movl	%ebx, %edx
	leaq	4(,%rdx,4), %rdx
	movq	%rdx, 32(%rsp)
.LVL140:
	.p2align 4,,10
.L74:
	.loc 1 159 9 view .LVU450
	testl	%r12d, %r12d
	jle	.L88
	movq	(%r14), %rcx
	movq	%r13, %rdx
	movq	32(%rsp), %r8
	call	memcpy
.LVL141:
	movl	n(%rip), %ecx
.L88:
	.loc 1 159 9 view .LVU451
.LBE317:
	.loc 1 162 9 is_stmt 1 view .LVU452
	.loc 1 163 9 view .LVU453
.LVL142:
	.loc 1 164 9 view .LVU454
	.loc 1 164 15 is_stmt 0 view .LVU455
	testl	%ebx, %ebx
	je	.L80
	.loc 1 164 32 view .LVU456
	movl	(%rdi), %eax
	.loc 1 164 45 view .LVU457
	leal	-1(%rcx), %edx
	.loc 1 164 41 view .LVU458
	movl	%ecx, %r15d
	subl	%r12d, %r15d
	.loc 1 164 23 view .LVU459
	cmpl	%edx, %eax
	jne	.L81
	movq	%rbp, %rax
	movl	%ebx, %edx
	jmp	.L84
.LVL143:
	.p2align 4,,10
.L82:
	.loc 1 164 32 view .LVU460
	movl	(%rax), %r9d
	leal	(%r15,%r8), %r10d
	movq	%rax, %r11
	subq	$4, %rax
	.loc 1 164 23 view .LVU461
	cmpl	%r10d, %r9d
	jne	.L83
	.loc 1 164 23 view .LVU462
	movl	%r8d, %edx
.LVL144:
.L84:
	.loc 1 165 13 is_stmt 1 view .LVU463
	.loc 1 164 15 is_stmt 0 view .LVU464
	movl	%edx, %r8d
	subl	$1, %r8d
.LVL145:
	.loc 1 164 15 view .LVU465
	jne	.L82
	movl	0(%r13), %r9d
	movq	%r13, %r11
	movl	$1, %edx
.L83:
	.loc 1 167 9 is_stmt 1 view .LVU466
	.loc 1 167 18 is_stmt 0 view .LVU467
	addl	$1, %r9d
.LBB318:
	.loc 1 168 9 view .LVU468
	cmpl	%edx, %r12d
.LBE318:
	.loc 1 167 18 view .LVU469
	movl	%r9d, (%r11)
	.loc 1 168 9 is_stmt 1 view .LVU470
.LBB319:
	.loc 1 168 14 view .LVU471
.LVL146:
	.loc 1 168 9 is_stmt 0 view .LVU472
	jle	.L85
	movslq	%edx, %rax
	.loc 1 169 23 view .LVU473
	movl	$1, %r8d
.LVL147:
	.loc 1 169 23 view .LVU474
	subl	%edx, %r8d
	addl	-4(%r13,%rax,4), %r8d
	.p2align 4,,10
.L86:
.LVL148:
	.loc 1 169 13 is_stmt 1 view .LVU475
	.loc 1 169 23 is_stmt 0 view .LVU476
	leal	(%r8,%rax), %edx
	movl	%edx, 0(%r13,%rax,4)
.LVL149:
	.loc 1 169 23 view .LVU477
	addq	$1, %rax
.LVL150:
	.loc 1 168 9 view .LVU478
	cmpl	%eax, %r12d
	jg	.L86
.L85:
	.loc 1 168 9 view .LVU479
	addq	$16, %r14
.LBE319:
.LBE323:
	.loc 1 158 11 view .LVU480
	cmpl	%ecx, (%rsi)
	jl	.L74
.LVL151:
.L73:
	.loc 1 158 11 view .LVU481
.LBE312:
.LBE311:
	.loc 1 309 9 is_stmt 1 view .LVU482
.LBB328:
.LBI328:
	.loc 1 119 19 view .LVU483
.LBB329:
	.loc 1 121 5 view .LVU484
	.loc 1 121 17 is_stmt 0 view .LVU485
	movl	__c_n_m(%rip), %eax
	.loc 1 121 8 view .LVU486
	testl	%eax, %eax
	jne	.L89
	movl	%r12d, %edx
	call	c_n_m.part.1
.LVL152:
.L89:
	.loc 1 121 8 view .LVU487
	leaq	72(%rsp), %rsi
	xorl	%r9d, %r9d
.LBE329:
.LBE328:
.LBB330:
	.loc 1 311 9 view .LVU488
	movl	%eax, 72(%rsp)
	movl	$6, %r8d
	leaq	main._omp_fn.0(%rip), %rcx
	movq	%rsi, %rdx
	call	GOMP_parallel
.LVL153:
	.loc 1 311 9 view .LVU489
.LBE330:
	.loc 1 335 9 is_stmt 1 view .LVU490
.LBB331:
.LBI331:
	.loc 1 187 20 view .LVU491
	.loc 1 187 20 is_stmt 0 view .LVU492
.LBE331:
.LBE213:
	.loc 1 190 5 is_stmt 1 view .LVU493
.LBB419:
.LBB336:
.LBB332:
	.loc 1 192 9 view .LVU494
.LBB333:
.LBI333:
	.loc 1 119 19 view .LVU495
.LBB334:
	.loc 1 121 5 view .LVU496
	.loc 1 121 17 is_stmt 0 view .LVU497
	movl	__c_n_m(%rip), %ebx
	.loc 1 121 8 view .LVU498
	testl	%ebx, %ebx
	jne	.L90
	movl	m(%rip), %edx
	movl	n(%rip), %ecx
	call	c_n_m.part.1
.LVL154:
	.loc 1 121 8 view .LVU499
	movl	%eax, %ebx
.L90:
.LVL155:
	.loc 1 121 8 view .LVU500
.LBE334:
.LBE333:
	.loc 1 193 9 is_stmt 1 view .LVU501
	.loc 1 194 9 view .LVU502
	leaq	64(%rsp), %rcx
	call	gettimeofday.constprop.3
.LVL156:
	.loc 1 195 9 view .LVU503
	movslq	%ebx, %rdx
	movq	object(%rip), %rcx
	movl	$16, %r8d
	leaq	compare_2_combinations(%rip), %r9
	.loc 1 199 50 is_stmt 0 view .LVU504
	movl	$274877907, %ebx
.LVL157:
	.loc 1 199 50 view .LVU505
.LBE332:
.LBE336:
.LBB337:
.LBB338:
.LBB339:
	.loc 1 214 9 view .LVU506
	leaq	.LC17(%rip), %rbp
.LBB340:
	.loc 1 216 13 view .LVU507
	leaq	.LC18(%rip), %rdi
.LBE340:
.LBE339:
.LBE338:
.LBE337:
.LBB377:
.LBB335:
	.loc 1 195 9 view .LVU508
	call	qsort
.LVL158:
	.loc 1 196 9 is_stmt 1 view .LVU509
	movq	%rsi, %rcx
	call	gettimeofday.constprop.3
.LVL159:
	.loc 1 197 9 view .LVU510
	.loc 1 199 33 is_stmt 0 view .LVU511
	movl	76(%rsp), %r8d
	subl	68(%rsp), %r8d
	.loc 1 198 28 view .LVU512
	movl	72(%rsp), %ecx
	subl	64(%rsp), %ecx
	.loc 1 199 50 view .LVU513
	movl	%r8d, %eax
	sarl	$31, %r8d
	imull	%ebx
	.loc 1 198 44 view .LVU514
	imull	$1000, %ecx, %ecx
	.loc 1 199 50 view .LVU515
	sarl	$6, %edx
	subl	%r8d, %edx
	.loc 1 197 9 view .LVU516
	addl	%ecx, %edx
	leaq	.LC14(%rip), %rcx
	call	printf
.LVL160:
	.loc 1 197 9 view .LVU517
.LBE335:
.LBE377:
	.loc 1 338 9 is_stmt 1 view .LVU518
	movq	%rsi, %rcx
.LBB378:
.LBB374:
	.loc 1 212 5 is_stmt 0 view .LVU519
	xorl	%esi, %esi
.LBE374:
.LBE378:
	.loc 1 338 9 view .LVU520
	call	gettimeofday.constprop.3
.LVL161:
	.loc 1 339 9 is_stmt 1 view .LVU521
	.loc 1 341 33 is_stmt 0 view .LVU522
	movl	76(%rsp), %r8d
	subl	60(%rsp), %r8d
	.loc 1 340 28 view .LVU523
	movl	72(%rsp), %ecx
	subl	56(%rsp), %ecx
	.loc 1 341 50 view .LVU524
	movl	%r8d, %eax
	sarl	$31, %r8d
	imull	%ebx
	.loc 1 340 44 view .LVU525
	imull	$1000, %ecx, %ecx
	.loc 1 341 50 view .LVU526
	movl	%edx, %ebx
	sarl	$6, %ebx
	subl	%r8d, %ebx
	.loc 1 339 9 view .LVU527
	leal	(%rcx,%rbx), %edx
	leaq	.LC15(%rip), %rcx
	call	printf
.LVL162:
	.loc 1 342 9 is_stmt 1 view .LVU528
.LBB379:
.LBI337:
	.loc 1 207 20 view .LVU529
.LBB375:
	.loc 1 212 5 view .LVU530
	leaq	.LC16(%rip), %rcx
	call	puts
.LVL163:
	.loc 1 213 5 view .LVU531
.LBB343:
	.loc 1 213 10 view .LVU532
	.p2align 4,,10
.L92:
	.loc 1 214 9 view .LVU533
	movq	object(%rip), %rax
	movq	%rbp, %rcx
.LBB341:
	.loc 1 215 9 is_stmt 0 view .LVU534
	xorl	%ebx, %ebx
.LBE341:
	.loc 1 214 9 view .LVU535
	movsd	8(%rax,%rsi), %xmm0
	movapd	%xmm0, %xmm1
	movq	%xmm0, %rdx
	call	printf
.LVL164:
	.loc 1 215 9 is_stmt 1 view .LVU536
.LBB342:
	.loc 1 215 14 view .LVU537
	.loc 1 215 9 is_stmt 0 view .LVU538
	movl	m(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L94
.LVL165:
	.p2align 4,,10
.L91:
	.loc 1 216 13 is_stmt 1 view .LVU539
	.loc 1 216 36 is_stmt 0 view .LVU540
	movq	object(%rip), %rax
	.loc 1 216 13 view .LVU541
	movq	%rdi, %rcx
	movq	(%rax,%rsi), %rax
	movl	(%rax,%rbx,4), %edx
	addq	$1, %rbx
.LVL166:
	.loc 1 216 13 view .LVU542
	call	printf
.LVL167:
	.loc 1 215 9 view .LVU543
	cmpl	%ebx, m(%rip)
	jg	.L91
.L94:
	.loc 1 215 9 view .LVU544
.LBE342:
	.loc 1 218 9 is_stmt 1 view .LVU545
	movl	$10, %ecx
	addq	$16, %rsi
	call	putchar
.LVL168:
	.loc 1 213 5 is_stmt 0 view .LVU546
	cmpq	$160, %rsi
	jne	.L92
.LBE343:
	.loc 1 221 5 is_stmt 1 view .LVU547
	leaq	.LC19(%rip), %rcx
	call	puts
.LVL169:
	.loc 1 222 5 view .LVU548
.LBB344:
	.loc 1 222 10 view .LVU549
.LBB345:
.LBB346:
	.loc 1 121 17 is_stmt 0 view .LVU550
	movl	__c_n_m(%rip), %eax
.LBE346:
.LBE345:
	.loc 1 222 18 view .LVU551
	movl	m(%rip), %r10d
.LVL170:
.LBB348:
.LBI345:
	.loc 1 119 19 is_stmt 1 view .LVU552
.LBB347:
	.loc 1 121 5 view .LVU553
	.loc 1 121 8 is_stmt 0 view .LVU554
	testl	%eax, %eax
	.loc 1 121 17 view .LVU555
	movl	%eax, %ebp
	.loc 1 121 8 view .LVU556
	jne	.L95
	movl	n(%rip), %ecx
	movl	%r10d, %edx
	call	c_n_m.part.1
.LVL171:
	.loc 1 121 8 view .LVU557
	movl	%eax, %ebp
	movl	__c_n_m(%rip), %eax
.L95:
.LVL172:
	.loc 1 121 8 view .LVU558
.LBE347:
.LBE348:
	.loc 1 223 9 view .LVU559
	leaq	.LC17(%rip), %r12
	.loc 1 222 14 view .LVU560
	subl	$10, %ebp
.LVL173:
.LBB349:
	.loc 1 225 13 view .LVU561
	leaq	.LC18(%rip), %rdi
.LVL174:
	.loc 1 225 13 view .LVU562
.LBE349:
.LBB350:
.LBI350:
	.loc 1 119 19 is_stmt 1 view .LVU563
.LBB351:
	.loc 1 121 5 view .LVU564
	movslq	%ebp, %rsi
	salq	$4, %rsi
	.loc 1 121 8 is_stmt 0 view .LVU565
	testl	%eax, %eax
	je	.L164
	.p2align 4,,10
.L99:
.LVL175:
	.loc 1 121 8 view .LVU566
.LBE351:
.LBE350:
	.loc 1 222 5 view .LVU567
	cmpl	%eax, %ebp
	jge	.L165
.L102:
	.loc 1 223 9 is_stmt 1 view .LVU568
	movq	object(%rip), %rax
	movq	%r12, %rcx
.LBB367:
	.loc 1 224 9 is_stmt 0 view .LVU569
	xorl	%ebx, %ebx
.LBE367:
	.loc 1 223 9 view .LVU570
	movsd	8(%rax,%rsi), %xmm0
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	call	printf
.LVL176:
	.loc 1 224 9 is_stmt 1 view .LVU571
.LBB368:
	.loc 1 224 14 view .LVU572
	.loc 1 224 9 is_stmt 0 view .LVU573
	movl	m(%rip), %edx
	testl	%edx, %edx
	jle	.L98
.LVL177:
	.p2align 4,,10
.L97:
	.loc 1 225 13 is_stmt 1 view .LVU574
	.loc 1 225 36 is_stmt 0 view .LVU575
	movq	object(%rip), %rax
	.loc 1 225 13 view .LVU576
	movq	%rdi, %rcx
	movq	(%rax,%rsi), %rax
	movl	(%rax,%rbx,4), %edx
	addq	$1, %rbx
.LVL178:
	.loc 1 225 13 view .LVU577
	call	printf
.LVL179:
	.loc 1 224 9 view .LVU578
	cmpl	%ebx, m(%rip)
	jg	.L97
.L98:
	.loc 1 224 9 view .LVU579
.LBE368:
	.loc 1 227 9 is_stmt 1 view .LVU580
	movl	$10, %ecx
	.loc 1 222 54 is_stmt 0 view .LVU581
	addl	$1, %ebp
.LVL180:
	.loc 1 222 54 view .LVU582
	addq	$16, %rsi
	.loc 1 227 9 view .LVU583
	call	putchar
.LVL181:
	.loc 1 227 9 view .LVU584
	movl	__c_n_m(%rip), %eax
.LVL182:
.LBB369:
	.loc 1 119 19 is_stmt 1 view .LVU585
.LBB363:
	.loc 1 121 5 view .LVU586
	movl	m(%rip), %r10d
	.loc 1 121 8 is_stmt 0 view .LVU587
	testl	%eax, %eax
	jne	.L99
.L164:
.LBB352:
.LBB353:
.LBB354:
	.loc 1 123 9 view .LVU588
	testl	%r10d, %r10d
.LBE354:
.LBE353:
.LBE352:
.LBE363:
.LBE369:
	.loc 1 222 40 view .LVU589
	movl	n(%rip), %edx
.LVL183:
.LBB370:
.LBB364:
.LBB360:
.LBB357:
.LBB355:
	.loc 1 123 9 view .LVU590
	jle	.L132
	leal	1(%r10), %r8d
.LBE355:
	.loc 1 122 13 view .LVU591
	movl	$1, %eax
.LBB356:
	.loc 1 123 18 view .LVU592
	movl	$1, %ecx
	leal	1(%rdx), %r9d
.LVL184:
	.p2align 4,,10
.L101:
	.loc 1 124 13 is_stmt 1 view .LVU593
	.loc 1 124 29 is_stmt 0 view .LVU594
	movl	%r9d, %edx
	subl	%ecx, %edx
	imull	%edx, %eax
.LVL185:
	.loc 1 124 20 view .LVU595
	cltd
	idivl	%ecx
.LVL186:
	.loc 1 123 34 view .LVU596
	addl	$1, %ecx
.LVL187:
	.loc 1 123 9 view .LVU597
	cmpl	%r8d, %ecx
	jne	.L101
.LVL188:
.L100:
	.loc 1 123 9 view .LVU598
.LBE356:
	.loc 1 126 9 is_stmt 1 view .LVU599
.LBE357:
.LBE360:
.LBE364:
.LBE370:
	.loc 1 222 5 is_stmt 0 view .LVU600
	cmpl	%eax, %ebp
.LBB371:
.LBB365:
.LBB361:
.LBB358:
	.loc 1 126 17 view .LVU601
	movl	%eax, __c_n_m(%rip)
	.loc 1 127 9 is_stmt 1 view .LVU602
.LVL189:
	.loc 1 127 9 is_stmt 0 view .LVU603
.LBE358:
.LBE361:
.LBE365:
.LBE371:
	.loc 1 222 5 view .LVU604
	jl	.L102
.L165:
.LVL190:
	.loc 1 222 5 view .LVU605
.LBE344:
.LBE375:
.LBE379:
	.loc 1 343 9 is_stmt 1 view .LVU606
.LBB380:
.LBI380:
	.loc 1 231 20 view .LVU607
.LBB381:
	.loc 1 232 5 view .LVU608
	.loc 1 232 16 is_stmt 0 view .LVU609
	leaq	.LC20(%rip), %rdx
	leaq	.LC21(%rip), %rcx
	call	fopen
.LVL191:
	.loc 1 234 15 view .LVU610
	movl	m(%rip), %r10d
	.loc 1 232 16 view .LVU611
	movq	%rax, %rsi
.LVL192:
	.loc 1 234 5 is_stmt 1 view .LVU612
.LBB382:
.LBI382:
	.loc 1 119 19 view .LVU613
.LBB383:
	.loc 1 121 5 view .LVU614
	.loc 1 121 17 is_stmt 0 view .LVU615
	movl	__c_n_m(%rip), %eax
.LVL193:
	.loc 1 121 8 view .LVU616
	testl	%eax, %eax
	jne	.L103
	movl	n(%rip), %ecx
	movl	%r10d, %edx
	call	c_n_m.part.1
.LVL194:
.L103:
	.loc 1 121 8 view .LVU617
.LBE383:
.LBE382:
	.loc 1 235 5 is_stmt 1 view .LVU618
.LBB384:
	.loc 1 235 10 view .LVU619
	.loc 1 235 14 is_stmt 0 view .LVU620
	leal	-1(%rax), %edi
.LVL195:
.LBB385:
	.loc 1 237 13 view .LVU621
	leaq	.LC8(%rip), %rbp
	movslq	%edi, %rdi
	.loc 1 237 13 view .LVU622
	salq	$4, %rdi
.LVL196:
	.loc 1 237 13 view .LVU623
	leaq	-16000(%rdi), %r12
.LVL197:
	.p2align 4,,10
.L104:
	.loc 1 236 9 view .LVU624
	xorl	%ebx, %ebx
	testl	%r10d, %r10d
	jle	.L107
.LVL198:
	.p2align 4,,10
.L109:
	.loc 1 237 13 is_stmt 1 view .LVU625
	.loc 1 237 40 is_stmt 0 view .LVU626
	movq	object(%rip), %rax
	.loc 1 237 13 view .LVU627
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	(%rax,%rdi), %rax
	movl	(%rax,%rbx,4), %r8d
	call	fprintf
.LVL199:
	.loc 1 238 13 is_stmt 1 view .LVU628
	.loc 1 238 24 is_stmt 0 view .LVU629
	movl	m(%rip), %eax
	leal	-1(%rax), %edx
	.loc 1 238 16 view .LVU630
	cmpl	%ebx, %edx
	je	.L105
	.loc 1 239 17 is_stmt 1 view .LVU631
	movq	%rsi, %rdx
	movl	$32, %ecx
	addq	$1, %rbx
.LVL200:
	.loc 1 239 17 is_stmt 0 view .LVU632
	call	fputc
.LVL201:
	.loc 1 236 9 view .LVU633
	cmpl	%ebx, m(%rip)
	jg	.L109
.L107:
	.loc 1 236 9 view .LVU634
.LBE385:
	.loc 1 242 9 is_stmt 1 view .LVU635
	movq	%rsi, %rdx
	movl	$10, %ecx
	subq	$16, %rdi
	call	fputc
.LVL202:
	.loc 1 235 5 is_stmt 0 view .LVU636
	cmpq	%rdi, %r12
	je	.L133
	movl	m(%rip), %r10d
	jmp	.L104
.LVL203:
	.p2align 4,,10
.L125:
	.loc 1 235 5 view .LVU637
.LBE384:
.LBE381:
.LBE380:
.LBB397:
.LBB308:
.LBB306:
.LBB303:
.LBB300:
.LBB296:
	.loc 1 78 5 view .LVU638
	movapd	%xmm3, %xmm1
	jmp	.L67
	.p2align 4,,10
.L126:
.LBE296:
	.loc 1 77 12 view .LVU639
	pxor	%xmm1, %xmm1
.LBB297:
	.loc 1 78 14 view .LVU640
	xorl	%ecx, %ecx
	jmp	.L68
.LVL204:
	.p2align 4,,10
.L105:
	.loc 1 78 14 view .LVU641
	addq	$1, %rbx
.LVL205:
	.loc 1 78 14 view .LVU642
.LBE297:
.LBE300:
.LBE303:
.LBE306:
.LBE308:
.LBE397:
.LBB398:
.LBB395:
.LBB387:
.LBB386:
	.loc 1 236 9 view .LVU643
	cmpl	%ebx, %eax
	jg	.L109
	jmp	.L107
	.p2align 4,,10
.L133:
	.loc 1 236 9 view .LVU644
.LBE386:
.LBE387:
.LBB388:
.LBB389:
	.loc 1 247 13 view .LVU645
	leaq	.LC8(%rip), %rbp
.LBE389:
.LBE388:
.LBB392:
	.loc 1 235 5 view .LVU646
	xorl	%edi, %edi
	.p2align 4,,10
.L108:
.LVL206:
	.loc 1 235 5 view .LVU647
.LBE392:
.LBB393:
.LBB390:
	.loc 1 246 9 view .LVU648
	movl	m(%rip), %eax
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L112
.LVL207:
	.p2align 4,,10
.L114:
	.loc 1 247 13 is_stmt 1 view .LVU649
	.loc 1 247 40 is_stmt 0 view .LVU650
	movq	object(%rip), %rax
	.loc 1 247 13 view .LVU651
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	(%rax,%rdi), %rax
	movl	(%rax,%rbx,4), %r8d
	call	fprintf
.LVL208:
	.loc 1 248 13 is_stmt 1 view .LVU652
	.loc 1 248 24 is_stmt 0 view .LVU653
	movl	m(%rip), %eax
	leal	-1(%rax), %edx
	.loc 1 248 16 view .LVU654
	cmpl	%ebx, %edx
	je	.L110
	.loc 1 249 17 is_stmt 1 view .LVU655
	movq	%rsi, %rdx
	movl	$32, %ecx
	addq	$1, %rbx
.LVL209:
	.loc 1 249 17 is_stmt 0 view .LVU656
	call	fputc
.LVL210:
	.loc 1 246 9 view .LVU657
	cmpl	%ebx, m(%rip)
	jg	.L114
.L112:
	.loc 1 246 9 view .LVU658
.LBE390:
	.loc 1 252 9 is_stmt 1 view .LVU659
	movq	%rsi, %rdx
	movl	$10, %ecx
	addq	$16, %rdi
	call	fputc
.LVL211:
	.loc 1 245 5 is_stmt 0 view .LVU660
	cmpq	$16000, %rdi
	jne	.L108
.LVL212:
	.loc 1 245 5 view .LVU661
.LBE393:
.LBE395:
.LBE398:
	.loc 1 344 9 is_stmt 1 view .LVU662
	movq	points(%rip), %rcx
.LBB399:
	.loc 1 346 18 is_stmt 0 view .LVU663
	xorl	%ebp, %ebp
.LBE399:
	.loc 1 344 9 view .LVU664
	call	free
.LVL213:
	.loc 1 345 9 is_stmt 1 view .LVU665
	movq	euclidean_distance(%rip), %rcx
	call	free
.LVL214:
	.loc 1 346 9 view .LVU666
.LBB414:
	.loc 1 346 14 view .LVU667
	.loc 1 346 14 is_stmt 0 view .LVU668
	movq	object(%rip), %rdi
	movl	m(%rip), %esi
	movq	%rdi, %r12
	leal	1(%rsi), %ebx
	.loc 1 346 9 view .LVU669
	jmp	.L115
.LVL215:
	.p2align 4,,10
.L116:
	.loc 1 346 9 view .LVU670
	cmpl	%eax, %ebp
	jge	.L166
.L119:
	.loc 1 347 13 is_stmt 1 discriminator 3 view .LVU671
	movq	(%r12), %rcx
	.loc 1 346 43 is_stmt 0 discriminator 3 view .LVU672
	addl	$1, %ebp
.LVL216:
	.loc 1 346 43 discriminator 3 view .LVU673
	addq	$16, %r12
	.loc 1 347 13 discriminator 3 view .LVU674
	call	free
.LVL217:
.L115:
.LBB400:
.LBI400:
	.loc 1 119 19 is_stmt 1 discriminator 1 view .LVU675
.LBB401:
	.loc 1 121 5 discriminator 1 view .LVU676
	.loc 1 121 17 is_stmt 0 discriminator 1 view .LVU677
	movl	__c_n_m(%rip), %eax
	.loc 1 121 8 discriminator 1 view .LVU678
	testl	%eax, %eax
	jne	.L116
.LBB402:
.LBB403:
.LBB404:
	.loc 1 123 9 view .LVU679
	testl	%esi, %esi
.LBE404:
.LBE403:
.LBE402:
.LBE401:
.LBE400:
	.loc 1 346 29 view .LVU680
	movl	n(%rip), %edx
.LVL218:
.LBB412:
.LBB410:
.LBB408:
.LBB406:
	.loc 1 122 13 view .LVU681
	movl	$1, %eax
.LBB405:
	.loc 1 123 9 view .LVU682
	jle	.L117
	leal	1(%rdx), %r8d
	.loc 1 123 18 view .LVU683
	movl	$1, %ecx
.LVL219:
	.p2align 4,,10
.L118:
	.loc 1 124 13 is_stmt 1 view .LVU684
	.loc 1 124 29 is_stmt 0 view .LVU685
	movl	%r8d, %edx
	subl	%ecx, %edx
	imull	%edx, %eax
.LVL220:
	.loc 1 124 20 view .LVU686
	cltd
	idivl	%ecx
.LVL221:
	.loc 1 123 34 view .LVU687
	addl	$1, %ecx
.LVL222:
	.loc 1 123 9 view .LVU688
	cmpl	%ebx, %ecx
	jne	.L118
.LVL223:
.L117:
	.loc 1 123 9 view .LVU689
.LBE405:
	.loc 1 126 9 is_stmt 1 view .LVU690
.LBE406:
.LBE408:
.LBE410:
.LBE412:
	.loc 1 346 9 is_stmt 0 view .LVU691
	cmpl	%eax, %ebp
.LBB413:
.LBB411:
.LBB409:
.LBB407:
	.loc 1 126 17 view .LVU692
	movl	%eax, __c_n_m(%rip)
	.loc 1 127 9 is_stmt 1 view .LVU693
.LVL224:
	.loc 1 127 9 is_stmt 0 view .LVU694
.LBE407:
.LBE409:
.LBE411:
.LBE413:
	.loc 1 346 9 view .LVU695
	jl	.L119
.L166:
	.loc 1 346 9 view .LVU696
.LBE414:
	.loc 1 349 9 is_stmt 1 view .LVU697
	movq	%rdi, %rcx
	call	free
.LVL225:
	.loc 1 350 9 view .LVU698
	movq	cache_eu_dist(%rip), %rcx
	call	free
.LVL226:
.LBE419:
	.loc 1 368 5 view .LVU699
	.loc 1 368 12 is_stmt 0 view .LVU700
	xorl	%eax, %eax
.LVL227:
.L48:
	.loc 1 369 1 view .LVU701
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 64
	popq	%rsi
	.cfi_restore 4
	.cfi_def_cfa_offset 56
	popq	%rdi
	.cfi_restore 5
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
.LVL228:
	.p2align 4,,10
.L110:
	.cfi_restore_state
	.loc 1 369 1 view .LVU702
	addq	$1, %rbx
.LVL229:
.LBB420:
.LBB415:
.LBB396:
.LBB394:
.LBB391:
	.loc 1 246 9 view .LVU703
	cmpl	%ebx, %eax
	jg	.L114
	jmp	.L112
.LVL230:
.L80:
	.loc 1 246 9 view .LVU704
.LBE391:
.LBE394:
.LBE396:
.LBE415:
.LBB416:
.LBB326:
.LBB324:
	.loc 1 167 9 is_stmt 1 view .LVU705
	.loc 1 167 18 is_stmt 0 view .LVU706
	addl	$1, 0(%r13)
	.loc 1 168 9 is_stmt 1 view .LVU707
.LBB320:
	.loc 1 168 14 view .LVU708
.LVL231:
	.loc 1 168 14 is_stmt 0 view .LVU709
	jmp	.L85
.LVL232:
.L81:
	.loc 1 168 14 view .LVU710
.LBE320:
	.loc 1 167 9 is_stmt 1 view .LVU711
	.loc 1 167 18 is_stmt 0 view .LVU712
	addl	$1, %eax
	movl	%eax, (%rdi)
	.loc 1 168 9 is_stmt 1 view .LVU713
.LBB321:
	.loc 1 168 14 view .LVU714
	.loc 1 168 14 is_stmt 0 view .LVU715
	jmp	.L85
.LVL233:
.L158:
	.loc 1 168 14 view .LVU716
.LBE321:
.LBE324:
.LBE326:
.LBE416:
	.loc 1 263 13 is_stmt 1 view .LVU717
	.loc 1 263 22 is_stmt 0 view .LVU718
	movq	8(%rsi), %rsi
.LVL234:
	.loc 1 263 22 view .LVU719
	jmp	.L50
.LVL235:
.L132:
.LBB417:
.LBB376:
.LBB373:
.LBB372:
.LBB366:
.LBB362:
.LBB359:
	.loc 1 122 13 view .LVU720
	movl	$1, %eax
	jmp	.L100
.LVL236:
.L128:
	.loc 1 122 13 view .LVU721
.LBE359:
.LBE362:
.LBE366:
.LBE372:
.LBE373:
.LBE376:
.LBE417:
.LBB418:
.LBB327:
.LBB325:
	.loc 1 154 14 view .LVU722
	xorl	%eax, %eax
.LVL237:
	.loc 1 154 14 view .LVU723
	jmp	.L75
.LVL238:
.L160:
	.loc 1 154 14 view .LVU724
.LBE325:
.LBE327:
.LBE418:
	.loc 1 274 13 is_stmt 1 view .LVU725
	leaq	.LC7(%rip), %rcx
	movq	%rsi, %rdx
	call	printf
.LVL239:
	.loc 1 275 13 view .LVU726
.L51:
	.loc 1 266 20 is_stmt 0 discriminator 1 view .LVU727
	orl	$-1, %eax
	jmp	.L48
.LVL240:
.L159:
	.loc 1 265 13 is_stmt 1 view .LVU728
	leaq	.LC5(%rip), %rcx
	call	puts
.LVL241:
	.loc 1 266 13 view .LVU729
	.loc 1 266 20 is_stmt 0 view .LVU730
	jmp	.L51
.LBE420:
	.cfi_endproc
.LFE5618:
	.seh_endproc
.lcomm __c_n_m,4,4
.lcomm cache_eu_dist,8,8
.lcomm object,8,8
.lcomm euclidean_distance,8,8
	.data
	.align 4
m:
	.long	2
.lcomm nums_p,4,4
.lcomm dim,4,4
.lcomm n,4,4
.lcomm points,8,8
	.section .rdata,"dr"
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 16
.LC3:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC13:
	.long	4
	.long	4
	.long	4
	.long	4
	.text
.Letext0:
	.file 3 "D:/mingw64/x86_64-w64-mingw32/include/crtdefs.h"
	.file 4 "D:/mingw64/x86_64-w64-mingw32/include/math.h"
	.file 5 "D:/mingw64/x86_64-w64-mingw32/include/stdio.h"
	.file 6 "D:/mingw64/x86_64-w64-mingw32/include/stdlib.h"
	.file 7 "D:/mingw64/x86_64-w64-mingw32/include/malloc.h"
	.file 8 "D:/mingw64/x86_64-w64-mingw32/include/_timeval.h"
	.file 9 "D:/mingw64/x86_64-w64-mingw32/include/excpt.h"
	.file 10 "D:/mingw64/x86_64-w64-mingw32/include/minwindef.h"
	.file 11 "D:/mingw64/x86_64-w64-mingw32/include/ctype.h"
	.file 12 "D:/mingw64/x86_64-w64-mingw32/include/basetsd.h"
	.file 13 "D:/mingw64/x86_64-w64-mingw32/include/guiddef.h"
	.file 14 "D:/mingw64/x86_64-w64-mingw32/include/winnt.h"
	.file 15 "D:/mingw64/x86_64-w64-mingw32/include/minwinbase.h"
	.file 16 "D:/mingw64/x86_64-w64-mingw32/include/sysinfoapi.h"
	.file 17 "D:/mingw64/x86_64-w64-mingw32/include/rpcdce.h"
	.file 18 "D:/mingw64/x86_64-w64-mingw32/include/wtypesbase.h"
	.file 19 "D:/mingw64/x86_64-w64-mingw32/include/unknwnbase.h"
	.file 20 "D:/mingw64/x86_64-w64-mingw32/include/objidlbase.h"
	.file 21 "D:/mingw64/x86_64-w64-mingw32/include/cguid.h"
	.file 22 "D:/mingw64/x86_64-w64-mingw32/include/wtypes.h"
	.file 23 "D:/mingw64/x86_64-w64-mingw32/include/objidl.h"
	.file 24 "D:/mingw64/x86_64-w64-mingw32/include/oleidl.h"
	.file 25 "D:/mingw64/x86_64-w64-mingw32/include/servprov.h"
	.file 26 "D:/mingw64/x86_64-w64-mingw32/include/oaidl.h"
	.file 27 "D:/mingw64/x86_64-w64-mingw32/include/msxml.h"
	.file 28 "D:/mingw64/x86_64-w64-mingw32/include/urlmon.h"
	.file 29 "D:/mingw64/x86_64-w64-mingw32/include/propidl.h"
	.file 30 "D:/mingw64/x86_64-w64-mingw32/include/oleauto.h"
	.file 31 "D:/mingw64/x86_64-w64-mingw32/include/winioctl.h"
	.file 32 "D:/mingw64/x86_64-w64-mingw32/include/winsmcrd.h"
	.file 33 "D:/mingw64/x86_64-w64-mingw32/include/winscard.h"
	.file 34 "D:/mingw64/x86_64-w64-mingw32/include/commdlg.h"
	.file 35 "<built-in>"
	.file 36 "D:/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/omp.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x6794
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -mtune=core2 -march=nocona -mthreads -g -Ofast -fopenmp\0"
	.byte	0xc
	.ascii ".\\pivot.c\0"
	.ascii "D:\\ClionProjects\\CPP_TES\\LAB\\try14\0"
	.secrel32	.Ldebug_ranges0+0xdd0
	.quad	0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x3
	.byte	0x62
	.byte	0x18
	.long	0xdd
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x4
	.long	0xdd
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x4
	.long	0xf8
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x3
	.ascii "__time64_t\0"
	.byte	0x3
	.byte	0x7b
	.byte	0x23
	.long	0xbc
	.uleb128 0x3
	.ascii "time_t\0"
	.byte	0x3
	.byte	0x8a
	.byte	0x14
	.long	0x110
	.uleb128 0x5
	.ascii "pthreadlocinfo\0"
	.byte	0x3
	.word	0x1a8
	.byte	0x28
	.long	0x14a
	.uleb128 0x6
	.byte	0x8
	.long	0x150
	.uleb128 0x7
	.ascii "threadlocaleinfostruct\0"
	.word	0x160
	.byte	0x3
	.word	0x1bc
	.byte	0x10
	.long	0x2fa
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1bd
	.byte	0x7
	.long	0xf8
	.byte	0
	.uleb128 0x9
	.ascii "lc_codepage\0"
	.byte	0x3
	.word	0x1be
	.byte	0x10
	.long	0x447
	.byte	0x4
	.uleb128 0x9
	.ascii "lc_collate_cp\0"
	.byte	0x3
	.word	0x1bf
	.byte	0x10
	.long	0x447
	.byte	0x8
	.uleb128 0x9
	.ascii "lc_handle\0"
	.byte	0x3
	.word	0x1c0
	.byte	0x11
	.long	0x457
	.byte	0xc
	.uleb128 0x9
	.ascii "lc_id\0"
	.byte	0x3
	.word	0x1c1
	.byte	0x9
	.long	0x47c
	.byte	0x24
	.uleb128 0x9
	.ascii "lc_category\0"
	.byte	0x3
	.word	0x1c7
	.byte	0x5
	.long	0x48c
	.byte	0x48
	.uleb128 0xa
	.ascii "lc_clike\0"
	.byte	0x3
	.word	0x1c8
	.byte	0x7
	.long	0xf8
	.word	0x108
	.uleb128 0xa
	.ascii "mb_cur_max\0"
	.byte	0x3
	.word	0x1c9
	.byte	0x7
	.long	0xf8
	.word	0x10c
	.uleb128 0xa
	.ascii "lconv_intl_refcount\0"
	.byte	0x3
	.word	0x1ca
	.byte	0x8
	.long	0x441
	.word	0x110
	.uleb128 0xa
	.ascii "lconv_num_refcount\0"
	.byte	0x3
	.word	0x1cb
	.byte	0x8
	.long	0x441
	.word	0x118
	.uleb128 0xa
	.ascii "lconv_mon_refcount\0"
	.byte	0x3
	.word	0x1cc
	.byte	0x8
	.long	0x441
	.word	0x120
	.uleb128 0xa
	.ascii "lconv\0"
	.byte	0x3
	.word	0x1cd
	.byte	0x11
	.long	0x4a3
	.word	0x128
	.uleb128 0xa
	.ascii "ctype1_refcount\0"
	.byte	0x3
	.word	0x1ce
	.byte	0x8
	.long	0x441
	.word	0x130
	.uleb128 0xa
	.ascii "ctype1\0"
	.byte	0x3
	.word	0x1cf
	.byte	0x13
	.long	0x4a9
	.word	0x138
	.uleb128 0xa
	.ascii "pctype\0"
	.byte	0x3
	.word	0x1d0
	.byte	0x19
	.long	0x4af
	.word	0x140
	.uleb128 0xa
	.ascii "pclmap\0"
	.byte	0x3
	.word	0x1d1
	.byte	0x18
	.long	0x4b5
	.word	0x148
	.uleb128 0xa
	.ascii "pcumap\0"
	.byte	0x3
	.word	0x1d2
	.byte	0x18
	.long	0x4b5
	.word	0x150
	.uleb128 0xa
	.ascii "lc_time_curr\0"
	.byte	0x3
	.word	0x1d3
	.byte	0x1a
	.long	0x4e1
	.word	0x158
	.byte	0
	.uleb128 0x5
	.ascii "pthreadmbcinfo\0"
	.byte	0x3
	.word	0x1a9
	.byte	0x25
	.long	0x312
	.uleb128 0x6
	.byte	0x8
	.long	0x318
	.uleb128 0xb
	.ascii "threadmbcinfostruct\0"
	.uleb128 0xc
	.ascii "localeinfo_struct\0"
	.byte	0x10
	.byte	0x3
	.word	0x1ac
	.byte	0x10
	.long	0x36e
	.uleb128 0x9
	.ascii "locinfo\0"
	.byte	0x3
	.word	0x1ad
	.byte	0x12
	.long	0x132
	.byte	0
	.uleb128 0x9
	.ascii "mbcinfo\0"
	.byte	0x3
	.word	0x1ae
	.byte	0x12
	.long	0x2fa
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.ascii "_locale_tstruct\0"
	.byte	0x3
	.word	0x1af
	.byte	0x3
	.long	0x32d
	.uleb128 0xc
	.ascii "tagLC_ID\0"
	.byte	0x6
	.byte	0x3
	.word	0x1b3
	.byte	0x10
	.long	0x3d6
	.uleb128 0x9
	.ascii "wLanguage\0"
	.byte	0x3
	.word	0x1b4
	.byte	0x12
	.long	0xdd
	.byte	0
	.uleb128 0x9
	.ascii "wCountry\0"
	.byte	0x3
	.word	0x1b5
	.byte	0x12
	.long	0xdd
	.byte	0x2
	.uleb128 0x9
	.ascii "wCodePage\0"
	.byte	0x3
	.word	0x1b6
	.byte	0x12
	.long	0xdd
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.ascii "LC_ID\0"
	.byte	0x3
	.word	0x1b7
	.byte	0x3
	.long	0x387
	.uleb128 0xd
	.byte	0x20
	.byte	0x3
	.word	0x1c2
	.byte	0x3
	.long	0x435
	.uleb128 0x9
	.ascii "locale\0"
	.byte	0x3
	.word	0x1c3
	.byte	0xb
	.long	0x435
	.byte	0
	.uleb128 0x9
	.ascii "wlocale\0"
	.byte	0x3
	.word	0x1c4
	.byte	0xe
	.long	0x43b
	.byte	0x8
	.uleb128 0x8
	.secrel32	.LASF0
	.byte	0x3
	.word	0x1c5
	.byte	0xa
	.long	0x441
	.byte	0x10
	.uleb128 0x9
	.ascii "wrefcount\0"
	.byte	0x3
	.word	0x1c6
	.byte	0xa
	.long	0x441
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0x6
	.byte	0x8
	.long	0xcd
	.uleb128 0x6
	.byte	0x8
	.long	0xf8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0xe
	.long	0x467
	.long	0x467
	.uleb128 0xf
	.long	0xa2
	.byte	0x5
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xe
	.long	0x3d6
	.long	0x48c
	.uleb128 0xf
	.long	0xa2
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.long	0x3e5
	.long	0x49c
	.uleb128 0xf
	.long	0xa2
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.ascii "lconv\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x49c
	.uleb128 0x6
	.byte	0x8
	.long	0xdd
	.uleb128 0x6
	.byte	0x8
	.long	0xf3
	.uleb128 0x6
	.byte	0x8
	.long	0x4cc
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.long	0x4bb
	.uleb128 0xb
	.ascii "__lc_time_data\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x4d1
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x6
	.byte	0x8
	.long	0x90
	.uleb128 0x10
	.ascii "__imp__HUGE\0"
	.byte	0x4
	.byte	0x9c
	.byte	0x13
	.long	0x4ff
	.uleb128 0x11
	.ascii "signgam\0"
	.byte	0x4
	.word	0x393
	.byte	0xe
	.long	0xf8
	.uleb128 0x12
	.ascii "_iobuf\0"
	.byte	0x30
	.byte	0x5
	.byte	0x1a
	.byte	0xa
	.long	0x5ba
	.uleb128 0x13
	.ascii "_ptr\0"
	.byte	0x5
	.byte	0x1b
	.byte	0xb
	.long	0x435
	.byte	0
	.uleb128 0x13
	.ascii "_cnt\0"
	.byte	0x5
	.byte	0x1c
	.byte	0x9
	.long	0xf8
	.byte	0x8
	.uleb128 0x13
	.ascii "_base\0"
	.byte	0x5
	.byte	0x1d
	.byte	0xb
	.long	0x435
	.byte	0x10
	.uleb128 0x13
	.ascii "_flag\0"
	.byte	0x5
	.byte	0x1e
	.byte	0x9
	.long	0xf8
	.byte	0x18
	.uleb128 0x13
	.ascii "_file\0"
	.byte	0x5
	.byte	0x1f
	.byte	0x9
	.long	0xf8
	.byte	0x1c
	.uleb128 0x13
	.ascii "_charbuf\0"
	.byte	0x5
	.byte	0x20
	.byte	0x9
	.long	0xf8
	.byte	0x20
	.uleb128 0x13
	.ascii "_bufsiz\0"
	.byte	0x5
	.byte	0x21
	.byte	0x9
	.long	0xf8
	.byte	0x24
	.uleb128 0x13
	.ascii "_tmpfname\0"
	.byte	0x5
	.byte	0x22
	.byte	0xb
	.long	0x435
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.ascii "FILE\0"
	.byte	0x5
	.byte	0x24
	.byte	0x19
	.long	0x52a
	.uleb128 0x10
	.ascii "__imp___mb_cur_max\0"
	.byte	0x6
	.byte	0x73
	.byte	0x10
	.long	0x441
	.uleb128 0xe
	.long	0x435
	.long	0x5f2
	.uleb128 0xf
	.long	0xa2
	.byte	0
	.byte	0
	.uleb128 0x10
	.ascii "_sys_errlist\0"
	.byte	0x6
	.byte	0xac
	.byte	0x26
	.long	0x5e2
	.uleb128 0x10
	.ascii "_sys_nerr\0"
	.byte	0x6
	.byte	0xad
	.byte	0x24
	.long	0xf8
	.uleb128 0x11
	.ascii "__imp___argc\0"
	.byte	0x6
	.word	0x119
	.byte	0x10
	.long	0x441
	.uleb128 0x11
	.ascii "__imp___argv\0"
	.byte	0x6
	.word	0x11d
	.byte	0x13
	.long	0x645
	.uleb128 0x6
	.byte	0x8
	.long	0x64b
	.uleb128 0x6
	.byte	0x8
	.long	0x435
	.uleb128 0x11
	.ascii "__imp___wargv\0"
	.byte	0x6
	.word	0x121
	.byte	0x16
	.long	0x668
	.uleb128 0x6
	.byte	0x8
	.long	0x66e
	.uleb128 0x6
	.byte	0x8
	.long	0x43b
	.uleb128 0x11
	.ascii "__imp__environ\0"
	.byte	0x6
	.word	0x127
	.byte	0x13
	.long	0x645
	.uleb128 0x11
	.ascii "__imp__wenviron\0"
	.byte	0x6
	.word	0x12c
	.byte	0x16
	.long	0x668
	.uleb128 0x11
	.ascii "__imp__pgmptr\0"
	.byte	0x6
	.word	0x132
	.byte	0x12
	.long	0x64b
	.uleb128 0x11
	.ascii "__imp__wpgmptr\0"
	.byte	0x6
	.word	0x137
	.byte	0x15
	.long	0x66e
	.uleb128 0x11
	.ascii "__imp__osplatform\0"
	.byte	0x6
	.word	0x13c
	.byte	0x19
	.long	0x6ef
	.uleb128 0x6
	.byte	0x8
	.long	0x447
	.uleb128 0x11
	.ascii "__imp__osver\0"
	.byte	0x6
	.word	0x141
	.byte	0x19
	.long	0x6ef
	.uleb128 0x11
	.ascii "__imp__winver\0"
	.byte	0x6
	.word	0x146
	.byte	0x19
	.long	0x6ef
	.uleb128 0x11
	.ascii "__imp__winmajor\0"
	.byte	0x6
	.word	0x14b
	.byte	0x19
	.long	0x6ef
	.uleb128 0x11
	.ascii "__imp__winminor\0"
	.byte	0x6
	.word	0x150
	.byte	0x19
	.long	0x6ef
	.uleb128 0x10
	.ascii "_amblksiz\0"
	.byte	0x7
	.byte	0x35
	.byte	0x17
	.long	0x447
	.uleb128 0x12
	.ascii "tm\0"
	.byte	0x24
	.byte	0x2
	.byte	0x61
	.byte	0xa
	.long	0x80a
	.uleb128 0x13
	.ascii "tm_sec\0"
	.byte	0x2
	.byte	0x62
	.byte	0x9
	.long	0xf8
	.byte	0
	.uleb128 0x13
	.ascii "tm_min\0"
	.byte	0x2
	.byte	0x63
	.byte	0x9
	.long	0xf8
	.byte	0x4
	.uleb128 0x13
	.ascii "tm_hour\0"
	.byte	0x2
	.byte	0x64
	.byte	0x9
	.long	0xf8
	.byte	0x8
	.uleb128 0x13
	.ascii "tm_mday\0"
	.byte	0x2
	.byte	0x65
	.byte	0x9
	.long	0xf8
	.byte	0xc
	.uleb128 0x13
	.ascii "tm_mon\0"
	.byte	0x2
	.byte	0x66
	.byte	0x9
	.long	0xf8
	.byte	0x10
	.uleb128 0x13
	.ascii "tm_year\0"
	.byte	0x2
	.byte	0x67
	.byte	0x9
	.long	0xf8
	.byte	0x14
	.uleb128 0x13
	.ascii "tm_wday\0"
	.byte	0x2
	.byte	0x68
	.byte	0x9
	.long	0xf8
	.byte	0x18
	.uleb128 0x13
	.ascii "tm_yday\0"
	.byte	0x2
	.byte	0x69
	.byte	0x9
	.long	0xf8
	.byte	0x1c
	.uleb128 0x13
	.ascii "tm_isdst\0"
	.byte	0x2
	.byte	0x6a
	.byte	0x9
	.long	0xf8
	.byte	0x20
	.byte	0
	.uleb128 0x10
	.ascii "_daylight\0"
	.byte	0x2
	.byte	0x7a
	.byte	0x16
	.long	0xf8
	.uleb128 0x10
	.ascii "_dstbias\0"
	.byte	0x2
	.byte	0x7b
	.byte	0x17
	.long	0x104
	.uleb128 0x10
	.ascii "_timezone\0"
	.byte	0x2
	.byte	0x7c
	.byte	0x17
	.long	0x104
	.uleb128 0xe
	.long	0x435
	.long	0x84f
	.uleb128 0xf
	.long	0xa2
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.ascii "_tzname\0"
	.byte	0x2
	.byte	0x7d
	.byte	0x19
	.long	0x83f
	.uleb128 0x11
	.ascii "daylight\0"
	.byte	0x2
	.word	0x116
	.byte	0x16
	.long	0xf8
	.uleb128 0x11
	.ascii "timezone\0"
	.byte	0x2
	.word	0x119
	.byte	0x17
	.long	0x104
	.uleb128 0x11
	.ascii "tzname\0"
	.byte	0x2
	.word	0x11a
	.byte	0x18
	.long	0x83f
	.uleb128 0x12
	.ascii "timeval\0"
	.byte	0x8
	.byte	0x8
	.byte	0xa
	.byte	0x8
	.long	0x8c6
	.uleb128 0x13
	.ascii "tv_sec\0"
	.byte	0x8
	.byte	0xc
	.byte	0x7
	.long	0x104
	.byte	0
	.uleb128 0x13
	.ascii "tv_usec\0"
	.byte	0x8
	.byte	0xd
	.byte	0x7
	.long	0x104
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x3
	.ascii "_PHNDLR\0"
	.byte	0x9
	.byte	0x3f
	.byte	0x1b
	.long	0x8e3
	.uleb128 0x6
	.byte	0x8
	.long	0x8e9
	.uleb128 0x14
	.long	0x8f4
	.uleb128 0x15
	.long	0xf8
	.byte	0
	.uleb128 0x12
	.ascii "_XCPT_ACTION\0"
	.byte	0x10
	.byte	0x9
	.byte	0x41
	.byte	0xa
	.long	0x940
	.uleb128 0x13
	.ascii "XcptNum\0"
	.byte	0x9
	.byte	0x42
	.byte	0x13
	.long	0x467
	.byte	0
	.uleb128 0x13
	.ascii "SigNum\0"
	.byte	0x9
	.byte	0x43
	.byte	0x9
	.long	0xf8
	.byte	0x4
	.uleb128 0x13
	.ascii "XcptAction\0"
	.byte	0x9
	.byte	0x44
	.byte	0xd
	.long	0x8d3
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.long	0x8f4
	.long	0x94b
	.uleb128 0x16
	.byte	0
	.uleb128 0x10
	.ascii "_XcptActTab\0"
	.byte	0x9
	.byte	0x47
	.byte	0x1e
	.long	0x940
	.uleb128 0x10
	.ascii "_XcptActTabCount\0"
	.byte	0x9
	.byte	0x48
	.byte	0xe
	.long	0xf8
	.uleb128 0x10
	.ascii "_XcptActTabSize\0"
	.byte	0x9
	.byte	0x49
	.byte	0xe
	.long	0xf8
	.uleb128 0x10
	.ascii "_First_FPE_Indx\0"
	.byte	0x9
	.byte	0x4a
	.byte	0xe
	.long	0xf8
	.uleb128 0x10
	.ascii "_Num_FPE\0"
	.byte	0x9
	.byte	0x4b
	.byte	0xe
	.long	0xf8
	.uleb128 0x17
	.byte	0x8
	.uleb128 0x3
	.ascii "WORD\0"
	.byte	0xa
	.byte	0x8c
	.byte	0x1a
	.long	0xdd
	.uleb128 0x3
	.ascii "DWORD\0"
	.byte	0xa
	.byte	0x8d
	.byte	0x1d
	.long	0x467
	.uleb128 0x3
	.ascii "LPVOID\0"
	.byte	0xa
	.byte	0x99
	.byte	0x11
	.long	0x9b9
	.uleb128 0x6
	.byte	0x8
	.long	0x9eb
	.uleb128 0x18
	.uleb128 0x10
	.ascii "__imp__pctype\0"
	.byte	0xb
	.byte	0x2b
	.byte	0x1c
	.long	0xa02
	.uleb128 0x6
	.byte	0x8
	.long	0x4a9
	.uleb128 0x10
	.ascii "__imp__wctype\0"
	.byte	0xb
	.byte	0x3b
	.byte	0x1c
	.long	0xa02
	.uleb128 0x10
	.ascii "__imp__pwctype\0"
	.byte	0xb
	.byte	0x47
	.byte	0x1c
	.long	0xa02
	.uleb128 0xe
	.long	0x4cc
	.long	0xa40
	.uleb128 0x16
	.byte	0
	.uleb128 0x4
	.long	0xa35
	.uleb128 0x10
	.ascii "__newclmap\0"
	.byte	0xb
	.byte	0x50
	.byte	0x1e
	.long	0xa40
	.uleb128 0x10
	.ascii "__newcumap\0"
	.byte	0xb
	.byte	0x51
	.byte	0x1e
	.long	0xa40
	.uleb128 0x10
	.ascii "__ptlocinfo\0"
	.byte	0xb
	.byte	0x52
	.byte	0x19
	.long	0x132
	.uleb128 0x10
	.ascii "__ptmbcinfo\0"
	.byte	0xb
	.byte	0x53
	.byte	0x19
	.long	0x2fa
	.uleb128 0x10
	.ascii "__globallocalestatus\0"
	.byte	0xb
	.byte	0x54
	.byte	0xe
	.long	0xf8
	.uleb128 0x10
	.ascii "__locale_changed\0"
	.byte	0xb
	.byte	0x55
	.byte	0xe
	.long	0xf8
	.uleb128 0x10
	.ascii "__initiallocinfo\0"
	.byte	0xb
	.byte	0x56
	.byte	0x28
	.long	0x150
	.uleb128 0x10
	.ascii "__initiallocalestructinfo\0"
	.byte	0xb
	.byte	0x57
	.byte	0x1a
	.long	0x36e
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x3
	.ascii "ULONG_PTR\0"
	.byte	0xc
	.byte	0x31
	.byte	0x2e
	.long	0xa2
	.uleb128 0x3
	.ascii "DWORD_PTR\0"
	.byte	0xc
	.byte	0xbf
	.byte	0x27
	.long	0xb13
	.uleb128 0x12
	.ascii "_GUID\0"
	.byte	0x10
	.byte	0xd
	.byte	0x13
	.byte	0x10
	.long	0xb83
	.uleb128 0x13
	.ascii "Data1\0"
	.byte	0xd
	.byte	0x14
	.byte	0x15
	.long	0x467
	.byte	0
	.uleb128 0x13
	.ascii "Data2\0"
	.byte	0xd
	.byte	0x15
	.byte	0x12
	.long	0xdd
	.byte	0x4
	.uleb128 0x13
	.ascii "Data3\0"
	.byte	0xd
	.byte	0x16
	.byte	0x12
	.long	0xdd
	.byte	0x6
	.uleb128 0x13
	.ascii "Data4\0"
	.byte	0xd
	.byte	0x17
	.byte	0x11
	.long	0xb83
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.long	0x4bb
	.long	0xb93
	.uleb128 0xf
	.long	0xa2
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.ascii "GUID\0"
	.byte	0xd
	.byte	0x18
	.byte	0x3
	.long	0xb37
	.uleb128 0x4
	.long	0xb93
	.uleb128 0x3
	.ascii "IID\0"
	.byte	0xd
	.byte	0x53
	.byte	0xe
	.long	0xb93
	.uleb128 0x4
	.long	0xba5
	.uleb128 0x3
	.ascii "CLSID\0"
	.byte	0xd
	.byte	0x5b
	.byte	0xe
	.long	0xb93
	.uleb128 0x4
	.long	0xbb6
	.uleb128 0x3
	.ascii "FMTID\0"
	.byte	0xd
	.byte	0x62
	.byte	0xe
	.long	0xb93
	.uleb128 0x4
	.long	0xbc9
	.uleb128 0x11
	.ascii "GUID_MAX_POWER_SAVINGS\0"
	.byte	0xe
	.word	0x13a9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_MIN_POWER_SAVINGS\0"
	.byte	0xe
	.word	0x13aa
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_TYPICAL_POWER_SAVINGS\0"
	.byte	0xe
	.word	0x13ab
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "NO_SUBGROUP_GUID\0"
	.byte	0xe
	.word	0x13ac
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "ALL_POWERSCHEMES_GUID\0"
	.byte	0xe
	.word	0x13ad
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_POWERSCHEME_PERSONALITY\0"
	.byte	0xe
	.word	0x13ae
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ACTIVE_POWERSCHEME\0"
	.byte	0xe
	.word	0x13af
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_IDLE_RESILIENCY_SUBGROUP\0"
	.byte	0xe
	.word	0x13b0
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_IDLE_RESILIENCY_PERIOD\0"
	.byte	0xe
	.word	0x13b1
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_COALESCING_POWERDOWN_TIMEOUT\0"
	.byte	0xe
	.word	0x13b2
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_EXECUTION_REQUIRED_REQUEST_TIMEOUT\0"
	.byte	0xe
	.word	0x13b3
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_SUBGROUP\0"
	.byte	0xe
	.word	0x13b4
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_POWERDOWN_TIMEOUT\0"
	.byte	0xe
	.word	0x13b5
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_ANNOYANCE_TIMEOUT\0"
	.byte	0xe
	.word	0x13b6
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_ADAPTIVE_PERCENT_INCREASE\0"
	.byte	0xe
	.word	0x13b7
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_DIM_TIMEOUT\0"
	.byte	0xe
	.word	0x13b8
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_ADAPTIVE_POWERDOWN\0"
	.byte	0xe
	.word	0x13b9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_MONITOR_POWER_ON\0"
	.byte	0xe
	.word	0x13ba
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS\0"
	.byte	0xe
	.word	0x13bb
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DEVICE_POWER_POLICY_VIDEO_DIM_BRIGHTNESS\0"
	.byte	0xe
	.word	0x13bc
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_CURRENT_MONITOR_BRIGHTNESS\0"
	.byte	0xe
	.word	0x13bd
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_ADAPTIVE_DISPLAY_BRIGHTNESS\0"
	.byte	0xe
	.word	0x13be
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_CONSOLE_DISPLAY_STATE\0"
	.byte	0xe
	.word	0x13bf
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ALLOW_DISPLAY_REQUIRED\0"
	.byte	0xe
	.word	0x13c0
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_VIDEO_CONSOLE_LOCK_TIMEOUT\0"
	.byte	0xe
	.word	0x13c1
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ADAPTIVE_POWER_BEHAVIOR_SUBGROUP\0"
	.byte	0xe
	.word	0x13c2
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_NON_ADAPTIVE_INPUT_TIMEOUT\0"
	.byte	0xe
	.word	0x13c3
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_SUBGROUP\0"
	.byte	0xe
	.word	0x13c4
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_POWERDOWN_TIMEOUT\0"
	.byte	0xe
	.word	0x13c5
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_IDLE_TIMEOUT\0"
	.byte	0xe
	.word	0x13c6
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_BURST_IGNORE_THRESHOLD\0"
	.byte	0xe
	.word	0x13c7
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DISK_ADAPTIVE_POWERDOWN\0"
	.byte	0xe
	.word	0x13c8
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SLEEP_SUBGROUP\0"
	.byte	0xe
	.word	0x13c9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SLEEP_IDLE_THRESHOLD\0"
	.byte	0xe
	.word	0x13ca
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_STANDBY_TIMEOUT\0"
	.byte	0xe
	.word	0x13cb
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_UNATTEND_SLEEP_TIMEOUT\0"
	.byte	0xe
	.word	0x13cc
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_HIBERNATE_TIMEOUT\0"
	.byte	0xe
	.word	0x13cd
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_HIBERNATE_FASTS4_POLICY\0"
	.byte	0xe
	.word	0x13ce
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_CRITICAL_POWER_TRANSITION\0"
	.byte	0xe
	.word	0x13cf
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SYSTEM_AWAYMODE\0"
	.byte	0xe
	.word	0x13d0
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ALLOW_AWAYMODE\0"
	.byte	0xe
	.word	0x13d1
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ALLOW_STANDBY_STATES\0"
	.byte	0xe
	.word	0x13d2
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ALLOW_RTC_WAKE\0"
	.byte	0xe
	.word	0x13d3
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ALLOW_SYSTEM_REQUIRED\0"
	.byte	0xe
	.word	0x13d4
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SYSTEM_BUTTON_SUBGROUP\0"
	.byte	0xe
	.word	0x13d5
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_POWERBUTTON_ACTION\0"
	.byte	0xe
	.word	0x13d6
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SLEEPBUTTON_ACTION\0"
	.byte	0xe
	.word	0x13d7
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_USERINTERFACEBUTTON_ACTION\0"
	.byte	0xe
	.word	0x13d8
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_LIDCLOSE_ACTION\0"
	.byte	0xe
	.word	0x13d9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_LIDOPEN_POWERSTATE\0"
	.byte	0xe
	.word	0x13da
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_SUBGROUP\0"
	.byte	0xe
	.word	0x13db
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_0\0"
	.byte	0xe
	.word	0x13dc
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_0\0"
	.byte	0xe
	.word	0x13dd
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_0\0"
	.byte	0xe
	.word	0x13de
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_1\0"
	.byte	0xe
	.word	0x13df
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_1\0"
	.byte	0xe
	.word	0x13e0
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_1\0"
	.byte	0xe
	.word	0x13e1
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_2\0"
	.byte	0xe
	.word	0x13e2
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_2\0"
	.byte	0xe
	.word	0x13e3
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_2\0"
	.byte	0xe
	.word	0x13e4
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_ACTION_3\0"
	.byte	0xe
	.word	0x13e5
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_LEVEL_3\0"
	.byte	0xe
	.word	0x13e6
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_DISCHARGE_FLAGS_3\0"
	.byte	0xe
	.word	0x13e7
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_SETTINGS_SUBGROUP\0"
	.byte	0xe
	.word	0x13e8
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_THROTTLE_POLICY\0"
	.byte	0xe
	.word	0x13e9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_THROTTLE_MAXIMUM\0"
	.byte	0xe
	.word	0x13ea
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_THROTTLE_MINIMUM\0"
	.byte	0xe
	.word	0x13eb
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_ALLOW_THROTTLING\0"
	.byte	0xe
	.word	0x13ec
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLESTATE_POLICY\0"
	.byte	0xe
	.word	0x13ed
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERFSTATE_POLICY\0"
	.byte	0xe
	.word	0x13ee
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_INCREASE_THRESHOLD\0"
	.byte	0xe
	.word	0x13ef
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_DECREASE_THRESHOLD\0"
	.byte	0xe
	.word	0x13f0
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_INCREASE_POLICY\0"
	.byte	0xe
	.word	0x13f1
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_DECREASE_POLICY\0"
	.byte	0xe
	.word	0x13f2
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_INCREASE_TIME\0"
	.byte	0xe
	.word	0x13f3
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_DECREASE_TIME\0"
	.byte	0xe
	.word	0x13f4
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_TIME_CHECK\0"
	.byte	0xe
	.word	0x13f5
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_BOOST_POLICY\0"
	.byte	0xe
	.word	0x13f6
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_BOOST_MODE\0"
	.byte	0xe
	.word	0x13f7
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_ALLOW_SCALING\0"
	.byte	0xe
	.word	0x13f8
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_DISABLE\0"
	.byte	0xe
	.word	0x13f9
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_STATE_MAXIMUM\0"
	.byte	0xe
	.word	0x13fa
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_TIME_CHECK\0"
	.byte	0xe
	.word	0x13fb
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_DEMOTE_THRESHOLD\0"
	.byte	0xe
	.word	0x13fc
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_IDLE_PROMOTE_THRESHOLD\0"
	.byte	0xe
	.word	0x13fd
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_THRESHOLD\0"
	.byte	0xe
	.word	0x13fe
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_THRESHOLD\0"
	.byte	0xe
	.word	0x13ff
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_POLICY\0"
	.byte	0xe
	.word	0x1400
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_POLICY\0"
	.byte	0xe
	.word	0x1401
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_MAX_CORES\0"
	.byte	0xe
	.word	0x1402
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_MIN_CORES\0"
	.byte	0xe
	.word	0x1403
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_INCREASE_TIME\0"
	.byte	0xe
	.word	0x1404
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_DECREASE_TIME\0"
	.byte	0xe
	.word	0x1405
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_DECREASE_FACTOR\0"
	.byte	0xe
	.word	0x1406
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_THRESHOLD\0"
	.byte	0xe
	.word	0x1407
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_AFFINITY_WEIGHTING\0"
	.byte	0xe
	.word	0x1408
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_DECREASE_FACTOR\0"
	.byte	0xe
	.word	0x1409
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_THRESHOLD\0"
	.byte	0xe
	.word	0x140a
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_WEIGHTING\0"
	.byte	0xe
	.word	0x140b
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_THRESHOLD\0"
	.byte	0xe
	.word	0x140c
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PARKING_CORE_OVERRIDE\0"
	.byte	0xe
	.word	0x140d
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PARKING_PERF_STATE\0"
	.byte	0xe
	.word	0x140e
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PARKING_CONCURRENCY_THRESHOLD\0"
	.byte	0xe
	.word	0x140f
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PARKING_HEADROOM_THRESHOLD\0"
	.byte	0xe
	.word	0x1410
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_HISTORY\0"
	.byte	0xe
	.word	0x1411
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_PERF_LATENCY_HINT\0"
	.byte	0xe
	.word	0x1412
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PROCESSOR_DISTRIBUTE_UTILITY\0"
	.byte	0xe
	.word	0x1413
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SYSTEM_COOLING_POLICY\0"
	.byte	0xe
	.word	0x1414
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_LOCK_CONSOLE_ON_WAKE\0"
	.byte	0xe
	.word	0x1415
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_DEVICE_IDLE_POLICY\0"
	.byte	0xe
	.word	0x1416
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ACDC_POWER_SOURCE\0"
	.byte	0xe
	.word	0x1417
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_LIDSWITCH_STATE_CHANGE\0"
	.byte	0xe
	.word	0x1418
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BATTERY_PERCENTAGE_REMAINING\0"
	.byte	0xe
	.word	0x1419
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_GLOBAL_USER_PRESENCE\0"
	.byte	0xe
	.word	0x141a
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SESSION_DISPLAY_STATUS\0"
	.byte	0xe
	.word	0x141b
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_SESSION_USER_PRESENCE\0"
	.byte	0xe
	.word	0x141c
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_IDLE_BACKGROUND_TASK\0"
	.byte	0xe
	.word	0x141d
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_BACKGROUND_TASK_NOTIFICATION\0"
	.byte	0xe
	.word	0x141e
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_APPLAUNCH_BUTTON\0"
	.byte	0xe
	.word	0x141f
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PCIEXPRESS_SETTINGS_SUBGROUP\0"
	.byte	0xe
	.word	0x1420
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_PCIEXPRESS_ASPM_POLICY\0"
	.byte	0xe
	.word	0x1421
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_ENABLE_SWITCH_FORCED_SHUTDOWN\0"
	.byte	0xe
	.word	0x1422
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_PERFSTATE_CHANGE_GUID\0"
	.byte	0xe
	.word	0x1620
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_PERFSTATE_DOMAIN_CHANGE_GUID\0"
	.byte	0xe
	.word	0x1621
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_IDLESTATE_CHANGE_GUID\0"
	.byte	0xe
	.word	0x1622
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_PERFSTATES_DATA_GUID\0"
	.byte	0xe
	.word	0x1623
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_IDLESTATES_DATA_GUID\0"
	.byte	0xe
	.word	0x1624
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_IDLE_ACCOUNTING_GUID\0"
	.byte	0xe
	.word	0x1625
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_IDLE_ACCOUNTING_EX_GUID\0"
	.byte	0xe
	.word	0x1626
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_THERMALCONSTRAINT_GUID\0"
	.byte	0xe
	.word	0x1627
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_PERFMON_PERFSTATE_GUID\0"
	.byte	0xe
	.word	0x1628
	.byte	0x5
	.long	0xba0
	.uleb128 0x11
	.ascii "PPM_THERMAL_POLICY_CHANGE_GUID\0"
	.byte	0xe
	.word	0x1629
	.byte	0x5
	.long	0xba0
	.uleb128 0x12
	.ascii "_SYSTEMTIME\0"
	.byte	0x10
	.byte	0xf
	.byte	0x31
	.byte	0x12
	.long	0x219e
	.uleb128 0x13
	.ascii "wYear\0"
	.byte	0xf
	.byte	0x32
	.byte	0xa
	.long	0x9bb
	.byte	0
	.uleb128 0x13
	.ascii "wMonth\0"
	.byte	0xf
	.byte	0x33
	.byte	0xa
	.long	0x9bb
	.byte	0x2
	.uleb128 0x13
	.ascii "wDayOfWeek\0"
	.byte	0xf
	.byte	0x34
	.byte	0xa
	.long	0x9bb
	.byte	0x4
	.uleb128 0x13
	.ascii "wDay\0"
	.byte	0xf
	.byte	0x35
	.byte	0xa
	.long	0x9bb
	.byte	0x6
	.uleb128 0x13
	.ascii "wHour\0"
	.byte	0xf
	.byte	0x36
	.byte	0xa
	.long	0x9bb
	.byte	0x8
	.uleb128 0x13
	.ascii "wMinute\0"
	.byte	0xf
	.byte	0x37
	.byte	0xa
	.long	0x9bb
	.byte	0xa
	.uleb128 0x13
	.ascii "wSecond\0"
	.byte	0xf
	.byte	0x38
	.byte	0xa
	.long	0x9bb
	.byte	0xc
	.uleb128 0x13
	.ascii "wMilliseconds\0"
	.byte	0xf
	.byte	0x39
	.byte	0xa
	.long	0x9bb
	.byte	0xe
	.byte	0
	.uleb128 0x3
	.ascii "SYSTEMTIME\0"
	.byte	0xf
	.byte	0x3a
	.byte	0x5
	.long	0x20ff
	.uleb128 0x19
	.byte	0x4
	.byte	0x10
	.byte	0x15
	.byte	0x16
	.long	0x21ee
	.uleb128 0x13
	.ascii "wProcessorArchitecture\0"
	.byte	0x10
	.byte	0x16
	.byte	0x7
	.long	0x9bb
	.byte	0
	.uleb128 0x13
	.ascii "wReserved\0"
	.byte	0x10
	.byte	0x17
	.byte	0x7
	.long	0x9bb
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.byte	0x10
	.byte	0x13
	.byte	0x14
	.long	0x220d
	.uleb128 0x1b
	.ascii "dwOemId\0"
	.byte	0x10
	.byte	0x14
	.byte	0xd
	.long	0x9c8
	.uleb128 0x1c
	.long	0x21b1
	.byte	0
	.uleb128 0x12
	.ascii "_SYSTEM_INFO\0"
	.byte	0x30
	.byte	0x10
	.byte	0x12
	.byte	0x12
	.long	0x2334
	.uleb128 0x1d
	.long	0x21ee
	.byte	0
	.uleb128 0x13
	.ascii "dwPageSize\0"
	.byte	0x10
	.byte	0x1a
	.byte	0xb
	.long	0x9c8
	.byte	0x4
	.uleb128 0x13
	.ascii "lpMinimumApplicationAddress\0"
	.byte	0x10
	.byte	0x1b
	.byte	0xc
	.long	0x9d6
	.byte	0x8
	.uleb128 0x13
	.ascii "lpMaximumApplicationAddress\0"
	.byte	0x10
	.byte	0x1c
	.byte	0xc
	.long	0x9d6
	.byte	0x10
	.uleb128 0x13
	.ascii "dwActiveProcessorMask\0"
	.byte	0x10
	.byte	0x1d
	.byte	0xf
	.long	0xb25
	.byte	0x18
	.uleb128 0x13
	.ascii "dwNumberOfProcessors\0"
	.byte	0x10
	.byte	0x1e
	.byte	0xb
	.long	0x9c8
	.byte	0x20
	.uleb128 0x13
	.ascii "dwProcessorType\0"
	.byte	0x10
	.byte	0x1f
	.byte	0xb
	.long	0x9c8
	.byte	0x24
	.uleb128 0x13
	.ascii "dwAllocationGranularity\0"
	.byte	0x10
	.byte	0x20
	.byte	0xb
	.long	0x9c8
	.byte	0x28
	.uleb128 0x13
	.ascii "wProcessorLevel\0"
	.byte	0x10
	.byte	0x21
	.byte	0xa
	.long	0x9bb
	.byte	0x2c
	.uleb128 0x13
	.ascii "wProcessorRevision\0"
	.byte	0x10
	.byte	0x22
	.byte	0xa
	.long	0x9bb
	.byte	0x2e
	.byte	0
	.uleb128 0x3
	.ascii "SYSTEM_INFO\0"
	.byte	0x10
	.byte	0x23
	.byte	0x5
	.long	0x220d
	.uleb128 0x3
	.ascii "RPC_IF_HANDLE\0"
	.byte	0x11
	.byte	0x42
	.byte	0x11
	.long	0x9b9
	.uleb128 0x6
	.byte	0x8
	.long	0x893
	.uleb128 0x10
	.ascii "IWinTypesBase_v0_1_c_ifspec\0"
	.byte	0x12
	.byte	0x29
	.byte	0x16
	.long	0x2348
	.uleb128 0x10
	.ascii "IWinTypesBase_v0_1_s_ifspec\0"
	.byte	0x12
	.byte	0x2a
	.byte	0x16
	.long	0x2348
	.uleb128 0x10
	.ascii "IID_IUnknown\0"
	.byte	0x13
	.byte	0x57
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IID_AsyncIUnknown\0"
	.byte	0x13
	.byte	0xbd
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IClassFactory\0"
	.byte	0x13
	.word	0x16d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMarshal\0"
	.byte	0x14
	.word	0x16e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_INoMarshal\0"
	.byte	0x14
	.word	0x255
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAgileObject\0"
	.byte	0x14
	.word	0x294
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAgileReference\0"
	.byte	0x14
	.word	0x2d2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMarshal2\0"
	.byte	0x14
	.word	0x32d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMalloc\0"
	.byte	0x14
	.word	0x3b2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IStdMarshalInfo\0"
	.byte	0x14
	.word	0x469
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IExternalConnection\0"
	.byte	0x14
	.word	0x4cc
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMultiQI\0"
	.byte	0x14
	.word	0x547
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_AsyncIMultiQI\0"
	.byte	0x14
	.word	0x59e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternalUnknown\0"
	.byte	0x14
	.word	0x60c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumUnknown\0"
	.byte	0x14
	.word	0x668
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumString\0"
	.byte	0x14
	.word	0x706
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISequentialStream\0"
	.byte	0x14
	.word	0x7a2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IStream\0"
	.byte	0x14
	.word	0x84d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcChannelBuffer\0"
	.byte	0x14
	.word	0x991
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcChannelBuffer2\0"
	.byte	0x14
	.word	0xa3b
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAsyncRpcChannelBuffer\0"
	.byte	0x14
	.word	0xabd
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcChannelBuffer3\0"
	.byte	0x14
	.word	0xb7f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcSyntaxNegotiate\0"
	.byte	0x14
	.word	0xc99
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcProxyBuffer\0"
	.byte	0x14
	.word	0xcee
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcStubBuffer\0"
	.byte	0x14
	.word	0xd56
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPSFactoryBuffer\0"
	.byte	0x14
	.word	0xe1c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IChannelHook\0"
	.byte	0x14
	.word	0xe9f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IClientSecurity\0"
	.byte	0x14
	.word	0xfc3
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IServerSecurity\0"
	.byte	0x14
	.word	0x106d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcOptions\0"
	.byte	0x14
	.word	0x1113
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IGlobalOptions\0"
	.byte	0x14
	.word	0x11ae
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISurrogate\0"
	.byte	0x14
	.word	0x1221
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IGlobalInterfaceTable\0"
	.byte	0x14
	.word	0x1289
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISynchronize\0"
	.byte	0x14
	.word	0x1312
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISynchronizeHandle\0"
	.byte	0x14
	.word	0x138c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISynchronizeEvent\0"
	.byte	0x14
	.word	0x13e1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISynchronizeContainer\0"
	.byte	0x14
	.word	0x1441
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISynchronizeMutex\0"
	.byte	0x14
	.word	0x14af
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICancelMethodCalls\0"
	.byte	0x14
	.word	0x151e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAsyncManager\0"
	.byte	0x14
	.word	0x158a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICallFactory\0"
	.byte	0x14
	.word	0x1608
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRpcHelper\0"
	.byte	0x14
	.word	0x1666
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IReleaseMarshalBuffers\0"
	.byte	0x14
	.word	0x16d1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWaitMultiple\0"
	.byte	0x14
	.word	0x172c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAddrTrackingControl\0"
	.byte	0x14
	.word	0x1798
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAddrExclusionControl\0"
	.byte	0x14
	.word	0x17fd
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPipeByte\0"
	.byte	0x14
	.word	0x1868
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPipeLong\0"
	.byte	0x14
	.word	0x18d9
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPipeDouble\0"
	.byte	0x14
	.word	0x194a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IComThreadingInfo\0"
	.byte	0x14
	.word	0x1b24
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IProcessInitControl\0"
	.byte	0x14
	.word	0x1bb2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IFastRundown\0"
	.byte	0x14
	.word	0x1c07
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMarshalingStream\0"
	.byte	0x14
	.word	0x1c4a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICallbackWithNoReentrancyToApplicationSTA\0"
	.byte	0x14
	.word	0x1d09
	.byte	0x16
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_NULL\0"
	.byte	0x15
	.byte	0xd
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "CATID_MARSHALER\0"
	.byte	0x15
	.byte	0xe
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IRpcChannel\0"
	.byte	0x15
	.byte	0xf
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IRpcStub\0"
	.byte	0x15
	.byte	0x10
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IStubManager\0"
	.byte	0x15
	.byte	0x11
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IRpcProxy\0"
	.byte	0x15
	.byte	0x12
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IProxyManager\0"
	.byte	0x15
	.byte	0x13
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IPSFactory\0"
	.byte	0x15
	.byte	0x14
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IInternalMoniker\0"
	.byte	0x15
	.byte	0x15
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IDfReserved1\0"
	.byte	0x15
	.byte	0x16
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IDfReserved2\0"
	.byte	0x15
	.byte	0x17
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IDfReserved3\0"
	.byte	0x15
	.byte	0x18
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "CLSID_StdMarshal\0"
	.byte	0x15
	.byte	0x19
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_AggStdMarshal\0"
	.byte	0x15
	.byte	0x1a
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_StdAsyncActManager\0"
	.byte	0x15
	.byte	0x1b
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "IID_IStub\0"
	.byte	0x15
	.byte	0x1c
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IProxy\0"
	.byte	0x15
	.byte	0x1d
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IEnumGeneric\0"
	.byte	0x15
	.byte	0x1e
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IEnumHolder\0"
	.byte	0x15
	.byte	0x1f
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IEnumCallback\0"
	.byte	0x15
	.byte	0x20
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IOleManager\0"
	.byte	0x15
	.byte	0x21
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IOlePresObj\0"
	.byte	0x15
	.byte	0x22
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IDebug\0"
	.byte	0x15
	.byte	0x23
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "IID_IDebugStream\0"
	.byte	0x15
	.byte	0x24
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "CLSID_PSGenObject\0"
	.byte	0x15
	.byte	0x25
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSClientSite\0"
	.byte	0x15
	.byte	0x26
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSClassObject\0"
	.byte	0x15
	.byte	0x27
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSInPlaceActive\0"
	.byte	0x15
	.byte	0x28
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSInPlaceFrame\0"
	.byte	0x15
	.byte	0x29
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSDragDrop\0"
	.byte	0x15
	.byte	0x2a
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSBindCtx\0"
	.byte	0x15
	.byte	0x2b
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_PSEnumerators\0"
	.byte	0x15
	.byte	0x2c
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_StaticMetafile\0"
	.byte	0x15
	.byte	0x2d
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_StaticDib\0"
	.byte	0x15
	.byte	0x2e
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CID_CDfsVolume\0"
	.byte	0x15
	.byte	0x2f
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_DCOMAccessControl\0"
	.byte	0x15
	.byte	0x30
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_GlobalOptions\0"
	.byte	0x15
	.byte	0x31
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_StdGlobalInterfaceTable\0"
	.byte	0x15
	.byte	0x32
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_ComBinding\0"
	.byte	0x15
	.byte	0x33
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_StdEvent\0"
	.byte	0x15
	.byte	0x34
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_ManualResetEvent\0"
	.byte	0x15
	.byte	0x35
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_SynchronizeContainer\0"
	.byte	0x15
	.byte	0x36
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_AddrControl\0"
	.byte	0x15
	.byte	0x37
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDFormKrnl\0"
	.byte	0x15
	.byte	0x38
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDPropertyPage\0"
	.byte	0x15
	.byte	0x39
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDFormDialog\0"
	.byte	0x15
	.byte	0x3a
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDCommandButton\0"
	.byte	0x15
	.byte	0x3b
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDComboBox\0"
	.byte	0x15
	.byte	0x3c
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDTextBox\0"
	.byte	0x15
	.byte	0x3d
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDCheckBox\0"
	.byte	0x15
	.byte	0x3e
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDLabel\0"
	.byte	0x15
	.byte	0x3f
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDOptionButton\0"
	.byte	0x15
	.byte	0x40
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDListBox\0"
	.byte	0x15
	.byte	0x41
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDScrollBar\0"
	.byte	0x15
	.byte	0x42
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDGroupBox\0"
	.byte	0x15
	.byte	0x43
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDGeneralPropertyPage\0"
	.byte	0x15
	.byte	0x44
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDGenericPropertyPage\0"
	.byte	0x15
	.byte	0x45
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDFontPropertyPage\0"
	.byte	0x15
	.byte	0x46
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDColorPropertyPage\0"
	.byte	0x15
	.byte	0x47
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDLabelPropertyPage\0"
	.byte	0x15
	.byte	0x48
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDCheckBoxPropertyPage\0"
	.byte	0x15
	.byte	0x49
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDTextBoxPropertyPage\0"
	.byte	0x15
	.byte	0x4a
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDOptionButtonPropertyPage\0"
	.byte	0x15
	.byte	0x4b
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDListBoxPropertyPage\0"
	.byte	0x15
	.byte	0x4c
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDCommandButtonPropertyPage\0"
	.byte	0x15
	.byte	0x4d
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDComboBoxPropertyPage\0"
	.byte	0x15
	.byte	0x4e
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDScrollBarPropertyPage\0"
	.byte	0x15
	.byte	0x4f
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDGroupBoxPropertyPage\0"
	.byte	0x15
	.byte	0x50
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CCDXObjectPropertyPage\0"
	.byte	0x15
	.byte	0x51
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CStdPropertyFrame\0"
	.byte	0x15
	.byte	0x52
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CFormPropertyPage\0"
	.byte	0x15
	.byte	0x53
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CGridPropertyPage\0"
	.byte	0x15
	.byte	0x54
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CWSJArticlePage\0"
	.byte	0x15
	.byte	0x55
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_CSystemPage\0"
	.byte	0x15
	.byte	0x56
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_IdentityUnmarshal\0"
	.byte	0x15
	.byte	0x57
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_InProcFreeMarshaler\0"
	.byte	0x15
	.byte	0x58
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_Picture_Metafile\0"
	.byte	0x15
	.byte	0x59
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_Picture_EnhMetafile\0"
	.byte	0x15
	.byte	0x5a
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "CLSID_Picture_Dib\0"
	.byte	0x15
	.byte	0x5b
	.byte	0x16
	.long	0xbc4
	.uleb128 0x10
	.ascii "GUID_TRISTATE\0"
	.byte	0x15
	.byte	0x5c
	.byte	0x15
	.long	0xba0
	.uleb128 0x10
	.ascii "IWinTypes_v0_1_c_ifspec\0"
	.byte	0x16
	.byte	0x28
	.byte	0x16
	.long	0x2348
	.uleb128 0x10
	.ascii "IWinTypes_v0_1_s_ifspec\0"
	.byte	0x16
	.byte	0x29
	.byte	0x16
	.long	0x2348
	.uleb128 0x11
	.ascii "IID_IMallocSpy\0"
	.byte	0x17
	.word	0x1dbd
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindCtx\0"
	.byte	0x17
	.word	0x1f3a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumMoniker\0"
	.byte	0x17
	.word	0x204a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRunnableObject\0"
	.byte	0x17
	.word	0x20e8
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRunningObjectTable\0"
	.byte	0x17
	.word	0x218e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPersist\0"
	.byte	0x17
	.word	0x2269
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPersistStream\0"
	.byte	0x17
	.word	0x22be
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMoniker\0"
	.byte	0x17
	.word	0x236a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IROTData\0"
	.byte	0x17
	.word	0x2558
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumSTATSTG\0"
	.byte	0x17
	.word	0x25b5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IStorage\0"
	.byte	0x17
	.word	0x2658
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPersistFile\0"
	.byte	0x17
	.word	0x2841
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPersistStorage\0"
	.byte	0x17
	.word	0x28f1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ILockBytes\0"
	.byte	0x17
	.word	0x29b1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumFORMATETC\0"
	.byte	0x17
	.word	0x2ac0
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumSTATDATA\0"
	.byte	0x17
	.word	0x2b6c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRootStorage\0"
	.byte	0x17
	.word	0x2c08
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAdviseSink\0"
	.byte	0x17
	.word	0x2cb3
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_AsyncIAdviseSink\0"
	.byte	0x17
	.word	0x2d73
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAdviseSink2\0"
	.byte	0x17
	.word	0x2ea9
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_AsyncIAdviseSink2\0"
	.byte	0x17
	.word	0x2f2e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDataObject\0"
	.byte	0x17
	.word	0x2ff4
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDataAdviseHolder\0"
	.byte	0x17
	.word	0x3118
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMessageFilter\0"
	.byte	0x17
	.word	0x31d3
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "FMTID_SummaryInformation\0"
	.byte	0x17
	.word	0x325d
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_DocSummaryInformation\0"
	.byte	0x17
	.word	0x325f
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_UserDefinedProperties\0"
	.byte	0x17
	.word	0x3261
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_DiscardableInformation\0"
	.byte	0x17
	.word	0x3263
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_ImageSummaryInformation\0"
	.byte	0x17
	.word	0x3265
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_AudioSummaryInformation\0"
	.byte	0x17
	.word	0x3267
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_VideoSummaryInformation\0"
	.byte	0x17
	.word	0x3269
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "FMTID_MediaFileSummaryInformation\0"
	.byte	0x17
	.word	0x326b
	.byte	0x14
	.long	0xbd7
	.uleb128 0x11
	.ascii "IID_IClassActivator\0"
	.byte	0x17
	.word	0x3273
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IFillLockBytes\0"
	.byte	0x17
	.word	0x32d5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IProgressNotify\0"
	.byte	0x17
	.word	0x3389
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ILayoutStorage\0"
	.byte	0x17
	.word	0x33ee
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBlockingLock\0"
	.byte	0x17
	.word	0x3492
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITimeAndNoticeControl\0"
	.byte	0x17
	.word	0x34f7
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOplockStorage\0"
	.byte	0x17
	.word	0x354e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDirectWriterLock\0"
	.byte	0x17
	.word	0x35d5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IUrlMon\0"
	.byte	0x17
	.word	0x364d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IForegroundTransfer\0"
	.byte	0x17
	.word	0x36bc
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IThumbnailExtractor\0"
	.byte	0x17
	.word	0x3710
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDummyHICONIncluder\0"
	.byte	0x17
	.word	0x3786
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IProcessLock\0"
	.byte	0x17
	.word	0x37e5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISurrogateService\0"
	.byte	0x17
	.word	0x3848
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInitializeSpy\0"
	.byte	0x17
	.word	0x38f2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IApartmentShutdown\0"
	.byte	0x17
	.word	0x398a
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IID_IOleAdviseHolder\0"
	.byte	0x18
	.byte	0xab
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleCache\0"
	.byte	0x18
	.word	0x162
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleCache2\0"
	.byte	0x18
	.word	0x229
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleCacheControl\0"
	.byte	0x18
	.word	0x2d4
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IParseDisplayName\0"
	.byte	0x18
	.word	0x33c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleContainer\0"
	.byte	0x18
	.word	0x39c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleClientSite\0"
	.byte	0x18
	.word	0x417
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleObject\0"
	.byte	0x18
	.word	0x4fe
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IOLETypes_v0_0_c_ifspec\0"
	.byte	0x18
	.word	0x6fe
	.byte	0x16
	.long	0x2348
	.uleb128 0x11
	.ascii "IOLETypes_v0_0_s_ifspec\0"
	.byte	0x18
	.word	0x6ff
	.byte	0x16
	.long	0x2348
	.uleb128 0x11
	.ascii "IID_IOleWindow\0"
	.byte	0x18
	.word	0x724
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleLink\0"
	.byte	0x18
	.word	0x79a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleItemContainer\0"
	.byte	0x18
	.word	0x8bf
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleInPlaceUIWindow\0"
	.byte	0x18
	.word	0x976
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleInPlaceActiveObject\0"
	.byte	0x18
	.word	0xa1c
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleInPlaceFrame\0"
	.byte	0x18
	.word	0xaf8
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleInPlaceObject\0"
	.byte	0x18
	.word	0xbf1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IOleInPlaceSite\0"
	.byte	0x18
	.word	0xc91
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IContinue\0"
	.byte	0x18
	.word	0xda4
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IViewObject\0"
	.byte	0x18
	.word	0xdf9
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IViewObject2\0"
	.byte	0x18
	.word	0xf2a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDropSource\0"
	.byte	0x18
	.word	0xfd2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDropTarget\0"
	.byte	0x18
	.word	0x105b
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDropSourceNotify\0"
	.byte	0x18
	.word	0x10ff
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumOLEVERB\0"
	.byte	0x18
	.word	0x1176
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IID_IServiceProvider\0"
	.byte	0x19
	.byte	0x4d
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IOleAutomationTypes_v1_0_c_ifspec\0"
	.byte	0x1a
	.byte	0xf1
	.byte	0x16
	.long	0x2348
	.uleb128 0x10
	.ascii "IOleAutomationTypes_v1_0_s_ifspec\0"
	.byte	0x1a
	.byte	0xf2
	.byte	0x16
	.long	0x2348
	.uleb128 0x11
	.ascii "IID_ICreateTypeInfo\0"
	.byte	0x1a
	.word	0x33b
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICreateTypeInfo2\0"
	.byte	0x1a
	.word	0x562
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICreateTypeLib\0"
	.byte	0x1a
	.word	0x7b2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICreateTypeLib2\0"
	.byte	0x1a
	.word	0x8ba
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDispatch\0"
	.byte	0x1a
	.word	0x9b6
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumVARIANT\0"
	.byte	0x1a
	.word	0xa87
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeComp\0"
	.byte	0x1a
	.word	0xb35
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeInfo\0"
	.byte	0x1a
	.word	0xbd9
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeInfo2\0"
	.byte	0x1a
	.word	0xe50
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeLib\0"
	.byte	0x1a
	.word	0x10d6
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeLib2\0"
	.byte	0x1a
	.word	0x123d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeChangeEvents\0"
	.byte	0x1a
	.word	0x1361
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IErrorInfo\0"
	.byte	0x1a
	.word	0x13da
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICreateErrorInfo\0"
	.byte	0x1a
	.word	0x147d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ISupportErrorInfo\0"
	.byte	0x1a
	.word	0x1520
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeFactory\0"
	.byte	0x1a
	.word	0x1575
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ITypeMarshal\0"
	.byte	0x1a
	.word	0x15d0
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IRecordInfo\0"
	.byte	0x1a
	.word	0x1684
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IErrorLog\0"
	.byte	0x1a
	.word	0x1820
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPropertyBag\0"
	.byte	0x1a
	.word	0x187a
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "__MIDL_itf_msxml_0000_v0_0_c_ifspec\0"
	.byte	0x1b
	.byte	0xeb
	.byte	0x18
	.long	0x2348
	.uleb128 0x10
	.ascii "__MIDL_itf_msxml_0000_v0_0_s_ifspec\0"
	.byte	0x1b
	.byte	0xec
	.byte	0x18
	.long	0x2348
	.uleb128 0x10
	.ascii "LIBID_MSXML\0"
	.byte	0x1b
	.byte	0xfc
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMImplementation\0"
	.byte	0x1b
	.word	0x100
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMNode\0"
	.byte	0x1b
	.word	0x127
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMDocumentFragment\0"
	.byte	0x1b
	.word	0x1fd
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMDocument\0"
	.byte	0x1b
	.word	0x266
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMNodeList\0"
	.byte	0x1b
	.word	0x375
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMNamedNodeMap\0"
	.byte	0x1b
	.word	0x3b0
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMCharacterData\0"
	.byte	0x1b
	.word	0x404
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMAttribute\0"
	.byte	0x1b
	.word	0x496
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMElement\0"
	.byte	0x1b
	.word	0x50f
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMText\0"
	.byte	0x1b
	.word	0x5a6
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMComment\0"
	.byte	0x1b
	.word	0x625
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMProcessingInstruction\0"
	.byte	0x1b
	.word	0x69e
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMCDATASection\0"
	.byte	0x1b
	.word	0x717
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMDocumentType\0"
	.byte	0x1b
	.word	0x792
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMNotation\0"
	.byte	0x1b
	.word	0x80b
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMEntity\0"
	.byte	0x1b
	.word	0x87f
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMEntityReference\0"
	.byte	0x1b
	.word	0x8f8
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDOMParseError\0"
	.byte	0x1b
	.word	0x961
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXTLRuntime\0"
	.byte	0x1b
	.word	0x9a6
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "DIID_XMLDOMDocumentEvents\0"
	.byte	0x1b
	.word	0xa3d
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_DOMDocument\0"
	.byte	0x1b
	.word	0xa5c
	.byte	0x18
	.long	0xbc4
	.uleb128 0x11
	.ascii "CLSID_DOMFreeThreadedDocument\0"
	.byte	0x1b
	.word	0xa60
	.byte	0x18
	.long	0xbc4
	.uleb128 0x11
	.ascii "IID_IXMLHttpRequest\0"
	.byte	0x1b
	.word	0xa67
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_XMLHTTPRequest\0"
	.byte	0x1b
	.word	0xacd
	.byte	0x18
	.long	0xbc4
	.uleb128 0x11
	.ascii "IID_IXMLDSOControl\0"
	.byte	0x1b
	.word	0xad4
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_XMLDSOControl\0"
	.byte	0x1b
	.word	0xb0d
	.byte	0x18
	.long	0xbc4
	.uleb128 0x11
	.ascii "IID_IXMLElementCollection\0"
	.byte	0x1b
	.word	0xb14
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDocument\0"
	.byte	0x1b
	.word	0xb4a
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLDocument2\0"
	.byte	0x1b
	.word	0xbb2
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLElement\0"
	.byte	0x1b
	.word	0xc24
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLElement2\0"
	.byte	0x1b
	.word	0xc82
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLAttribute\0"
	.byte	0x1b
	.word	0xce5
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IXMLError\0"
	.byte	0x1b
	.word	0xd11
	.byte	0x16
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_XMLDocument\0"
	.byte	0x1b
	.word	0xd2e
	.byte	0x18
	.long	0xbc4
	.uleb128 0x11
	.ascii "CLSID_SBS_StdURLMoniker\0"
	.byte	0x1c
	.word	0x17e
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_HttpProtocol\0"
	.byte	0x1c
	.word	0x17f
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_FtpProtocol\0"
	.byte	0x1c
	.word	0x180
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_GopherProtocol\0"
	.byte	0x1c
	.word	0x181
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_HttpSProtocol\0"
	.byte	0x1c
	.word	0x182
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_FileProtocol\0"
	.byte	0x1c
	.word	0x183
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_MkProtocol\0"
	.byte	0x1c
	.word	0x184
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_UrlMkBindCtx\0"
	.byte	0x1c
	.word	0x185
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_SoftDistExt\0"
	.byte	0x1c
	.word	0x186
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_CdlProtocol\0"
	.byte	0x1c
	.word	0x187
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_ClassInstallFilter\0"
	.byte	0x1c
	.word	0x188
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_InternetSecurityManager\0"
	.byte	0x1c
	.word	0x189
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_SBS_InternetZoneManager\0"
	.byte	0x1c
	.word	0x18a
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IAsyncMoniker\0"
	.byte	0x1c
	.word	0x193
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_StdURLMoniker\0"
	.byte	0x1c
	.word	0x194
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_HttpProtocol\0"
	.byte	0x1c
	.word	0x195
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_FtpProtocol\0"
	.byte	0x1c
	.word	0x196
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_GopherProtocol\0"
	.byte	0x1c
	.word	0x197
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_HttpSProtocol\0"
	.byte	0x1c
	.word	0x198
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_FileProtocol\0"
	.byte	0x1c
	.word	0x199
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_MkProtocol\0"
	.byte	0x1c
	.word	0x19a
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_StdURLProtocol\0"
	.byte	0x1c
	.word	0x19b
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_UrlMkBindCtx\0"
	.byte	0x1c
	.word	0x19c
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_CdlProtocol\0"
	.byte	0x1c
	.word	0x19d
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_ClassInstallFilter\0"
	.byte	0x1c
	.word	0x19e
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IAsyncBindCtx\0"
	.byte	0x1c
	.word	0x19f
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IPersistMoniker\0"
	.byte	0x1c
	.word	0x250
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IMonikerProp\0"
	.byte	0x1c
	.word	0x321
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindProtocol\0"
	.byte	0x1c
	.word	0x37f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBinding\0"
	.byte	0x1c
	.word	0x3e0
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindStatusCallback\0"
	.byte	0x1c
	.word	0x575
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindStatusCallbackEx\0"
	.byte	0x1c
	.word	0x6a5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAuthenticate\0"
	.byte	0x1c
	.word	0x764
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IAuthenticateEx\0"
	.byte	0x1c
	.word	0x7d0
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IHttpNegotiate\0"
	.byte	0x1c
	.word	0x841
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IHttpNegotiate2\0"
	.byte	0x1c
	.word	0x8c1
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IHttpNegotiate3\0"
	.byte	0x1c
	.word	0x93b
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWinInetFileStream\0"
	.byte	0x1c
	.word	0x9bf
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWindowForBindingUI\0"
	.byte	0x1c
	.word	0xa30
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICodeInstall\0"
	.byte	0x1c
	.word	0xa9b
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWinInetInfo\0"
	.byte	0x1c
	.word	0x10a5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IHttpSecurity\0"
	.byte	0x1c
	.word	0x1112
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWinInetHttpInfo\0"
	.byte	0x1c
	.word	0x1179
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWinInetHttpTimeouts\0"
	.byte	0x1c
	.word	0x11f8
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "SID_BindHost\0"
	.byte	0x1c
	.word	0x1335
	.byte	0x15
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindHost\0"
	.byte	0x1c
	.word	0x133f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternet\0"
	.byte	0x1c
	.word	0x144d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetBindInfo\0"
	.byte	0x1c
	.word	0x14ac
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetBindInfoEx\0"
	.byte	0x1c
	.word	0x1526
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetProtocolRoot\0"
	.byte	0x1c
	.word	0x15bf
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetProtocol\0"
	.byte	0x1c
	.word	0x1684
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetProtocolSink\0"
	.byte	0x1c
	.word	0x181a
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetProtocolSinkStackable\0"
	.byte	0x1c
	.word	0x18bd
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetSession\0"
	.byte	0x1c
	.word	0x193f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetThreadSwitch\0"
	.byte	0x1c
	.word	0x1a48
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetPriority\0"
	.byte	0x1c
	.word	0x1ab2
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetProtocolInfo\0"
	.byte	0x1c
	.word	0x1b4e
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "CLSID_InternetSecurityManager\0"
	.byte	0x1c
	.word	0x1cb2
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "CLSID_InternetZoneManager\0"
	.byte	0x1c
	.word	0x1cb3
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_IInternetSecurityMgrSite\0"
	.byte	0x1c
	.word	0x1ccb
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetSecurityManager\0"
	.byte	0x1c
	.word	0x1d69
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetHostSecurityManager\0"
	.byte	0x1c
	.word	0x210f
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IInternetZoneManager\0"
	.byte	0x1c
	.word	0x22c4
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "CLSID_SoftDistExt\0"
	.byte	0x1c
	.word	0x269c
	.byte	0x14
	.long	0xbb1
	.uleb128 0x11
	.ascii "IID_ISoftDistExt\0"
	.byte	0x1c
	.word	0x26cc
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_ICatalogFileInfo\0"
	.byte	0x1c
	.word	0x2778
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IDataFilter\0"
	.byte	0x1c
	.word	0x27e6
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEncodingFilterFactory\0"
	.byte	0x1c
	.word	0x28a6
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "GUID_CUSTOM_CONFIRMOBJECTSAFETY\0"
	.byte	0x1c
	.word	0x2933
	.byte	0x15
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IWrappedProtocol\0"
	.byte	0x1c
	.word	0x2941
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IGetBindHandle\0"
	.byte	0x1c
	.word	0x29a5
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IBindCallbackRedirect\0"
	.byte	0x1c
	.word	0x2a0d
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPropertyStorage\0"
	.byte	0x1d
	.word	0x1b7
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IPropertySetStorage\0"
	.byte	0x1d
	.word	0x304
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumSTATPROPSTG\0"
	.byte	0x1d
	.word	0x3a6
	.byte	0x1
	.long	0xba0
	.uleb128 0x11
	.ascii "IID_IEnumSTATPROPSETSTG\0"
	.byte	0x1d
	.word	0x444
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IID_StdOle\0"
	.byte	0x1e
	.byte	0x15
	.byte	0x14
	.long	0xbb1
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_DISK\0"
	.byte	0x1f
	.byte	0xc
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_CDROM\0"
	.byte	0x1f
	.byte	0xd
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_PARTITION\0"
	.byte	0x1f
	.byte	0xe
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_TAPE\0"
	.byte	0x1f
	.byte	0xf
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_WRITEONCEDISK\0"
	.byte	0x1f
	.byte	0x10
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_VOLUME\0"
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_MEDIUMCHANGER\0"
	.byte	0x1f
	.byte	0x12
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_FLOPPY\0"
	.byte	0x1f
	.byte	0x13
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_CDCHANGER\0"
	.byte	0x1f
	.byte	0x14
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_STORAGEPORT\0"
	.byte	0x1f
	.byte	0x15
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_COMPORT\0"
	.byte	0x1f
	.byte	0x16
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "GUID_DEVINTERFACE_SERENUM_BUS_ENUMERATOR\0"
	.byte	0x1f
	.byte	0x17
	.byte	0x1
	.long	0xba0
	.uleb128 0x12
	.ascii "_SCARD_IO_REQUEST\0"
	.byte	0x8
	.byte	0x20
	.byte	0xa1
	.byte	0x12
	.long	0x4d5b
	.uleb128 0x13
	.ascii "dwProtocol\0"
	.byte	0x20
	.byte	0xa2
	.byte	0xb
	.long	0x9c8
	.byte	0
	.uleb128 0x13
	.ascii "cbPciLength\0"
	.byte	0x20
	.byte	0xa3
	.byte	0xb
	.long	0x9c8
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.ascii "SCARD_IO_REQUEST\0"
	.byte	0x20
	.byte	0xa4
	.byte	0x5
	.long	0x4d16
	.uleb128 0x4
	.long	0x4d5b
	.uleb128 0x10
	.ascii "g_rgSCardT0Pci\0"
	.byte	0x21
	.byte	0x25
	.byte	0x2e
	.long	0x4d74
	.uleb128 0x10
	.ascii "g_rgSCardT1Pci\0"
	.byte	0x21
	.byte	0x25
	.byte	0x3d
	.long	0x4d74
	.uleb128 0x10
	.ascii "g_rgSCardRawPci\0"
	.byte	0x21
	.byte	0x25
	.byte	0x4c
	.long	0x4d74
	.uleb128 0x10
	.ascii "IID_IPrintDialogCallback\0"
	.byte	0x22
	.byte	0xe
	.byte	0x1
	.long	0xba0
	.uleb128 0x10
	.ascii "IID_IPrintDialogServices\0"
	.byte	0x22
	.byte	0xf
	.byte	0x1
	.long	0xba0
	.uleb128 0x1e
	.ascii "thread_count\0"
	.byte	0x1
	.byte	0x2a
	.byte	0x12
	.long	0xff
	.byte	0x6
	.uleb128 0x1f
	.ascii "points\0"
	.byte	0x1
	.byte	0x2b
	.byte	0x10
	.long	0x4ff
	.uleb128 0x9
	.byte	0x3
	.quad	points
	.uleb128 0x1f
	.ascii "n\0"
	.byte	0x1
	.byte	0x2c
	.byte	0xc
	.long	0xf8
	.uleb128 0x9
	.byte	0x3
	.quad	n
	.uleb128 0x1f
	.ascii "dim\0"
	.byte	0x1
	.byte	0x2c
	.byte	0xf
	.long	0xf8
	.uleb128 0x9
	.byte	0x3
	.quad	dim
	.uleb128 0x1f
	.ascii "nums_p\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.long	0xf8
	.uleb128 0x9
	.byte	0x3
	.quad	nums_p
	.uleb128 0x20
	.ascii "p_dot_id\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x1c
	.long	0xf8
	.uleb128 0x1f
	.ascii "m\0"
	.byte	0x1
	.byte	0x39
	.byte	0xc
	.long	0xf8
	.uleb128 0x9
	.byte	0x3
	.quad	m
	.uleb128 0x1e
	.ascii "count\0"
	.byte	0x1
	.byte	0x3a
	.byte	0xc
	.long	0xf8
	.byte	0
	.uleb128 0x1f
	.ascii "euclidean_distance\0"
	.byte	0x1
	.byte	0x3b
	.byte	0x10
	.long	0x4ff
	.uleb128 0x9
	.byte	0x3
	.quad	euclidean_distance
	.uleb128 0x19
	.byte	0x10
	.byte	0x1
	.byte	0x3d
	.byte	0x9
	.long	0x4ef1
	.uleb128 0x21
	.secrel32	.LASF1
	.byte	0x1
	.byte	0x3e
	.byte	0xa
	.long	0x441
	.byte	0
	.uleb128 0x13
	.ascii "cost\0"
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.long	0x90
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.ascii "combination\0"
	.byte	0x1
	.byte	0x40
	.byte	0x3
	.long	0x4ecc
	.uleb128 0x1f
	.ascii "object\0"
	.byte	0x1
	.byte	0x42
	.byte	0x15
	.long	0x4f1e
	.uleb128 0x9
	.byte	0x3
	.quad	object
	.uleb128 0x6
	.byte	0x8
	.long	0x4ef1
	.uleb128 0x1f
	.ascii "cache_eu_dist\0"
	.byte	0x1
	.byte	0x43
	.byte	0x10
	.long	0x4ff
	.uleb128 0x9
	.byte	0x3
	.quad	cache_eu_dist
	.uleb128 0x1e
	.ascii "run_times\0"
	.byte	0x1
	.byte	0x66
	.byte	0x16
	.long	0xbc
	.byte	0
	.uleb128 0x1f
	.ascii "__c_n_m\0"
	.byte	0x1
	.byte	0x76
	.byte	0xc
	.long	0xf8
	.uleb128 0x9
	.byte	0x3
	.quad	__c_n_m
	.uleb128 0x22
	.ascii "main\0"
	.byte	0x1
	.word	0x100
	.byte	0x5
	.long	0xf8
	.quad	.LFB5618
	.quad	.LFE5618-.LFB5618
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f30
	.uleb128 0x23
	.ascii "argc\0"
	.byte	0x1
	.word	0x100
	.byte	0xe
	.long	0xf8
	.secrel32	.LLST30
	.secrel32	.LVUS30
	.uleb128 0x23
	.ascii "argv\0"
	.byte	0x1
	.word	0x100
	.byte	0x1a
	.long	0x64b
	.secrel32	.LLST31
	.secrel32	.LVUS31
	.uleb128 0x24
	.ascii "DEBUG\0"
	.byte	0x1
	.word	0x102
	.byte	0x9
	.long	0xf8
	.byte	0
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x2f0
	.long	0x5e3b
	.uleb128 0x26
	.ascii "filename\0"
	.byte	0x1
	.word	0x105
	.byte	0xf
	.long	0x435
	.secrel32	.LLST32
	.secrel32	.LVUS32
	.uleb128 0x27
	.ascii "start\0"
	.byte	0x1
	.word	0x10c
	.byte	0x18
	.long	0x893
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x27
	.ascii "end\0"
	.byte	0x1
	.word	0x10c
	.byte	0x1f
	.long	0x893
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x26
	.ascii "M\0"
	.byte	0x1
	.word	0x10f
	.byte	0x13
	.long	0xff
	.secrel32	.LLST33
	.secrel32	.LVUS33
	.uleb128 0x26
	.ascii "file\0"
	.byte	0x1
	.word	0x110
	.byte	0xf
	.long	0x5f30
	.secrel32	.LLST34
	.secrel32	.LVUS34
	.uleb128 0x26
	.ascii "len\0"
	.byte	0x1
	.word	0x135
	.byte	0xd
	.long	0xf8
	.secrel32	.LLST35
	.secrel32	.LVUS35
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x330
	.long	0x50a6
	.uleb128 0x26
	.ascii "i\0"
	.byte	0x1
	.word	0x120
	.byte	0x12
	.long	0xf8
	.secrel32	.LLST36
	.secrel32	.LVUS36
	.uleb128 0x28
	.secrel32	.Ldebug_ranges0+0x380
	.uleb128 0x26
	.ascii "j\0"
	.byte	0x1
	.word	0x121
	.byte	0x16
	.long	0xf8
	.secrel32	.LLST37
	.secrel32	.LVUS37
	.uleb128 0x29
	.quad	.LVL82
	.long	0x65dc
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x3b0
	.long	0x514f
	.uleb128 0x26
	.ascii "i\0"
	.byte	0x1
	.word	0x12a
	.byte	0x12
	.long	0xf8
	.secrel32	.LLST40
	.secrel32	.LVUS40
	.uleb128 0x2b
	.long	0x6181
	.quad	.LBI223
	.word	.LVU310
	.secrel32	.Ldebug_ranges0+0x400
	.byte	0x1
	.word	0x12a
	.byte	0x1d
	.long	0x513a
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST41
	.secrel32	.LVUS41
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST42
	.secrel32	.LVUS42
	.uleb128 0x2d
	.long	0x6181
	.secrel32	.Ldebug_ranges0+0x440
	.uleb128 0x2e
	.long	0x619e
	.uleb128 0x2e
	.long	0x6194
	.uleb128 0x2d
	.long	0x61a8
	.secrel32	.Ldebug_ranges0+0x440
	.uleb128 0x2f
	.long	0x61a9
	.secrel32	.LLST43
	.secrel32	.LVUS43
	.uleb128 0x2d
	.long	0x61b8
	.secrel32	.Ldebug_ranges0+0x480
	.uleb128 0x2f
	.long	0x61b9
	.secrel32	.LLST44
	.secrel32	.LVUS44
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL97
	.long	0x65ef
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0
	.long	0x53c0
	.uleb128 0x30
	.ascii "i\0"
	.byte	0x1
	.word	0x138
	.byte	0x12
	.long	0xf8
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0
	.long	0x53ac
	.uleb128 0x30
	.ascii "tid\0"
	.byte	0x1
	.word	0x139
	.byte	0x11
	.long	0xf8
	.uleb128 0x30
	.ascii "d1\0"
	.byte	0x1
	.word	0x13a
	.byte	0x11
	.long	0xf8
	.uleb128 0x31
	.secrel32	.LASF1
	.byte	0x1
	.word	0x13b
	.byte	0x12
	.long	0x441
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x40
	.long	0x5260
	.uleb128 0x30
	.ascii "__m__\0"
	.byte	0x1
	.word	0x13c
	.byte	0x16
	.long	0xf8
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x90
	.long	0x5248
	.uleb128 0x30
	.ascii "d2\0"
	.byte	0x1
	.word	0x13d
	.byte	0x15
	.long	0xf8
	.uleb128 0x31
	.secrel32	.LASF2
	.byte	0x1
	.word	0x13e
	.byte	0x15
	.long	0xf8
	.uleb128 0x30
	.ascii "_d2\0"
	.byte	0x1
	.word	0x13f
	.byte	0x15
	.long	0xf8
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0xd0
	.long	0x5209
	.uleb128 0x30
	.ascii "__n__\0"
	.byte	0x1
	.word	0x140
	.byte	0x1a
	.long	0xf8
	.uleb128 0x26
	.ascii "__n__\0"
	.byte	0x1
	.word	0x140
	.byte	0x1a
	.long	0xf8
	.secrel32	.LLST10
	.secrel32	.LVUS10
	.byte	0
	.uleb128 0x26
	.ascii "d2\0"
	.byte	0x1
	.word	0x13d
	.byte	0x15
	.long	0xf8
	.secrel32	.LLST7
	.secrel32	.LVUS7
	.uleb128 0x32
	.secrel32	.LASF2
	.byte	0x1
	.word	0x13e
	.byte	0x15
	.long	0xf8
	.secrel32	.LLST8
	.secrel32	.LVUS8
	.uleb128 0x26
	.ascii "_d2\0"
	.byte	0x1
	.word	0x13f
	.byte	0x15
	.long	0xf8
	.secrel32	.LLST9
	.secrel32	.LVUS9
	.byte	0
	.uleb128 0x26
	.ascii "__m__\0"
	.byte	0x1
	.word	0x13c
	.byte	0x16
	.long	0xf8
	.secrel32	.LLST6
	.secrel32	.LVUS6
	.byte	0
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x120
	.long	0x537d
	.uleb128 0x30
	.ascii "__i__\0"
	.byte	0x1
	.word	0x145
	.byte	0x16
	.long	0xf8
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x150
	.long	0x5365
	.uleb128 0x30
	.ascii "bound\0"
	.byte	0x1
	.word	0x146
	.byte	0x15
	.long	0xf8
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0x180
	.long	0x534d
	.uleb128 0x30
	.ascii "__j__\0"
	.byte	0x1
	.word	0x147
	.byte	0x1a
	.long	0xf8
	.uleb128 0x26
	.ascii "__j__\0"
	.byte	0x1
	.word	0x147
	.byte	0x1a
	.long	0xf8
	.secrel32	.LLST13
	.secrel32	.LVUS13
	.uleb128 0x33
	.long	0x61c6
	.quad	.LBB111
	.quad	.LBE111-.LBB111
	.byte	0x1
	.word	0x148
	.byte	0x27
	.uleb128 0x2e
	.long	0x620c
	.uleb128 0x2e
	.long	0x61fc
	.uleb128 0x2e
	.long	0x61ec
	.uleb128 0x34
	.quad	.LBB112
	.quad	.LBE112-.LBB112
	.uleb128 0x2f
	.long	0x6218
	.secrel32	.LLST14
	.secrel32	.LVUS14
	.uleb128 0x35
	.long	0x6224
	.uleb128 0x2d
	.long	0x622f
	.secrel32	.Ldebug_ranges0+0x1c0
	.uleb128 0x2f
	.long	0x6230
	.secrel32	.LLST15
	.secrel32	.LVUS15
	.uleb128 0x2d
	.long	0x623a
	.secrel32	.Ldebug_ranges0+0x1f0
	.uleb128 0x35
	.long	0x623b
	.uleb128 0x2f
	.long	0x6247
	.secrel32	.LLST16
	.secrel32	.LVUS16
	.uleb128 0x2f
	.long	0x6253
	.secrel32	.LLST17
	.secrel32	.LVUS17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.ascii "bound\0"
	.byte	0x1
	.word	0x146
	.byte	0x15
	.long	0xf8
	.secrel32	.LLST12
	.secrel32	.LVUS12
	.byte	0
	.uleb128 0x26
	.ascii "__i__\0"
	.byte	0x1
	.word	0x145
	.byte	0x16
	.long	0xf8
	.secrel32	.LLST11
	.secrel32	.LVUS11
	.byte	0
	.uleb128 0x30
	.ascii "tid\0"
	.byte	0x1
	.word	0x139
	.byte	0x11
	.long	0xf8
	.uleb128 0x30
	.ascii "d1\0"
	.byte	0x1
	.word	0x13a
	.byte	0x11
	.long	0xf8
	.uleb128 0x32
	.secrel32	.LASF1
	.byte	0x1
	.word	0x13b
	.byte	0x12
	.long	0x441
	.secrel32	.LLST5
	.secrel32	.LVUS5
	.byte	0
	.uleb128 0x26
	.ascii "i\0"
	.byte	0x1
	.word	0x138
	.byte	0x12
	.long	0xf8
	.secrel32	.LLST4
	.secrel32	.LVUS4
	.byte	0
	.uleb128 0x25
	.secrel32	.Ldebug_ranges0+0xcf0
	.long	0x5462
	.uleb128 0x26
	.ascii "i\0"
	.byte	0x1
	.word	0x15a
	.byte	0x12
	.long	0xf8
	.secrel32	.LLST84
	.secrel32	.LVUS84
	.uleb128 0x2b
	.long	0x6181
	.quad	.LBI400
	.word	.LVU675
	.secrel32	.Ldebug_ranges0+0xd20
	.byte	0x1
	.word	0x15a
	.byte	0x1d
	.long	0x5454
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST85
	.secrel32	.LVUS85
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST86
	.secrel32	.LVUS86
	.uleb128 0x2d
	.long	0x6181
	.secrel32	.Ldebug_ranges0+0xd60
	.uleb128 0x2e
	.long	0x619e
	.uleb128 0x2e
	.long	0x6194
	.uleb128 0x2d
	.long	0x61a8
	.secrel32	.Ldebug_ranges0+0xd60
	.uleb128 0x2f
	.long	0x61a9
	.secrel32	.LLST87
	.secrel32	.LVUS87
	.uleb128 0x2d
	.long	0x61b8
	.secrel32	.Ldebug_ranges0+0xda0
	.uleb128 0x2f
	.long	0x61b9
	.secrel32	.LLST88
	.secrel32	.LVUS88
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x36
	.quad	.LVL217
	.long	0x6602
	.byte	0
	.uleb128 0x37
	.long	0x6181
	.quad	.LBI220
	.word	.LVU285
	.quad	.LBB220
	.quad	.LBE220-.LBB220
	.byte	0x1
	.word	0x129
	.byte	0x3e
	.long	0x54be
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST38
	.secrel32	.LVUS38
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST39
	.secrel32	.LVUS39
	.uleb128 0x29
	.quad	.LVL91
	.long	0x642e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x38
	.long	0x6263
	.secrel32	.Ldebug_ranges0+0x4b0
	.byte	0x1
	.word	0x130
	.byte	0x9
	.long	0x55d6
	.uleb128 0x2d
	.long	0x6291
	.secrel32	.Ldebug_ranges0+0x4b0
	.uleb128 0x2f
	.long	0x6292
	.secrel32	.LLST45
	.secrel32	.LVUS45
	.uleb128 0x2d
	.long	0x629c
	.secrel32	.Ldebug_ranges0+0x4f0
	.uleb128 0x2f
	.long	0x629d
	.secrel32	.LLST46
	.secrel32	.LVUS46
	.uleb128 0x39
	.long	0x62aa
	.quad	.LBI242
	.word	.LVU344
	.secrel32	.Ldebug_ranges0+0x540
	.byte	0x1
	.byte	0x60
	.byte	0x31
	.uleb128 0x2c
	.long	0x62d1
	.secrel32	.LLST47
	.secrel32	.LVUS47
	.uleb128 0x2c
	.long	0x62c5
	.secrel32	.LLST48
	.secrel32	.LVUS48
	.uleb128 0x28
	.secrel32	.Ldebug_ranges0+0x540
	.uleb128 0x2f
	.long	0x62dd
	.secrel32	.LLST49
	.secrel32	.LVUS49
	.uleb128 0x2d
	.long	0x62e9
	.secrel32	.Ldebug_ranges0+0x590
	.uleb128 0x2f
	.long	0x62ea
	.secrel32	.LLST50
	.secrel32	.LVUS50
	.uleb128 0x2d
	.long	0x62f4
	.secrel32	.Ldebug_ranges0+0x5f0
	.uleb128 0x2f
	.long	0x62f5
	.secrel32	.LLST51
	.secrel32	.LVUS51
	.uleb128 0x3a
	.long	0x6305
	.quad	.LBI246
	.word	.LVU352
	.secrel32	.Ldebug_ranges0+0x670
	.byte	0x1
	.byte	0x4f
	.byte	0x17
	.long	0x559e
	.uleb128 0x2c
	.long	0x6346
	.secrel32	.LLST52
	.secrel32	.LVUS52
	.uleb128 0x2c
	.long	0x633b
	.secrel32	.LLST53
	.secrel32	.LVUS53
	.byte	0
	.uleb128 0x39
	.long	0x6305
	.quad	.LBI259
	.word	.LVU355
	.secrel32	.Ldebug_ranges0+0x730
	.byte	0x1
	.byte	0x50
	.byte	0x17
	.uleb128 0x2c
	.long	0x6346
	.secrel32	.LLST54
	.secrel32	.LVUS54
	.uleb128 0x2c
	.long	0x633b
	.secrel32	.LLST55
	.secrel32	.LVUS55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x60f5
	.quad	.LBI311
	.word	.LVU417
	.secrel32	.Ldebug_ranges0+0x7e0
	.byte	0x1
	.word	0x132
	.byte	0x9
	.long	0x568e
	.uleb128 0x28
	.secrel32	.Ldebug_ranges0+0x7e0
	.uleb128 0x2f
	.long	0x6128
	.secrel32	.LLST56
	.secrel32	.LVUS56
	.uleb128 0x2f
	.long	0x6137
	.secrel32	.LLST57
	.secrel32	.LVUS57
	.uleb128 0x3b
	.long	0x6146
	.secrel32	.Ldebug_ranges0+0x820
	.long	0x562b
	.uleb128 0x2f
	.long	0x614b
	.secrel32	.LLST58
	.secrel32	.LVUS58
	.byte	0
	.uleb128 0x3b
	.long	0x6156
	.secrel32	.Ldebug_ranges0+0x860
	.long	0x5678
	.uleb128 0x2f
	.long	0x6157
	.secrel32	.LLST59
	.secrel32	.LVUS59
	.uleb128 0x3b
	.long	0x6161
	.secrel32	.Ldebug_ranges0+0x8b0
	.long	0x5660
	.uleb128 0x2f
	.long	0x6166
	.secrel32	.LLST60
	.secrel32	.LVUS60
	.byte	0
	.uleb128 0x2d
	.long	0x6173
	.secrel32	.Ldebug_ranges0+0x8e0
	.uleb128 0x2f
	.long	0x6174
	.secrel32	.LLST61
	.secrel32	.LVUS61
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL133
	.long	0x65ef
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x37
	.long	0x6181
	.quad	.LBI328
	.word	.LVU483
	.quad	.LBB328
	.quad	.LBE328-.LBB328
	.byte	0x1
	.word	0x135
	.byte	0x13
	.long	0x56e4
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST62
	.secrel32	.LVUS62
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST63
	.secrel32	.LVUS63
	.uleb128 0x29
	.quad	.LVL152
	.long	0x642e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x6015
	.quad	.LBI331
	.word	.LVU491
	.secrel32	.Ldebug_ranges0+0x930
	.byte	0x1
	.word	0x14f
	.byte	0x9
	.long	0x5802
	.uleb128 0x2c
	.long	0x6038
	.secrel32	.LLST64
	.secrel32	.LVUS64
	.uleb128 0x2d
	.long	0x6046
	.secrel32	.Ldebug_ranges0+0x940
	.uleb128 0x2f
	.long	0x604b
	.secrel32	.LLST65
	.secrel32	.LVUS65
	.uleb128 0x3c
	.long	0x6057
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3c
	.long	0x6065
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x3d
	.long	0x6181
	.quad	.LBI333
	.word	.LVU495
	.quad	.LBB333
	.quad	.LBE333-.LBB333
	.byte	0x1
	.byte	0xc0
	.byte	0x13
	.long	0x5782
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST66
	.secrel32	.LVUS66
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST67
	.secrel32	.LVUS67
	.uleb128 0x36
	.quad	.LVL154
	.long	0x642e
	.byte	0
	.uleb128 0x3e
	.quad	.LVL156
	.long	0x6492
	.long	0x57a2
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x3f
	.long	0x63d5
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x3e
	.quad	.LVL158
	.long	0x6611
	.long	0x57c6
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x40
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0x3
	.quad	compare_2_combinations
	.byte	0
	.uleb128 0x3e
	.quad	.LVL159
	.long	0x6492
	.long	0x57e5
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x3f
	.long	0x63d5
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x29
	.quad	.LVL160
	.long	0x6622
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x5fc4
	.quad	.LBI337
	.word	.LVU529
	.secrel32	.Ldebug_ranges0+0x970
	.byte	0x1
	.word	0x156
	.byte	0x9
	.long	0x59fa
	.uleb128 0x3b
	.long	0x5fe0
	.secrel32	.Ldebug_ranges0+0x9c0
	.long	0x588a
	.uleb128 0x35
	.long	0x5fe5
	.uleb128 0x3b
	.long	0x5fef
	.secrel32	.Ldebug_ranges0+0x9f0
	.long	0x585e
	.uleb128 0x2f
	.long	0x5ff0
	.secrel32	.LLST68
	.secrel32	.LVUS68
	.uleb128 0x29
	.quad	.LVL167
	.long	0x6622
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL164
	.long	0x6622
	.long	0x5876
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL168
	.long	0x6635
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	0x5ffc
	.secrel32	.Ldebug_ranges0+0xa30
	.long	0x59bf
	.uleb128 0x2f
	.long	0x5ffd
	.secrel32	.LLST69
	.secrel32	.LVUS69
	.uleb128 0x3a
	.long	0x6181
	.quad	.LBI345
	.word	.LVU552
	.secrel32	.Ldebug_ranges0+0xa60
	.byte	0x1
	.byte	0xde
	.byte	0x12
	.long	0x58ed
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST70
	.secrel32	.LVUS70
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST71
	.secrel32	.LVUS71
	.uleb128 0x29
	.quad	.LVL171
	.long	0x642e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	0x6007
	.secrel32	.Ldebug_ranges0+0xa90
	.long	0x591c
	.uleb128 0x2f
	.long	0x6008
	.secrel32	.LLST72
	.secrel32	.LVUS72
	.uleb128 0x29
	.quad	.LVL179
	.long	0x6622
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3a
	.long	0x6181
	.quad	.LBI350
	.word	.LVU563
	.secrel32	.Ldebug_ranges0+0xad0
	.byte	0x1
	.byte	0xde
	.byte	0x28
	.long	0x5993
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST73
	.secrel32	.LVUS73
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST74
	.secrel32	.LVUS74
	.uleb128 0x2d
	.long	0x6181
	.secrel32	.Ldebug_ranges0+0xb30
	.uleb128 0x2e
	.long	0x619e
	.uleb128 0x2e
	.long	0x6194
	.uleb128 0x2d
	.long	0x61a8
	.secrel32	.Ldebug_ranges0+0xb30
	.uleb128 0x2f
	.long	0x61a9
	.secrel32	.LLST75
	.secrel32	.LVUS75
	.uleb128 0x2d
	.long	0x61b8
	.secrel32	.Ldebug_ranges0+0xb80
	.uleb128 0x2f
	.long	0x61b9
	.secrel32	.LLST76
	.secrel32	.LVUS76
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL176
	.long	0x6622
	.long	0x59ab
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL181
	.long	0x6635
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL163
	.long	0x6652
	.long	0x59de
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC16
	.byte	0
	.uleb128 0x29
	.quad	.LVL169
	.long	0x6652
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.uleb128 0x2b
	.long	0x5f56
	.quad	.LBI380
	.word	.LVU607
	.secrel32	.Ldebug_ranges0+0xbc0
	.byte	0x1
	.word	0x157
	.byte	0x9
	.long	0x5bb9
	.uleb128 0x28
	.secrel32	.Ldebug_ranges0+0xbc0
	.uleb128 0x2f
	.long	0x5f78
	.secrel32	.LLST77
	.secrel32	.LVUS77
	.uleb128 0x2f
	.long	0x5f83
	.secrel32	.LLST78
	.secrel32	.LVUS78
	.uleb128 0x3d
	.long	0x6181
	.quad	.LBI382
	.word	.LVU613
	.quad	.LBB382
	.quad	.LBE382-.LBB382
	.byte	0x1
	.byte	0xea
	.byte	0xf
	.long	0x5a89
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST79
	.secrel32	.LVUS79
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST80
	.secrel32	.LVUS80
	.uleb128 0x29
	.quad	.LVL194
	.long	0x642e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7a
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	0x5f8f
	.secrel32	.Ldebug_ranges0+0xc00
	.long	0x5b10
	.uleb128 0x2f
	.long	0x5f94
	.secrel32	.LLST81
	.secrel32	.LVUS81
	.uleb128 0x3b
	.long	0x5f9e
	.secrel32	.Ldebug_ranges0+0xc40
	.long	0x5af6
	.uleb128 0x2f
	.long	0x5f9f
	.secrel32	.LLST82
	.secrel32	.LVUS82
	.uleb128 0x3e
	.quad	.LVL199
	.long	0x6669
	.long	0x5adb
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL201
	.long	0x667e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL202
	.long	0x667e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x3b
	.long	0x5fab
	.secrel32	.Ldebug_ranges0+0xc70
	.long	0x5b8f
	.uleb128 0x35
	.long	0x5fac
	.uleb128 0x3b
	.long	0x5fb6
	.secrel32	.Ldebug_ranges0+0xcb0
	.long	0x5b75
	.uleb128 0x2f
	.long	0x5fb7
	.secrel32	.LLST83
	.secrel32	.LVUS83
	.uleb128 0x3e
	.quad	.LVL208
	.long	0x6669
	.long	0x5b5a
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL210
	.long	0x667e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL211
	.long	0x667e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3a
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL191
	.long	0x6697
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC21
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL65
	.long	0x6652
	.long	0x5bd8
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.uleb128 0x3e
	.quad	.LVL69
	.long	0x6697
	.long	0x5bfd
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x3e
	.quad	.LVL71
	.long	0x65dc
	.long	0x5c2f
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	dim
	.byte	0
	.uleb128 0x3e
	.quad	.LVL72
	.long	0x65dc
	.long	0x5c61
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	n
	.byte	0
	.uleb128 0x3e
	.quad	.LVL73
	.long	0x65dc
	.long	0x5c93
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x9
	.byte	0x3
	.quad	nums_p
	.byte	0
	.uleb128 0x3e
	.quad	.LVL74
	.long	0x6622
	.long	0x5cb2
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x3e
	.quad	.LVL76
	.long	0x65ef
	.long	0x5ccf
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x7
	.byte	0x73
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x36
	.quad	.LVL77
	.long	0x65ef
	.uleb128 0x3e
	.quad	.LVL86
	.long	0x6652
	.long	0x5cfb
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x3e
	.quad	.LVL87
	.long	0x66a8
	.long	0x5d13
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL88
	.long	0x6492
	.long	0x5d33
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x3f
	.long	0x63d5
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x3e
	.quad	.LVL89
	.long	0x65ef
	.long	0x5d50
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x7
	.byte	0x73
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1e
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x36
	.quad	.LVL93
	.long	0x65ef
	.uleb128 0x3e
	.quad	.LVL132
	.long	0x6652
	.long	0x5d7c
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.byte	0
	.uleb128 0x3e
	.quad	.LVL161
	.long	0x6492
	.long	0x5d9c
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x3f
	.long	0x63d5
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x3e
	.quad	.LVL162
	.long	0x6622
	.long	0x5dbb
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.uleb128 0x36
	.quad	.LVL213
	.long	0x6602
	.uleb128 0x36
	.quad	.LVL214
	.long	0x6602
	.uleb128 0x3e
	.quad	.LVL225
	.long	0x6602
	.long	0x5ded
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.quad	.LVL226
	.long	0x6602
	.uleb128 0x3e
	.quad	.LVL239
	.long	0x6622
	.long	0x5e1f
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.quad	.LVL241
	.long	0x6652
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x40
	.long	0x5e6a
	.uleb128 0x30
	.ascii "start\0"
	.byte	0x1
	.word	0x160
	.byte	0x18
	.long	0x893
	.uleb128 0x30
	.ascii "end\0"
	.byte	0x1
	.word	0x160
	.byte	0x1f
	.long	0x893
	.uleb128 0x41
	.uleb128 0x30
	.ascii "i\0"
	.byte	0x1
	.word	0x165
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.uleb128 0x42
	.ascii "main._omp_fn.0\0"
	.quad	.LFB5619
	.quad	.LFE5619-.LFB5619
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ecd
	.uleb128 0x43
	.long	0x5f51
	.secrel32	.LLST2
	.secrel32	.LVUS2
	.uleb128 0x26
	.ascii "len\0"
	.byte	0x1
	.word	0x135
	.byte	0xd
	.long	0xf8
	.secrel32	.LLST3
	.secrel32	.LVUS3
	.uleb128 0x36
	.quad	.LVL4
	.long	0x66bb
	.uleb128 0x36
	.quad	.LVL5
	.long	0x66f0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL64
	.long	0x6723
	.long	0x5ee4
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.uleb128 0x3e
	.quad	.LVL141
	.long	0x672f
	.long	0x5f04
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x6
	.byte	0
	.uleb128 0x29
	.quad	.LVL153
	.long	0x674a
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	main._omp_fn.0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x1
	.byte	0x36
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5ba
	.uleb128 0x44
	.byte	0x4
	.long	0x5f4b
	.uleb128 0x9
	.ascii "len\0"
	.byte	0x1
	.word	0x135
	.byte	0xd
	.long	0xf8
	.byte	0
	.byte	0
	.uleb128 0x45
	.byte	0x8
	.long	0x5f36
	.uleb128 0x46
	.long	0x5f4b
	.uleb128 0x47
	.ascii "dmp_object_array_to_file\0"
	.byte	0x1
	.byte	0xe7
	.byte	0x14
	.byte	0x3
	.long	0x5fc4
	.uleb128 0x20
	.ascii "fp\0"
	.byte	0x1
	.byte	0xe8
	.byte	0xb
	.long	0x5f30
	.uleb128 0x20
	.ascii "len\0"
	.byte	0x1
	.byte	0xea
	.byte	0x9
	.long	0xf8
	.uleb128 0x40
	.long	0x5fab
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0xeb
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "j\0"
	.byte	0x1
	.byte	0xec
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0xf5
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "j\0"
	.byte	0x1
	.byte	0xf6
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x47
	.ascii "sniff_object_array\0"
	.byte	0x1
	.byte	0xcf
	.byte	0x14
	.byte	0x3
	.long	0x6015
	.uleb128 0x40
	.long	0x5ffc
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0xd5
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "j\0"
	.byte	0x1
	.byte	0xd7
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0xde
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "j\0"
	.byte	0x1
	.byte	0xe0
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x48
	.ascii "sort_object_array_by_cost\0"
	.byte	0x1
	.byte	0xbb
	.byte	0x14
	.byte	0x3
	.long	0x6081
	.uleb128 0x49
	.ascii "DEBUG\0"
	.byte	0x1
	.byte	0xbb
	.byte	0x32
	.long	0xf8
	.uleb128 0x40
	.long	0x6072
	.uleb128 0x20
	.ascii "len\0"
	.byte	0x1
	.byte	0xc0
	.byte	0xd
	.long	0xf8
	.uleb128 0x20
	.ascii "start\0"
	.byte	0x1
	.byte	0xc1
	.byte	0x18
	.long	0x893
	.uleb128 0x20
	.ascii "end\0"
	.byte	0x1
	.byte	0xc1
	.byte	0x1f
	.long	0x893
	.byte	0
	.uleb128 0x41
	.uleb128 0x20
	.ascii "len\0"
	.byte	0x1
	.byte	0xca
	.byte	0xd
	.long	0xf8
	.byte	0
	.byte	0
	.uleb128 0x4a
	.ascii "compare_2_combinations\0"
	.byte	0x1
	.byte	0xae
	.byte	0x5
	.long	0xf8
	.quad	.LFB5614
	.quad	.LFE5614-.LFB5614
	.uleb128 0x1
	.byte	0x9c
	.long	0x60f5
	.uleb128 0x4b
	.ascii "a\0"
	.byte	0x1
	.byte	0xae
	.byte	0x28
	.long	0x9e5
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4b
	.ascii "b\0"
	.byte	0x1
	.byte	0xae
	.byte	0x37
	.long	0x9e5
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4c
	.ascii "c1\0"
	.byte	0x1
	.byte	0xaf
	.byte	0x12
	.long	0x4f1e
	.secrel32	.LLST0
	.secrel32	.LVUS0
	.uleb128 0x4c
	.ascii "c2\0"
	.byte	0x1
	.byte	0xb0
	.byte	0x12
	.long	0x4f1e
	.secrel32	.LLST1
	.secrel32	.LVUS1
	.byte	0
	.uleb128 0x47
	.ascii "calc_all_combinations_and_store_in_object\0"
	.byte	0x1
	.byte	0x97
	.byte	0x14
	.byte	0x3
	.long	0x6181
	.uleb128 0x20
	.ascii "combi_\0"
	.byte	0x1
	.byte	0x99
	.byte	0xa
	.long	0x441
	.uleb128 0x20
	.ascii "count_\0"
	.byte	0x1
	.byte	0x9d
	.byte	0x9
	.long	0xf8
	.uleb128 0x40
	.long	0x6156
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0x9a
	.byte	0xe
	.long	0xf8
	.byte	0
	.uleb128 0x41
	.uleb128 0x20
	.ascii "t\0"
	.byte	0x1
	.byte	0xa3
	.byte	0xd
	.long	0xf8
	.uleb128 0x40
	.long	0x6173
	.uleb128 0x20
	.ascii "__i\0"
	.byte	0x1
	.byte	0x9f
	.byte	0x12
	.long	0xf8
	.byte	0
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0xa8
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4d
	.ascii "c_n_m\0"
	.byte	0x1
	.byte	0x77
	.byte	0x13
	.long	0xf8
	.byte	0x3
	.long	0x61c6
	.uleb128 0x49
	.ascii "n\0"
	.byte	0x1
	.byte	0x77
	.byte	0x1d
	.long	0xf8
	.uleb128 0x49
	.ascii "m\0"
	.byte	0x1
	.byte	0x77
	.byte	0x24
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "result\0"
	.byte	0x1
	.byte	0x7a
	.byte	0xd
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0x7b
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4d
	.ascii "calcOneChebyshevDistance\0"
	.byte	0x1
	.byte	0x67
	.byte	0x16
	.long	0x90
	.byte	0x3
	.long	0x6263
	.uleb128 0x49
	.ascii "dot_id1\0"
	.byte	0x1
	.byte	0x67
	.byte	0x33
	.long	0xf8
	.uleb128 0x49
	.ascii "dot_id2\0"
	.byte	0x1
	.byte	0x67
	.byte	0x40
	.long	0xf8
	.uleb128 0x49
	.ascii "tid\0"
	.byte	0x1
	.byte	0x67
	.byte	0x4d
	.long	0xf8
	.uleb128 0x20
	.ascii "max\0"
	.byte	0x1
	.byte	0x68
	.byte	0xc
	.long	0x90
	.uleb128 0x20
	.ascii "d1\0"
	.byte	0x1
	.byte	0x69
	.byte	0x9
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0x6a
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "d_1\0"
	.byte	0x1
	.byte	0x6b
	.byte	0xd
	.long	0xf8
	.uleb128 0x20
	.ascii "d_2\0"
	.byte	0x1
	.byte	0x6c
	.byte	0xd
	.long	0xf8
	.uleb128 0x20
	.ascii "diff\0"
	.byte	0x1
	.byte	0x6d
	.byte	0x10
	.long	0x90
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x47
	.ascii "calcEuclideanDistanceAndStoreInArray\0"
	.byte	0x1
	.byte	0x5a
	.byte	0x14
	.byte	0x3
	.long	0x62aa
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0x5b
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "j\0"
	.byte	0x1
	.byte	0x5c
	.byte	0x12
	.long	0xf8
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4d
	.ascii "calc_distance\0"
	.byte	0x1
	.byte	0x4c
	.byte	0x16
	.long	0x90
	.byte	0x3
	.long	0x6305
	.uleb128 0x49
	.ascii "id1\0"
	.byte	0x1
	.byte	0x4c
	.byte	0x28
	.long	0xf8
	.uleb128 0x49
	.ascii "id2\0"
	.byte	0x1
	.byte	0x4c
	.byte	0x31
	.long	0xf8
	.uleb128 0x20
	.ascii "sum\0"
	.byte	0x1
	.byte	0x4d
	.byte	0xc
	.long	0x90
	.uleb128 0x41
	.uleb128 0x20
	.ascii "i\0"
	.byte	0x1
	.byte	0x4e
	.byte	0xe
	.long	0xf8
	.uleb128 0x41
	.uleb128 0x20
	.ascii "diff\0"
	.byte	0x1
	.byte	0x4f
	.byte	0x10
	.long	0x90
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4d
	.ascii "get_point_coordinate_of_id_and_dimension\0"
	.byte	0x1
	.byte	0x46
	.byte	0x16
	.long	0x90
	.byte	0x3
	.long	0x6359
	.uleb128 0x49
	.ascii "id\0"
	.byte	0x1
	.byte	0x46
	.byte	0x43
	.long	0xf8
	.uleb128 0x49
	.ascii "dimension\0"
	.byte	0x1
	.byte	0x47
	.byte	0x43
	.long	0xf8
	.byte	0
	.uleb128 0x4e
	.ascii "get_cpu_core_num\0"
	.byte	0x1
	.byte	0x21
	.byte	0x5
	.long	0xf8
	.quad	.LFB5602
	.quad	.LFE5602-.LFB5602
	.uleb128 0x1
	.byte	0x9c
	.long	0x63b0
	.uleb128 0x1f
	.ascii "sysinfo\0"
	.byte	0x1
	.byte	0x22
	.byte	0x11
	.long	0x2334
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x29
	.quad	.LVL61
	.long	0x6773
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x4f
	.ascii "gettimeofday\0"
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.long	0xf8
	.byte	0x1
	.long	0x6407
	.uleb128 0x49
	.ascii "tp\0"
	.byte	0x1
	.byte	0xb
	.byte	0x22
	.long	0x235e
	.uleb128 0x49
	.ascii "tzp\0"
	.byte	0x1
	.byte	0xb
	.byte	0x2c
	.long	0x9b9
	.uleb128 0x20
	.ascii "clock\0"
	.byte	0x1
	.byte	0xc
	.byte	0xc
	.long	0x123
	.uleb128 0x20
	.ascii "tm\0"
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.long	0x766
	.uleb128 0x20
	.ascii "wtm\0"
	.byte	0x1
	.byte	0xe
	.byte	0x10
	.long	0x219e
	.byte	0
	.uleb128 0x4f
	.ascii "mktime\0"
	.byte	0x2
	.byte	0xf0
	.byte	0x1e
	.long	0x123
	.byte	0x3
	.long	0x6428
	.uleb128 0x49
	.ascii "_Tm\0"
	.byte	0x2
	.byte	0xf0
	.byte	0x30
	.long	0x6428
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x766
	.uleb128 0x50
	.long	0x6181
	.quad	.LFB5620
	.quad	.LFE5620-.LFB5620
	.uleb128 0x1
	.byte	0x9c
	.long	0x6492
	.uleb128 0x2c
	.long	0x6194
	.secrel32	.LLST18
	.secrel32	.LVUS18
	.uleb128 0x2c
	.long	0x619e
	.secrel32	.LLST19
	.secrel32	.LVUS19
	.uleb128 0x2d
	.long	0x61a8
	.secrel32	.Ldebug_ranges0+0x230
	.uleb128 0x2f
	.long	0x61a9
	.secrel32	.LLST20
	.secrel32	.LVUS20
	.uleb128 0x2d
	.long	0x61b8
	.secrel32	.Ldebug_ranges0+0x260
	.uleb128 0x2f
	.long	0x61b9
	.secrel32	.LLST21
	.secrel32	.LVUS21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x50
	.long	0x63b0
	.quad	.LFB5621
	.quad	.LFE5621-.LFB5621
	.uleb128 0x1
	.byte	0x9c
	.long	0x6537
	.uleb128 0x2c
	.long	0x63ca
	.secrel32	.LLST22
	.secrel32	.LVUS22
	.uleb128 0x2f
	.long	0x63e1
	.secrel32	.LLST23
	.secrel32	.LVUS23
	.uleb128 0x3c
	.long	0x63ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3c
	.long	0x63fa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2c
	.long	0x63d5
	.secrel32	.LLST24
	.secrel32	.LVUS24
	.uleb128 0x3a
	.long	0x6407
	.quad	.LBI135
	.word	.LVU155
	.secrel32	.Ldebug_ranges0+0x290
	.byte	0x1
	.byte	0x17
	.byte	0xd
	.long	0x6521
	.uleb128 0x2c
	.long	0x641b
	.secrel32	.LLST25
	.secrel32	.LVUS25
	.uleb128 0x29
	.quad	.LVL51
	.long	0x677f
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL49
	.long	0x678b
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.uleb128 0x50
	.long	0x63b0
	.quad	.LFB5601
	.quad	.LFE5601-.LFB5601
	.uleb128 0x1
	.byte	0x9c
	.long	0x65dc
	.uleb128 0x2c
	.long	0x63ca
	.secrel32	.LLST26
	.secrel32	.LVUS26
	.uleb128 0x2c
	.long	0x63d5
	.secrel32	.LLST27
	.secrel32	.LVUS27
	.uleb128 0x2f
	.long	0x63e1
	.secrel32	.LLST28
	.secrel32	.LVUS28
	.uleb128 0x3c
	.long	0x63ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x3c
	.long	0x63fa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x3a
	.long	0x6407
	.quad	.LBI139
	.word	.LVU195
	.secrel32	.Ldebug_ranges0+0x2c0
	.byte	0x1
	.byte	0x17
	.byte	0xd
	.long	0x65c6
	.uleb128 0x2c
	.long	0x641b
	.secrel32	.LLST29
	.secrel32	.LVUS29
	.uleb128 0x29
	.quad	.LVL58
	.long	0x677f
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x29
	.quad	.LVL56
	.long	0x678b
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.uleb128 0x51
	.ascii "fscanf\0"
	.ascii "fscanf\0"
	.byte	0x5
	.word	0x209
	.byte	0xf
	.uleb128 0x51
	.ascii "malloc\0"
	.ascii "malloc\0"
	.byte	0x6
	.word	0x1f7
	.byte	0x11
	.uleb128 0x51
	.ascii "free\0"
	.ascii "free\0"
	.byte	0x6
	.word	0x1f6
	.byte	0x10
	.uleb128 0x51
	.ascii "qsort\0"
	.ascii "qsort\0"
	.byte	0x6
	.word	0x197
	.byte	0x10
	.uleb128 0x51
	.ascii "printf\0"
	.ascii "printf\0"
	.byte	0x5
	.word	0x1fd
	.byte	0xf
	.uleb128 0x52
	.ascii "putchar\0"
	.ascii "__builtin_putchar\0"
	.byte	0x23
	.byte	0
	.uleb128 0x52
	.ascii "puts\0"
	.ascii "__builtin_puts\0"
	.byte	0x23
	.byte	0
	.uleb128 0x51
	.ascii "fprintf\0"
	.ascii "fprintf\0"
	.byte	0x5
	.word	0x1fb
	.byte	0xf
	.uleb128 0x52
	.ascii "fputc\0"
	.ascii "__builtin_fputc\0"
	.byte	0x23
	.byte	0
	.uleb128 0x51
	.ascii "fopen\0"
	.ascii "fopen\0"
	.byte	0x5
	.word	0x258
	.byte	0x11
	.uleb128 0x51
	.ascii "fclose\0"
	.ascii "fclose\0"
	.byte	0x5
	.word	0x243
	.byte	0xf
	.uleb128 0x52
	.ascii "omp_get_num_threads\0"
	.ascii "__builtin_omp_get_num_threads\0"
	.byte	0x23
	.byte	0
	.uleb128 0x52
	.ascii "omp_get_thread_num\0"
	.ascii "__builtin_omp_get_thread_num\0"
	.byte	0x23
	.byte	0
	.uleb128 0x53
	.secrel32	.LASF3
	.secrel32	.LASF3
	.byte	0x24
	.byte	0x51
	.byte	0xd
	.uleb128 0x52
	.ascii "memcpy\0"
	.ascii "__builtin_memcpy\0"
	.byte	0x23
	.byte	0
	.uleb128 0x52
	.ascii "GOMP_parallel\0"
	.ascii "__builtin_GOMP_parallel\0"
	.byte	0x23
	.byte	0
	.uleb128 0x53
	.secrel32	.LASF4
	.secrel32	.LASF4
	.byte	0x10
	.byte	0x4b
	.byte	0x1a
	.uleb128 0x53
	.secrel32	.LASF5
	.secrel32	.LASF5
	.byte	0x2
	.byte	0xa9
	.byte	0x1e
	.uleb128 0x53
	.secrel32	.LASF6
	.secrel32	.LASF6
	.byte	0x10
	.byte	0x27
	.byte	0x1a
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0x5
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0x5
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0x5
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x48
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x49
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x50
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x51
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x52
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x53
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"dr"
.Ldebug_loc0:
.LVUS30:
	.uleb128 0
	.uleb128 .LVU216
	.uleb128 .LVU216
	.uleb128 .LVU226
	.uleb128 .LVU716
	.uleb128 .LVU720
.LLST30:
	.quad	.LVL62
	.quad	.LVL63-1
	.word	0x1
	.byte	0x52
	.quad	.LVL63-1
	.quad	.LVL67
	.word	0x1
	.byte	0x53
	.quad	.LVL233
	.quad	.LVL235
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS31:
	.uleb128 0
	.uleb128 .LVU216
	.uleb128 .LVU216
	.uleb128 .LVU225
	.uleb128 .LVU225
	.uleb128 .LVU716
	.uleb128 .LVU716
	.uleb128 .LVU719
	.uleb128 .LVU719
	.uleb128 0
.LLST31:
	.quad	.LVL62
	.quad	.LVL63-1
	.word	0x1
	.byte	0x51
	.quad	.LVL63-1
	.quad	.LVL66
	.word	0x1
	.byte	0x54
	.quad	.LVL66
	.quad	.LVL233
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL233
	.quad	.LVL234
	.word	0x1
	.byte	0x54
	.quad	.LVL234
	.quad	.LFE5618
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS32:
	.uleb128 .LVU221
	.uleb128 .LVU227
	.uleb128 .LVU227
	.uleb128 .LVU249
	.uleb128 .LVU716
	.uleb128 .LVU719
	.uleb128 .LVU719
	.uleb128 .LVU720
	.uleb128 .LVU724
	.uleb128 .LVU727
	.uleb128 .LVU728
	.uleb128 0
.LLST32:
	.quad	.LVL65
	.quad	.LVL68
	.word	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	.LVL68
	.quad	.LVL75
	.word	0x1
	.byte	0x54
	.quad	.LVL233
	.quad	.LVL234
	.word	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	.LVL234
	.quad	.LVL235
	.word	0x1
	.byte	0x54
	.quad	.LVL238
	.quad	.LVL239
	.word	0x1
	.byte	0x54
	.quad	.LVL240
	.quad	.LFE5618
	.word	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS33:
	.uleb128 .LVU229
	.uleb128 .LVU701
	.uleb128 .LVU702
	.uleb128 .LVU716
	.uleb128 .LVU720
	.uleb128 .LVU727
.LLST33:
	.quad	.LVL68
	.quad	.LVL227
	.word	0x4
	.byte	0xa
	.word	0x3e8
	.byte	0x9f
	.quad	.LVL228
	.quad	.LVL233
	.word	0x4
	.byte	0xa
	.word	0x3e8
	.byte	0x9f
	.quad	.LVL235
	.quad	.LVL239
	.word	0x4
	.byte	0xa
	.word	0x3e8
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS34:
	.uleb128 .LVU233
	.uleb128 .LVU238
	.uleb128 .LVU238
	.uleb128 .LVU292
	.uleb128 .LVU724
	.uleb128 .LVU726
	.uleb128 .LVU726
	.uleb128 .LVU727
.LLST34:
	.quad	.LVL70
	.quad	.LVL71-1
	.word	0x1
	.byte	0x50
	.quad	.LVL71-1
	.quad	.LVL92
	.word	0x1
	.byte	0x56
	.quad	.LVL238
	.quad	.LVL239-1
	.word	0x1
	.byte	0x50
	.quad	.LVL239-1
	.quad	.LVL239
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS35:
	.uleb128 .LVU487
	.uleb128 .LVU489
.LLST35:
	.quad	.LVL152
	.quad	.LVL153-1
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS36:
	.uleb128 .LVU259
	.uleb128 .LVU260
	.uleb128 .LVU260
	.uleb128 .LVU274
.LLST36:
	.quad	.LVL78
	.quad	.LVL79
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL79
	.quad	.LVL85
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS37:
	.uleb128 .LVU260
	.uleb128 .LVU262
	.uleb128 .LVU262
	.uleb128 .LVU267
	.uleb128 .LVU267
	.uleb128 .LVU269
	.uleb128 .LVU269
	.uleb128 .LVU271
.LLST37:
	.quad	.LVL79
	.quad	.LVL80
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL80
	.quad	.LVL81
	.word	0x1
	.byte	0x54
	.quad	.LVL81
	.quad	.LVL82
	.word	0x3
	.byte	0x74
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL82
	.quad	.LVL83
	.word	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LVUS40:
	.uleb128 .LVU299
	.uleb128 .LVU301
	.uleb128 .LVU301
	.uleb128 .LVU305
	.uleb128 .LVU305
	.uleb128 .LVU310
	.uleb128 .LVU310
	.uleb128 .LVU337
.LLST40:
	.quad	.LVL94
	.quad	.LVL95
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL95
	.quad	.LVL96
	.word	0x1
	.byte	0x5e
	.quad	.LVL96
	.quad	.LVL98
	.word	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL98
	.quad	.LVL107
	.word	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LVUS41:
	.uleb128 .LVU310
	.uleb128 .LVU328
.LLST41:
	.quad	.LVL98
	.quad	.LVL105
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS42:
	.uleb128 .LVU310
	.uleb128 .LVU328
.LLST42:
	.quad	.LVL98
	.quad	.LVL105
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS43:
	.uleb128 .LVU314
	.uleb128 .LVU318
	.uleb128 .LVU318
	.uleb128 .LVU320
	.uleb128 .LVU321
	.uleb128 .LVU323
.LLST43:
	.quad	.LVL99
	.quad	.LVL100
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL100
	.quad	.LVL101
	.word	0x1
	.byte	0x50
	.quad	.LVL102
	.quad	.LVL104
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS44:
	.uleb128 .LVU314
	.uleb128 .LVU318
	.uleb128 .LVU318
	.uleb128 .LVU323
.LLST44:
	.quad	.LVL99
	.quad	.LVL100
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL100
	.quad	.LVL104
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU40
	.uleb128 .LVU42
	.uleb128 .LVU46
	.uleb128 .LVU52
	.uleb128 .LVU99
	.uleb128 .LVU101
	.uleb128 .LVU101
	.uleb128 .LVU102
	.uleb128 .LVU102
	.uleb128 .LVU106
	.uleb128 .LVU106
	.uleb128 .LVU107
.LLST10:
	.quad	.LVL10
	.quad	.LVL11
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL12
	.quad	.LVL14
	.word	0x1
	.byte	0x5b
	.quad	.LVL33
	.quad	.LVL35
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL35
	.quad	.LVL36
	.word	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL36
	.quad	.LVL37
	.word	0x1
	.byte	0x50
	.quad	.LVL37
	.quad	.LVL38
	.word	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU35
	.uleb128 .LVU53
	.uleb128 .LVU99
	.uleb128 .LVU107
.LLST7:
	.quad	.LVL9
	.quad	.LVL15
	.word	0x1
	.byte	0x54
	.quad	.LVL33
	.quad	.LVL38
	.word	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU36
	.uleb128 .LVU42
	.uleb128 .LVU99
	.uleb128 .LVU101
.LLST8:
	.quad	.LVL9
	.quad	.LVL11
	.word	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL33
	.quad	.LVL35
	.word	0x2
	.byte	0x75
	.sleb128 0
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU38
	.uleb128 .LVU48
	.uleb128 .LVU99
	.uleb128 .LVU100
	.uleb128 .LVU100
	.uleb128 .LVU101
.LLST9:
	.quad	.LVL10
	.quad	.LVL13
	.word	0x1
	.byte	0x50
	.quad	.LVL33
	.quad	.LVL34
	.word	0x1
	.byte	0x50
	.quad	.LVL34
	.quad	.LVL35
	.word	0x8
	.byte	0x75
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU33
	.uleb128 .LVU34
	.uleb128 .LVU107
	.uleb128 0
.LLST6:
	.quad	.LVL8
	.quad	.LVL9
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL38
	.quad	.LFE5619
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS13:
	.uleb128 .LVU59
	.uleb128 .LVU62
	.uleb128 .LVU63
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU93
.LLST13:
	.quad	.LVL16
	.quad	.LVL17
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL18
	.quad	.LVL19
	.word	0x1
	.byte	0x56
	.quad	.LVL19
	.quad	.LVL26
	.word	0x1
	.byte	0x54
	.quad	.LVL26
	.quad	.LVL27
	.word	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL27
	.quad	.LVL28
	.word	0x3
	.byte	0x7c
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS14:
	.uleb128 .LVU64
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU80
.LLST14:
	.quad	.LVL19
	.quad	.LVL20
	.word	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.quad	.LVL20
	.quad	.LVL24
	.word	0x1
	.byte	0x62
	.quad	0
	.quad	0
.LVUS15:
	.uleb128 .LVU64
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU74
	.uleb128 .LVU74
	.uleb128 .LVU78
	.uleb128 .LVU78
	.uleb128 .LVU80
.LLST15:
	.quad	.LVL19
	.quad	.LVL20
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL20
	.quad	.LVL21
	.word	0x1
	.byte	0x52
	.quad	.LVL21
	.quad	.LVL23
	.word	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL23
	.quad	.LVL24
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS16:
	.uleb128 .LVU70
	.uleb128 .LVU74
	.uleb128 .LVU74
	.uleb128 .LVU80
.LLST16:
	.quad	.LVL20
	.quad	.LVL21
	.word	0xf
	.byte	0x79
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1e
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.byte	0x91
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x9f
	.quad	.LVL21
	.quad	.LVL24
	.word	0xf
	.byte	0x72
	.sleb128 -1
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.byte	0x91
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS17:
	.uleb128 .LVU71
	.uleb128 .LVU75
.LLST17:
	.quad	.LVL20
	.quad	.LVL22
	.word	0x14
	.byte	0x70
	.sleb128 0
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x78
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x1c
	.byte	0x19
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS12:
	.uleb128 .LVU57
	.uleb128 .LVU62
	.uleb128 .LVU63
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU93
.LLST12:
	.quad	.LVL16
	.quad	.LVL17
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL18
	.quad	.LVL26
	.word	0x1
	.byte	0x56
	.quad	.LVL26
	.quad	.LVL27
	.word	0x3
	.byte	0x76
	.sleb128 1
	.byte	0x9f
	.quad	.LVL27
	.quad	.LVL28
	.word	0x3
	.byte	0x7c
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 .LVU55
	.uleb128 .LVU62
	.uleb128 .LVU86
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU93
	.uleb128 .LVU107
	.uleb128 0
.LLST11:
	.quad	.LVL16
	.quad	.LVL17
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL26
	.quad	.LVL27
	.word	0x1
	.byte	0x56
	.quad	.LVL27
	.quad	.LVL28
	.word	0x1
	.byte	0x5c
	.quad	.LVL38
	.quad	.LFE5619
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU31
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU55
	.uleb128 .LVU99
	.uleb128 .LVU107
	.uleb128 .LVU107
	.uleb128 0
.LLST5:
	.quad	.LVL8
	.quad	.LVL9
	.word	0x1
	.byte	0x55
	.quad	.LVL9
	.quad	.LVL16
	.word	0x4
	.byte	0x91
	.sleb128 -176
	.byte	0x6
	.quad	.LVL33
	.quad	.LVL38
	.word	0x4
	.byte	0x91
	.sleb128 -176
	.byte	0x6
	.quad	.LVL38
	.quad	.LFE5619
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU26
	.uleb128 .LVU94
	.uleb128 .LVU95
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU97
	.uleb128 .LVU99
	.uleb128 0
.LLST4:
	.quad	.LVL7
	.quad	.LVL29
	.word	0x3
	.byte	0x91
	.sleb128 -168
	.quad	.LVL30
	.quad	.LVL31
	.word	0x1
	.byte	0x50
	.quad	.LVL31
	.quad	.LVL32
	.word	0x3
	.byte	0x91
	.sleb128 -168
	.quad	.LVL33
	.quad	.LFE5619
	.word	0x3
	.byte	0x91
	.sleb128 -168
	.quad	0
	.quad	0
.LVUS84:
	.uleb128 .LVU668
	.uleb128 .LVU670
	.uleb128 .LVU670
	.uleb128 .LVU673
	.uleb128 .LVU673
	.uleb128 .LVU675
	.uleb128 .LVU675
	.uleb128 .LVU701
.LLST84:
	.quad	.LVL214
	.quad	.LVL215
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL215
	.quad	.LVL216
	.word	0x1
	.byte	0x56
	.quad	.LVL216
	.quad	.LVL217
	.word	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL217
	.quad	.LVL227
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS85:
	.uleb128 .LVU675
	.uleb128 .LVU694
.LLST85:
	.quad	.LVL217
	.quad	.LVL224
	.word	0x9
	.byte	0x3
	.quad	m
	.quad	0
	.quad	0
.LVUS86:
	.uleb128 .LVU675
	.uleb128 .LVU694
.LLST86:
	.quad	.LVL217
	.quad	.LVL224
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS87:
	.uleb128 .LVU681
	.uleb128 .LVU684
	.uleb128 .LVU684
	.uleb128 .LVU686
	.uleb128 .LVU687
	.uleb128 .LVU689
.LLST87:
	.quad	.LVL218
	.quad	.LVL219
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL219
	.quad	.LVL220
	.word	0x1
	.byte	0x50
	.quad	.LVL221
	.quad	.LVL223
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS88:
	.uleb128 .LVU681
	.uleb128 .LVU684
	.uleb128 .LVU684
	.uleb128 .LVU689
.LLST88:
	.quad	.LVL218
	.quad	.LVL219
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL219
	.quad	.LVL223
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS38:
	.uleb128 .LVU285
	.uleb128 .LVU289
.LLST38:
	.quad	.LVL90
	.quad	.LVL91
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS39:
	.uleb128 .LVU285
	.uleb128 .LVU289
.LLST39:
	.quad	.LVL90
	.quad	.LVL91
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS45:
	.uleb128 .LVU330
	.uleb128 .LVU338
	.uleb128 .LVU338
	.uleb128 .LVU414
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST45:
	.quad	.LVL106
	.quad	.LVL108
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL108
	.quad	.LVL131
	.word	0x1
	.byte	0x55
	.quad	.LVL203
	.quad	.LVL204
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS46:
	.uleb128 .LVU338
	.uleb128 .LVU340
	.uleb128 .LVU340
	.uleb128 .LVU401
	.uleb128 .LVU401
	.uleb128 .LVU403
	.uleb128 .LVU404
	.uleb128 .LVU408
	.uleb128 .LVU408
	.uleb128 .LVU410
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST46:
	.quad	.LVL108
	.quad	.LVL109
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL109
	.quad	.LVL125
	.word	0x1
	.byte	0x51
	.quad	.LVL125
	.quad	.LVL126
	.word	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL127
	.quad	.LVL128
	.word	0x1
	.byte	0x51
	.quad	.LVL128
	.quad	.LVL129
	.word	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL203
	.quad	.LVL204
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS47:
	.uleb128 .LVU344
	.uleb128 .LVU399
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST47:
	.quad	.LVL110
	.quad	.LVL124
	.word	0x1
	.byte	0x51
	.quad	.LVL203
	.quad	.LVL204
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS48:
	.uleb128 .LVU344
	.uleb128 .LVU399
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST48:
	.quad	.LVL110
	.quad	.LVL124
	.word	0x1
	.byte	0x55
	.quad	.LVL203
	.quad	.LVL204
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS49:
	.uleb128 .LVU346
	.uleb128 .LVU350
	.uleb128 .LVU365
	.uleb128 .LVU397
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST49:
	.quad	.LVL110
	.quad	.LVL111
	.word	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.quad	.LVL113
	.quad	.LVL123
	.word	0x1
	.byte	0x62
	.quad	.LVL203
	.quad	.LVL204
	.word	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0
	.long	0
	.quad	0
	.quad	0
.LVUS50:
	.uleb128 .LVU348
	.uleb128 .LVU350
	.uleb128 .LVU365
	.uleb128 .LVU374
	.uleb128 .LVU374
	.uleb128 .LVU381
	.uleb128 .LVU637
	.uleb128 .LVU641
.LLST50:
	.quad	.LVL110
	.quad	.LVL111
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL113
	.quad	.LVL114
	.word	0x1
	.byte	0x52
	.quad	.LVL114
	.quad	.LVL117
	.word	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL203
	.quad	.LVL204
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS51:
	.uleb128 .LVU378
	.uleb128 .LVU380
	.uleb128 .LVU380
	.uleb128 .LVU391
	.uleb128 .LVU391
	.uleb128 .LVU392
	.uleb128 .LVU394
	.uleb128 .LVU396
	.uleb128 .LVU396
	.uleb128 .LVU397
.LLST51:
	.quad	.LVL115
	.quad	.LVL116
	.word	0x1
	.byte	0x61
	.quad	.LVL116
	.quad	.LVL119
	.word	0x18
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x73
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL119
	.quad	.LVL120
	.word	0x23
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x72
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL121
	.quad	.LVL122
	.word	0x1
	.byte	0x61
	.quad	.LVL122
	.quad	.LVL123
	.word	0x18
	.byte	0x73
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0xf6
	.byte	0x8
	.uleb128 0x90
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS52:
	.uleb128 .LVU366
	.uleb128 .LVU368
.LLST52:
	.quad	.LVL113
	.quad	.LVL113
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS53:
	.uleb128 .LVU352
	.uleb128 .LVU354
	.uleb128 .LVU366
	.uleb128 .LVU368
	.uleb128 .LVU384
	.uleb128 .LVU386
.LLST53:
	.quad	.LVL111
	.quad	.LVL111
	.word	0x1
	.byte	0x55
	.quad	.LVL113
	.quad	.LVL113
	.word	0x1
	.byte	0x55
	.quad	.LVL118
	.quad	.LVL118
	.word	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LVUS54:
	.uleb128 .LVU368
	.uleb128 .LVU371
.LLST54:
	.quad	.LVL113
	.quad	.LVL113
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS55:
	.uleb128 .LVU354
	.uleb128 .LVU357
	.uleb128 .LVU368
	.uleb128 .LVU371
	.uleb128 .LVU386
	.uleb128 .LVU389
.LLST55:
	.quad	.LVL111
	.quad	.LVL111
	.word	0x1
	.byte	0x51
	.quad	.LVL113
	.quad	.LVL113
	.word	0x1
	.byte	0x51
	.quad	.LVL118
	.quad	.LVL118
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS56:
	.uleb128 .LVU422
	.uleb128 .LVU425
	.uleb128 .LVU425
	.uleb128 .LVU481
	.uleb128 .LVU704
	.uleb128 .LVU716
	.uleb128 .LVU721
	.uleb128 .LVU723
	.uleb128 .LVU723
	.uleb128 .LVU724
.LLST56:
	.quad	.LVL134
	.quad	.LVL135
	.word	0x1
	.byte	0x50
	.quad	.LVL135
	.quad	.LVL151
	.word	0x1
	.byte	0x5d
	.quad	.LVL230
	.quad	.LVL233
	.word	0x1
	.byte	0x5d
	.quad	.LVL236
	.quad	.LVL237
	.word	0x1
	.byte	0x50
	.quad	.LVL237
	.quad	.LVL238
	.word	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LVUS57:
	.uleb128 .LVU444
	.uleb128 .LVU450
.LLST57:
	.quad	.LVL139
	.quad	.LVL140
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS58:
	.uleb128 .LVU424
	.uleb128 .LVU425
	.uleb128 .LVU428
	.uleb128 .LVU432
	.uleb128 .LVU432
	.uleb128 .LVU438
	.uleb128 .LVU721
	.uleb128 .LVU724
.LLST58:
	.quad	.LVL134
	.quad	.LVL135
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL136
	.quad	.LVL137
	.word	0x1
	.byte	0x50
	.quad	.LVL137
	.quad	.LVL138
	.word	0x1
	.byte	0x51
	.quad	.LVL236
	.quad	.LVL238
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS59:
	.uleb128 .LVU454
	.uleb128 .LVU460
	.uleb128 .LVU460
	.uleb128 .LVU463
	.uleb128 .LVU463
	.uleb128 .LVU464
	.uleb128 .LVU464
	.uleb128 .LVU465
	.uleb128 .LVU465
	.uleb128 .LVU474
	.uleb128 .LVU704
	.uleb128 .LVU716
.LLST59:
	.quad	.LVL142
	.quad	.LVL143
	.word	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL143
	.quad	.LVL144
	.word	0x1
	.byte	0x58
	.quad	.LVL144
	.quad	.LVL144
	.word	0x1
	.byte	0x51
	.quad	.LVL144
	.quad	.LVL145
	.word	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL145
	.quad	.LVL147
	.word	0x1
	.byte	0x58
	.quad	.LVL230
	.quad	.LVL233
	.word	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS60:
	.uleb128 .LVU450
	.uleb128 .LVU481
	.uleb128 .LVU704
	.uleb128 .LVU716
.LLST60:
	.quad	.LVL140
	.quad	.LVL151
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL230
	.quad	.LVL233
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS61:
	.uleb128 .LVU475
	.uleb128 .LVU477
	.uleb128 .LVU477
	.uleb128 .LVU478
	.uleb128 .LVU709
	.uleb128 .LVU710
.LLST61:
	.quad	.LVL148
	.quad	.LVL149
	.word	0x1
	.byte	0x50
	.quad	.LVL149
	.quad	.LVL150
	.word	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL231
	.quad	.LVL232
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS62:
	.uleb128 .LVU483
	.uleb128 .LVU487
.LLST62:
	.quad	.LVL151
	.quad	.LVL152
	.word	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LVUS63:
	.uleb128 .LVU483
	.uleb128 .LVU487
.LLST63:
	.quad	.LVL151
	.quad	.LVL152-1
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS64:
	.uleb128 .LVU492
	.uleb128 .LVU517
.LLST64:
	.quad	.LVL153
	.quad	.LVL160
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS65:
	.uleb128 .LVU500
	.uleb128 .LVU505
	.uleb128 .LVU505
	.uleb128 .LVU509
.LLST65:
	.quad	.LVL155
	.quad	.LVL157
	.word	0x1
	.byte	0x53
	.quad	.LVL157
	.quad	.LVL158-1
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS66:
	.uleb128 .LVU495
	.uleb128 .LVU499
.LLST66:
	.quad	.LVL153
	.quad	.LVL154-1
	.word	0x9
	.byte	0x3
	.quad	m
	.quad	0
	.quad	0
.LVUS67:
	.uleb128 .LVU495
	.uleb128 .LVU499
.LLST67:
	.quad	.LVL153
	.quad	.LVL154-1
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS68:
	.uleb128 .LVU538
	.uleb128 .LVU539
	.uleb128 .LVU539
	.uleb128 .LVU542
.LLST68:
	.quad	.LVL164
	.quad	.LVL165
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL165
	.quad	.LVL166
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS69:
	.uleb128 .LVU561
	.uleb128 .LVU582
	.uleb128 .LVU582
	.uleb128 .LVU584
	.uleb128 .LVU584
	.uleb128 .LVU605
	.uleb128 .LVU720
	.uleb128 .LVU721
.LLST69:
	.quad	.LVL173
	.quad	.LVL180
	.word	0x1
	.byte	0x56
	.quad	.LVL180
	.quad	.LVL181
	.word	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL181
	.quad	.LVL190
	.word	0x1
	.byte	0x56
	.quad	.LVL235
	.quad	.LVL236
	.word	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS70:
	.uleb128 .LVU552
	.uleb128 .LVU558
.LLST70:
	.quad	.LVL170
	.quad	.LVL172
	.word	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LVUS71:
	.uleb128 .LVU552
	.uleb128 .LVU557
.LLST71:
	.quad	.LVL170
	.quad	.LVL171-1
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS72:
	.uleb128 .LVU573
	.uleb128 .LVU574
	.uleb128 .LVU574
	.uleb128 .LVU577
.LLST72:
	.quad	.LVL176
	.quad	.LVL177
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL177
	.quad	.LVL178
	.word	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS73:
	.uleb128 .LVU562
	.uleb128 .LVU566
	.uleb128 .LVU585
	.uleb128 .LVU603
	.uleb128 .LVU720
	.uleb128 .LVU721
.LLST73:
	.quad	.LVL174
	.quad	.LVL175
	.word	0x9
	.byte	0x3
	.quad	m
	.quad	.LVL182
	.quad	.LVL189
	.word	0x9
	.byte	0x3
	.quad	m
	.quad	.LVL235
	.quad	.LVL236
	.word	0x9
	.byte	0x3
	.quad	m
	.quad	0
	.quad	0
.LVUS74:
	.uleb128 .LVU562
	.uleb128 .LVU566
	.uleb128 .LVU585
	.uleb128 .LVU603
	.uleb128 .LVU720
	.uleb128 .LVU721
.LLST74:
	.quad	.LVL174
	.quad	.LVL175
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	.LVL182
	.quad	.LVL189
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	.LVL235
	.quad	.LVL236
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS75:
	.uleb128 .LVU590
	.uleb128 .LVU593
	.uleb128 .LVU593
	.uleb128 .LVU595
	.uleb128 .LVU596
	.uleb128 .LVU598
	.uleb128 .LVU720
	.uleb128 .LVU721
.LLST75:
	.quad	.LVL183
	.quad	.LVL184
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL184
	.quad	.LVL185
	.word	0x1
	.byte	0x50
	.quad	.LVL186
	.quad	.LVL188
	.word	0x1
	.byte	0x50
	.quad	.LVL235
	.quad	.LVL236
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS76:
	.uleb128 .LVU590
	.uleb128 .LVU593
	.uleb128 .LVU593
	.uleb128 .LVU598
	.uleb128 .LVU720
	.uleb128 .LVU721
.LLST76:
	.quad	.LVL183
	.quad	.LVL184
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL184
	.quad	.LVL188
	.word	0x1
	.byte	0x52
	.quad	.LVL235
	.quad	.LVL236
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS77:
	.uleb128 .LVU612
	.uleb128 .LVU616
	.uleb128 .LVU616
	.uleb128 .LVU637
	.uleb128 .LVU641
	.uleb128 .LVU661
	.uleb128 .LVU702
	.uleb128 .LVU704
.LLST77:
	.quad	.LVL192
	.quad	.LVL193
	.word	0x1
	.byte	0x50
	.quad	.LVL193
	.quad	.LVL203
	.word	0x1
	.byte	0x54
	.quad	.LVL204
	.quad	.LVL212
	.word	0x1
	.byte	0x54
	.quad	.LVL228
	.quad	.LVL230
	.word	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LVUS78:
	.uleb128 .LVU617
	.uleb128 .LVU624
.LLST78:
	.quad	.LVL194
	.quad	.LVL197
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS79:
	.uleb128 .LVU613
	.uleb128 .LVU617
.LLST79:
	.quad	.LVL192
	.quad	.LVL194
	.word	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LVUS80:
	.uleb128 .LVU613
	.uleb128 .LVU617
.LLST80:
	.quad	.LVL192
	.quad	.LVL194-1
	.word	0x9
	.byte	0x3
	.quad	n
	.quad	0
	.quad	0
.LVUS81:
	.uleb128 .LVU620
	.uleb128 .LVU621
	.uleb128 .LVU621
	.uleb128 .LVU623
	.uleb128 .LVU623
	.uleb128 .LVU624
.LLST81:
	.quad	.LVL194
	.quad	.LVL195
	.word	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL195
	.quad	.LVL196
	.word	0x1
	.byte	0x55
	.quad	.LVL196
	.quad	.LVL197
	.word	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS82:
	.uleb128 .LVU624
	.uleb128 .LVU625
	.uleb128 .LVU625
	.uleb128 .LVU632
	.uleb128 .LVU641
	.uleb128 .LVU642
.LLST82:
	.quad	.LVL197
	.quad	.LVL198
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL198
	.quad	.LVL200
	.word	0x1
	.byte	0x53
	.quad	.LVL204
	.quad	.LVL205
	.word	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS83:
	.uleb128 .LVU647
	.uleb128 .LVU649
	.uleb128 .LVU649
	.uleb128 .LVU656
	.uleb128 .LVU702
	.uleb128 .LVU703
.LLST83:
	.quad	.LVL206
	.quad	.LVL207
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL207
	.quad	.LVL209
	.word	0x1
	.byte	0x53
	.quad	.LVL228
	.quad	.LVL229
	.word	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU16
	.uleb128 .LVU16
	.uleb128 0
.LLST2:
	.quad	.LVL2
	.quad	.LVL4-1
	.word	0x1
	.byte	0x52
	.quad	.LVL4-1
	.quad	.LFE5619
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU15
	.uleb128 .LVU24
	.uleb128 .LVU24
	.uleb128 0
.LLST3:
	.quad	.LVL3
	.quad	.LVL6
	.word	0x1
	.byte	0x54
	.quad	.LVL6
	.quad	.LFE5619
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 .LVU3
	.uleb128 0
.LLST0:
	.quad	.LVL1
	.quad	.LFE5614
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU4
	.uleb128 0
.LLST1:
	.quad	.LVL1
	.quad	.LFE5614
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS18:
	.uleb128 0
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST18:
	.quad	.LVL39
	.quad	.LVL41
	.word	0x1
	.byte	0x52
	.quad	.LVL41
	.quad	.LVL45
	.word	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL45
	.quad	.LFE5620
	.word	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LVUS19:
	.uleb128 0
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST19:
	.quad	.LVL39
	.quad	.LVL41
	.word	0x1
	.byte	0x51
	.quad	.LVL41
	.quad	.LVL45
	.word	0x3
	.byte	0x79
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL45
	.quad	.LFE5620
	.word	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS20:
	.uleb128 .LVU111
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU116
	.uleb128 .LVU117
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST20:
	.quad	.LVL40
	.quad	.LVL41
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL41
	.quad	.LVL42
	.word	0x1
	.byte	0x50
	.quad	.LVL43
	.quad	.LVL45
	.word	0x1
	.byte	0x50
	.quad	.LVL45
	.quad	.LFE5620
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS21:
	.uleb128 .LVU111
	.uleb128 .LVU114
	.uleb128 .LVU114
	.uleb128 .LVU123
	.uleb128 .LVU123
	.uleb128 0
.LLST21:
	.quad	.LVL40
	.quad	.LVL41
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL41
	.quad	.LVL45
	.word	0x1
	.byte	0x58
	.quad	.LVL45
	.quad	.LFE5620
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS22:
	.uleb128 0
	.uleb128 .LVU136
	.uleb128 .LVU136
	.uleb128 .LVU167
	.uleb128 .LVU167
	.uleb128 0
.LLST22:
	.quad	.LVL46
	.quad	.LVL48
	.word	0x1
	.byte	0x52
	.quad	.LVL48
	.quad	.LVL53
	.word	0x1
	.byte	0x53
	.quad	.LVL53
	.quad	.LFE5621
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS23:
	.uleb128 .LVU158
	.uleb128 .LVU163
.LLST23:
	.quad	.LVL51
	.quad	.LVL52
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS24:
	.uleb128 .LVU130
	.uleb128 0
.LLST24:
	.quad	.LVL47
	.quad	.LFE5621
	.word	0x6
	.byte	0xfa
	.long	0x63d5
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS25:
	.uleb128 .LVU155
	.uleb128 .LVU158
	.uleb128 .LVU158
	.uleb128 .LVU158
.LLST25:
	.quad	.LVL50
	.quad	.LVL51-1
	.word	0x1
	.byte	0x52
	.quad	.LVL51-1
	.quad	.LVL51
	.word	0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS26:
	.uleb128 0
	.uleb128 .LVU176
	.uleb128 .LVU176
	.uleb128 .LVU207
	.uleb128 .LVU207
	.uleb128 0
.LLST26:
	.quad	.LVL54
	.quad	.LVL55
	.word	0x1
	.byte	0x52
	.quad	.LVL55
	.quad	.LVL60
	.word	0x1
	.byte	0x53
	.quad	.LVL60
	.quad	.LFE5601
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS27:
	.uleb128 0
	.uleb128 .LVU177
	.uleb128 .LVU177
	.uleb128 0
.LLST27:
	.quad	.LVL54
	.quad	.LVL56-1
	.word	0x1
	.byte	0x51
	.quad	.LVL56-1
	.quad	.LFE5601
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS28:
	.uleb128 .LVU198
	.uleb128 .LVU203
.LLST28:
	.quad	.LVL58
	.quad	.LVL59
	.word	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS29:
	.uleb128 .LVU195
	.uleb128 .LVU198
	.uleb128 .LVU198
	.uleb128 .LVU198
.LLST29:
	.quad	.LVL57
	.quad	.LVL58-1
	.word	0x1
	.byte	0x52
	.quad	.LVL58-1
	.quad	.LVL58
	.word	0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"dr"
	.long	0x3c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB5618
	.quad	.LFE5618-.LFB5618
	.quad	0
	.quad	0
	.section	.debug_ranges,"dr"
.Ldebug_ranges0:
	.quad	.LBB95
	.quad	.LBE95
	.quad	.LBB127
	.quad	.LBE127
	.quad	.LBB128
	.quad	.LBE128
	.quad	0
	.quad	0
	.quad	.LBB98
	.quad	.LBE98
	.quad	.LBB106
	.quad	.LBE106
	.quad	.LBB107
	.quad	.LBE107
	.quad	.LBB121
	.quad	.LBE121
	.quad	0
	.quad	0
	.quad	.LBB99
	.quad	.LBE99
	.quad	.LBB104
	.quad	.LBE104
	.quad	.LBB105
	.quad	.LBE105
	.quad	0
	.quad	0
	.quad	.LBB100
	.quad	.LBE100
	.quad	.LBB101
	.quad	.LBE101
	.quad	.LBB102
	.quad	.LBE102
	.quad	.LBB103
	.quad	.LBE103
	.quad	0
	.quad	0
	.quad	.LBB108
	.quad	.LBE108
	.quad	.LBB122
	.quad	.LBE122
	.quad	0
	.quad	0
	.quad	.LBB109
	.quad	.LBE109
	.quad	.LBB120
	.quad	.LBE120
	.quad	0
	.quad	0
	.quad	.LBB110
	.quad	.LBE110
	.quad	.LBB118
	.quad	.LBE118
	.quad	.LBB119
	.quad	.LBE119
	.quad	0
	.quad	0
	.quad	.LBB113
	.quad	.LBE113
	.quad	.LBB117
	.quad	.LBE117
	.quad	0
	.quad	0
	.quad	.LBB114
	.quad	.LBE114
	.quad	.LBB115
	.quad	.LBE115
	.quad	.LBB116
	.quad	.LBE116
	.quad	0
	.quad	0
	.quad	.LBB131
	.quad	.LBE131
	.quad	.LBB134
	.quad	.LBE134
	.quad	0
	.quad	0
	.quad	.LBB132
	.quad	.LBE132
	.quad	.LBB133
	.quad	.LBE133
	.quad	0
	.quad	0
	.quad	.LBB135
	.quad	.LBE135
	.quad	.LBB138
	.quad	.LBE138
	.quad	0
	.quad	0
	.quad	.LBB139
	.quad	.LBE139
	.quad	.LBB142
	.quad	.LBE142
	.quad	0
	.quad	0
	.quad	.LBB213
	.quad	.LBE213
	.quad	.LBB419
	.quad	.LBE419
	.quad	.LBB420
	.quad	.LBE420
	.quad	0
	.quad	0
	.quad	.LBB214
	.quad	.LBE214
	.quad	.LBB217
	.quad	.LBE217
	.quad	.LBB218
	.quad	.LBE218
	.quad	.LBB219
	.quad	.LBE219
	.quad	0
	.quad	0
	.quad	.LBB215
	.quad	.LBE215
	.quad	.LBB216
	.quad	.LBE216
	.quad	0
	.quad	0
	.quad	.LBB222
	.quad	.LBE222
	.quad	.LBB237
	.quad	.LBE237
	.quad	.LBB238
	.quad	.LBE238
	.quad	.LBB309
	.quad	.LBE309
	.quad	0
	.quad	0
	.quad	.LBB223
	.quad	.LBE223
	.quad	.LBB235
	.quad	.LBE235
	.quad	.LBB236
	.quad	.LBE236
	.quad	0
	.quad	0
	.quad	.LBB225
	.quad	.LBE225
	.quad	.LBB231
	.quad	.LBE231
	.quad	.LBB232
	.quad	.LBE232
	.quad	0
	.quad	0
	.quad	.LBB227
	.quad	.LBE227
	.quad	.LBB228
	.quad	.LBE228
	.quad	0
	.quad	0
	.quad	.LBB239
	.quad	.LBE239
	.quad	.LBB310
	.quad	.LBE310
	.quad	.LBB397
	.quad	.LBE397
	.quad	0
	.quad	0
	.quad	.LBB241
	.quad	.LBE241
	.quad	.LBB304
	.quad	.LBE304
	.quad	.LBB305
	.quad	.LBE305
	.quad	.LBB306
	.quad	.LBE306
	.quad	0
	.quad	0
	.quad	.LBB242
	.quad	.LBE242
	.quad	.LBB301
	.quad	.LBE301
	.quad	.LBB302
	.quad	.LBE302
	.quad	.LBB303
	.quad	.LBE303
	.quad	0
	.quad	0
	.quad	.LBB244
	.quad	.LBE244
	.quad	.LBB294
	.quad	.LBE294
	.quad	.LBB295
	.quad	.LBE295
	.quad	.LBB296
	.quad	.LBE296
	.quad	.LBB297
	.quad	.LBE297
	.quad	0
	.quad	0
	.quad	.LBB245
	.quad	.LBE245
	.quad	.LBB288
	.quad	.LBE288
	.quad	.LBB289
	.quad	.LBE289
	.quad	.LBB290
	.quad	.LBE290
	.quad	.LBB291
	.quad	.LBE291
	.quad	.LBB292
	.quad	.LBE292
	.quad	.LBB293
	.quad	.LBE293
	.quad	0
	.quad	0
	.quad	.LBB246
	.quad	.LBE246
	.quad	.LBB258
	.quad	.LBE258
	.quad	.LBB270
	.quad	.LBE270
	.quad	.LBB272
	.quad	.LBE272
	.quad	.LBB274
	.quad	.LBE274
	.quad	.LBB276
	.quad	.LBE276
	.quad	.LBB278
	.quad	.LBE278
	.quad	.LBB280
	.quad	.LBE280
	.quad	.LBB282
	.quad	.LBE282
	.quad	.LBB284
	.quad	.LBE284
	.quad	.LBB286
	.quad	.LBE286
	.quad	0
	.quad	0
	.quad	.LBB259
	.quad	.LBE259
	.quad	.LBB271
	.quad	.LBE271
	.quad	.LBB273
	.quad	.LBE273
	.quad	.LBB275
	.quad	.LBE275
	.quad	.LBB277
	.quad	.LBE277
	.quad	.LBB279
	.quad	.LBE279
	.quad	.LBB281
	.quad	.LBE281
	.quad	.LBB283
	.quad	.LBE283
	.quad	.LBB285
	.quad	.LBE285
	.quad	.LBB287
	.quad	.LBE287
	.quad	0
	.quad	0
	.quad	.LBB311
	.quad	.LBE311
	.quad	.LBB416
	.quad	.LBE416
	.quad	.LBB418
	.quad	.LBE418
	.quad	0
	.quad	0
	.quad	.LBB313
	.quad	.LBE313
	.quad	.LBB314
	.quad	.LBE314
	.quad	.LBB325
	.quad	.LBE325
	.quad	0
	.quad	0
	.quad	.LBB315
	.quad	.LBE315
	.quad	.LBB322
	.quad	.LBE322
	.quad	.LBB323
	.quad	.LBE323
	.quad	.LBB324
	.quad	.LBE324
	.quad	0
	.quad	0
	.quad	.LBB316
	.quad	.LBE316
	.quad	.LBB317
	.quad	.LBE317
	.quad	0
	.quad	0
	.quad	.LBB318
	.quad	.LBE318
	.quad	.LBB319
	.quad	.LBE319
	.quad	.LBB320
	.quad	.LBE320
	.quad	.LBB321
	.quad	.LBE321
	.quad	0
	.quad	0
	.quad	.LBB331
	.quad	.LBE331
	.quad	.LBB336
	.quad	.LBE336
	.quad	.LBB377
	.quad	.LBE377
	.quad	0
	.quad	0
	.quad	.LBB337
	.quad	.LBE337
	.quad	.LBB378
	.quad	.LBE378
	.quad	.LBB379
	.quad	.LBE379
	.quad	.LBB417
	.quad	.LBE417
	.quad	0
	.quad	0
	.quad	.LBB339
	.quad	.LBE339
	.quad	.LBB343
	.quad	.LBE343
	.quad	0
	.quad	0
	.quad	.LBB340
	.quad	.LBE340
	.quad	.LBB341
	.quad	.LBE341
	.quad	.LBB342
	.quad	.LBE342
	.quad	0
	.quad	0
	.quad	.LBB344
	.quad	.LBE344
	.quad	.LBB373
	.quad	.LBE373
	.quad	0
	.quad	0
	.quad	.LBB345
	.quad	.LBE345
	.quad	.LBB348
	.quad	.LBE348
	.quad	0
	.quad	0
	.quad	.LBB349
	.quad	.LBE349
	.quad	.LBB367
	.quad	.LBE367
	.quad	.LBB368
	.quad	.LBE368
	.quad	0
	.quad	0
	.quad	.LBB350
	.quad	.LBE350
	.quad	.LBB369
	.quad	.LBE369
	.quad	.LBB370
	.quad	.LBE370
	.quad	.LBB371
	.quad	.LBE371
	.quad	.LBB372
	.quad	.LBE372
	.quad	0
	.quad	0
	.quad	.LBB352
	.quad	.LBE352
	.quad	.LBB360
	.quad	.LBE360
	.quad	.LBB361
	.quad	.LBE361
	.quad	.LBB362
	.quad	.LBE362
	.quad	0
	.quad	0
	.quad	.LBB354
	.quad	.LBE354
	.quad	.LBB355
	.quad	.LBE355
	.quad	.LBB356
	.quad	.LBE356
	.quad	0
	.quad	0
	.quad	.LBB380
	.quad	.LBE380
	.quad	.LBB398
	.quad	.LBE398
	.quad	.LBB415
	.quad	.LBE415
	.quad	0
	.quad	0
	.quad	.LBB384
	.quad	.LBE384
	.quad	.LBB387
	.quad	.LBE387
	.quad	.LBB392
	.quad	.LBE392
	.quad	0
	.quad	0
	.quad	.LBB385
	.quad	.LBE385
	.quad	.LBB386
	.quad	.LBE386
	.quad	0
	.quad	0
	.quad	.LBB388
	.quad	.LBE388
	.quad	.LBB393
	.quad	.LBE393
	.quad	.LBB394
	.quad	.LBE394
	.quad	0
	.quad	0
	.quad	.LBB389
	.quad	.LBE389
	.quad	.LBB390
	.quad	.LBE390
	.quad	.LBB391
	.quad	.LBE391
	.quad	0
	.quad	0
	.quad	.LBB399
	.quad	.LBE399
	.quad	.LBB414
	.quad	.LBE414
	.quad	0
	.quad	0
	.quad	.LBB400
	.quad	.LBE400
	.quad	.LBB412
	.quad	.LBE412
	.quad	.LBB413
	.quad	.LBE413
	.quad	0
	.quad	0
	.quad	.LBB402
	.quad	.LBE402
	.quad	.LBB408
	.quad	.LBE408
	.quad	.LBB409
	.quad	.LBE409
	.quad	0
	.quad	0
	.quad	.LBB404
	.quad	.LBE404
	.quad	.LBB405
	.quad	.LBE405
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB5618
	.quad	.LFE5618
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF6:
	.ascii "GetLocalTime\0"
.LASF4:
	.ascii "GetSystemInfo\0"
.LASF0:
	.ascii "refcount\0"
.LASF3:
	.ascii "omp_set_num_threads\0"
.LASF5:
	.ascii "_mktime64\0"
.LASF1:
	.ascii "values\0"
.LASF2:
	.ascii "pivot_id\0"
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	omp_get_num_threads;	.scl	2;	.type	32;	.endef
	.def	omp_get_thread_num;	.scl	2;	.type	32;	.endef
	.def	omp_set_num_threads;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fscanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	GOMP_parallel;	.scl	2;	.type	32;	.endef
	.def	qsort;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
