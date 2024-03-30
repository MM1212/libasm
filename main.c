#include <libasm.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <error.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

int main(void)
{
	{
		printf("---ft_write---\n");
		const char *str = "Hello, World!\n";
		const size_t len = -1;
		printf("ft:\n");
		ssize_t ft = ft_write(STDOUT_FILENO, str, len);
		int err = errno;
		printf("sys:\n");
		ssize_t sys = write(STDOUT_FILENO, str, len);
		int err2 = errno;
		printf("[%s][%d] ft_write: %ld\n", strerror(err), err, ft);
		printf("[%s][%d] sys_write: %ld\n", strerror(err2), err2, sys);
	}
	{
		printf("---ft_read---\n");
		char buf[101];
		printf("ft:\n");
		ssize_t ft = ft_read(STDIN_FILENO, buf, 100);
		int ft_err = errno;
		if (ft < 0)
			ft = 0;
		buf[ft] = 0;
		printf("ft_res[%ld][%d -> %s]: %s\n", ft, ft_err, strerror(ft_err), buf);
		printf("sys:\n");
		ssize_t sys = read(STDIN_FILENO, buf, 100);
		int sys_err = errno;
		if (sys < 0)
			sys = 0;
		buf[sys] = 0;
		printf("sys_res[%ld][%d -> %s]: %s\n", sys, sys_err, strerror(sys_err), buf);
	}
	{
		printf("---ft_strlen---\n");
		char *str = "Hello World!\n";
		size_t ft_len = ft_strlen(str);
		size_t sys_len = strlen(str);
		printf("str: %s\n", str);
		printf("ft: %zu\n", ft_len);
		printf("sys: %zu\n", sys_len);
	}
	{
		printf("---ft_strcpy---\n");
		char *src = "Hello World!";
		char dst[64];
		printf("str: %s\n", src);
		char *ft_ret = ft_strcpy(dst, src);
		printf("ft: %s|%d, dst: %p, ft_ret: %zu, src: %p\n", dst, dst == ft_ret, dst, (size_t)ft_ret, src);
		char dst2[64];
		char *sys_ret = strcpy(dst2, src);
		printf("sys: %s|%d\n", sys_ret, dst2 == sys_ret);
	}
	{
		printf("---ft_strcmp---\n");
		char s1[] = {'H', -1, '\0'};
		char s2[] = {'H', -20, '\0'};
		printf("s1: %s | s2: %s\n", s1, s2);
		printf("sys: %d| ", strcmp(s1, s2));
		int diff = ft_strcmp(s1, s2);
		printf("ft: %d\n", diff);
	}
	{
		printf("---ft_strdup---\n");
		char *src = "Hello World!";
		printf("str: %s\n", src);
		char *ft = ft_strdup(src);
		printf("ft: %s\n", ft);
		char *sys = strdup(src);
		printf("sys: %s\n", sys);
		free(ft);
		free(sys);
	}

	return (0);
}
