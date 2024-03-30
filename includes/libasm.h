/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: martiper <martiper@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/30 10:18:34 by martiper          #+#    #+#             */
/*   Updated: 2024/03/30 13:10:14 by martiper         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <stddef.h>
#include <unistd.h>

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
size_t ft_strlen(char* str);
char* ft_strcpy(char* dst, char* src);
int ft_strcmp(const char* s1, const char* s2);
char* ft_strdup(const char* src);
