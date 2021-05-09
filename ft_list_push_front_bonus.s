;void	ft_list_push_front(t_list **begin_list, void *data);

section .text
	global _ft_list_push_front
	extern _malloc

_ft_list_push_front:
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rsi
	pop		rdi
	mov		[rax], rsi
	mov		rcx, [rdi]
	mov		QWORD [rax + 8], rcx
	mov		[rdi], rax
return:
	ret