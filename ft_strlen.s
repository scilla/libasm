;int	ft_strlen(char *str)
;{
;	long int i;
;
;	i = 0;
;	while (str[i] != '\0')
;		i++;
;	return (i);
;}

section .text
	global _ft_strlen

_ft_strlen:
	mov		rax, 0
	jmp		check
advance:
	inc		rax
check:
	cmp		BYTE [rdi + rax], 0		; str[i] == '\0'
	jne		advance
return:
	ret