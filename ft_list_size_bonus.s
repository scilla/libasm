;int		ft_list_size(t_list *lst);

section .text
	global _ft_list_size

_ft_list_size:
	mov		rax, 0
	cmp		rdi, 0
	je		return
	inc		rax
	jmp		check_next
inc_res:
	inc		rax
	mov		rdi, [rdi + 8]
check_next:
	cmp		QWORD [rdi + 8], 0
	jne		inc_res
return:
	ret