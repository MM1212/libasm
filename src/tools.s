extern __errno_location

%macro EXIT 1
	mov rax, 60
	mov rdi, %1
	syscall
%endmacro

%macro WRITE 3
	mov rax, 1
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
%endmacro

%macro CHECK_ERROR_LABEL 0
_error:
	neg rax
	mov rbx, rax	; save errno
	call __errno_location WRT ..plt	; retrieve address to errno
	mov [rax], rbx	; put errno in return value of __error (pointer to errno)
	mov rax, -1
	ret
%endmacro
