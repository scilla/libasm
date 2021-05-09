/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: scilla <scilla@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/04 15:16:20 by scilla            #+#    #+#             */
/*   Updated: 2021/05/05 16:34:06 by scilla           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "ft_libasm.h"

int	main(void)
{
	char 	*str;
	int		i;
	int		res;
	/*
	printf("\t\tFT_STRLEN\n");
	str = "check this out";
	i = 14;
	res = ft_strlen(str);
	printf("test: %s\ngot:%d\texpected:%d\n", str, res, i);
	if (i ^ res) {
		printf("KO!!!\n");
	} else {
		printf("ok\n");
	}
	printf("----------\n");
	str = "";
	i = 0;
	res = ft_strlen(str);
	printf("test: %s\ngot:%d\texpected:%d\n", str, res, i);
	if (i ^ res) {
		printf("KO!!!\n");
	} else {
		printf("ok\n");
	}
	printf("----------\n");

	printf("\t\tFT_STRCMP\n");
	char *str1 = "check this out\xfe";
	char *str2 = "check this out";
	i = strcmp(str1, str2);
	res = ft_strcmp(str1, str2);
	printf("test: %s\ngot:%d\texpected:%d\n", str, res, i);
	if (i ^ res) {
		printf("KO!!!\n");
	} else {
		printf("ok\n");
	}
	printf("----------\n");
	
	*/
	printf("\t\tFT_STRDUP\n");
	char *str1 = strdup("check this out");
	char *str2 = ft_strdup("check this out");
	printf("test: %s\nexpected:%s\n", str1, str2);
	/*
	if (i ^ res) {
		printf("KO!!!\n");
	} else {
		printf("ok\n");
	}
	*/
	printf("----------\n");
	return (0);
}