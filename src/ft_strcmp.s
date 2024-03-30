section .text
global ft_strcmp

; rdi - char* s1
; rsi - char* s2
; rbx - iter
; rcx - tmp
ft_strcmp:
	mov rbx, 0
ft_strcmp.loop:
	cmp byte [rsi + rbx], 0
	je ft_strcmp.end
	cmp byte [rdi + rbx], 0
	je ft_strcmp.end
	mov cl, byte [rsi + rbx]
	cmp byte [rdi + rbx], cl
	jne ft_strcmp.end
	inc rbx
	jmp ft_strcmp.loop
ft_strcmp.end:
	mov al, byte [rdi + rbx]
	mov cl, byte [rsi + rbx]
	sub al, cl
	ret
