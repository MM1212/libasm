section .text
%include "src/tools.s"
global ft_read

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl _error
	ret

CHECK_ERROR_LABEL
