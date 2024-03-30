section .text
global ft_strcpy

; rdi - char* dst
; rsi - char* src
; rax - iter
;
ft_strcpy:
	mov rax, 0
ft_strcpy.loop:
	cmp byte [rsi + rax], 0
	je ft_strcpy.end
	mov cl, byte [rsi + rax]
	mov byte [rdi + rax], cl
	inc rax
	jmp ft_strcpy.loop
ft_strcpy.end:
	mov byte [rdi + rax], 0
	mov rax, rdi
	ret
