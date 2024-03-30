section .text
%include "src/tools.s"
extern malloc
extern ft_strlen
extern ft_strcpy
global ft_strdup

; rdi - char* src
; rax - char* dst
; rsi - size_t len
ft_strdup:
	cmp rdi, 0
	je ft_strdup.end
	call ft_strlen
	mov rsi, rax
	push rdi
	mov rdi, rsi
	inc rdi
	call malloc WRT ..plt
	cmp rax, 0
	jl _error
	pop rdi
	mov rsi, rdi
	mov rdi, rax
	call ft_strcpy
ft_strdup.end:
	ret

CHECK_ERROR_LABEL
