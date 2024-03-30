section .data
	text db "Hello, World!", 10
	text_len equ $ - text

%macro exit 1
	mov rax, 60
	mov rdi, %1
	syscall
%endmacro

%macro write 3
	mov rax, 1
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
%endmacro

section .text
	global _start

_start:
	write 1, text, text_len
	exit 0
