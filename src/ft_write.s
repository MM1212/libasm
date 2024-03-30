section .text
%include "src/tools.s"
global ft_write

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl _error
	mov rax, 10
	ret

CHECK_ERROR_LABEL
