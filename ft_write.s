; write(int fildes, const void *buf, size_t nbyte)
; fildes = rdi, buf = rsi, nbyte = rdx

section	.text
	global	_ft_write
	extern	___error
_ft_write:								
	mov		rax, 0x2000004
	syscall
	jc		iserror
	jmp		return
iserror:
	push	rax
	call	___error
	pop		r10
	mov		[rax], r10
	mov		rax, -1
return:
	ret