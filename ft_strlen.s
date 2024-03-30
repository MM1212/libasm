	.text
	.intel_syntax noprefix
	.file	"ft_strlen.c"
	.globl	ft_strlen                       # -- Begin function ft_strlen
	.p2align	4, 0x90
	.type	ft_strlen,@function
ft_strlen:                              # @ft_strlen
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 16], rdi
	cmp	qword ptr [rbp - 16], 0
	jne	.LBB0_2
# %bb.1:
	mov	qword ptr [rbp - 8], 0
	jmp	.LBB0_6
.LBB0_2:
	mov	dword ptr [rbp - 20], 0
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 20]
	cmp	byte ptr [rax + rcx], 0
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	.LBB0_3
.LBB0_5:
	movsxd	rax, dword ptr [rbp - 20]
	mov	qword ptr [rbp - 8], rax
.LBB0_6:
	mov	rax, qword ptr [rbp - 8]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ft_strlen, .Lfunc_end0-ft_strlen
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
