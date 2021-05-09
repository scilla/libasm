;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)())

section .text
	global _ft_list_remove_if
	extern _malloc

_ft_list_remove_if:
	cmp		QWORD [rdi], 0
	je		return
	mov		r8, [rdi]
	cmp		QWORD [r8], 0
	je		return
	push	rdi
	push	rsi
	push	rdx
	mov		rdi, [r8]
	call	rdx
	pop		rdx
	pop		rsi
	pop		rdi
return:
	ret