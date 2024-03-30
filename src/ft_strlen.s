section .text
global ft_strlen

; rdi - char*
; rax - count
ft_strlen:
	mov rax, 0
ft_strlen.loop:
	cmp byte [rdi + rax], 0
	je ft_strlen.end
	inc rax
	jmp ft_strlen.loop
ft_strlen.end:
	ret
