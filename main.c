#include <libasm.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <error.h>
int main(void)
{
	const char *str = "Hello, World!\n";
	printf("ft:\n");
	ssize_t ft = ft_write(-1, str, strlen(str));
	int err = errno;
	printf("\nsys:\n");
	ssize_t sys = write(-1, str, strlen(str));
	int err2 = errno;
	printf("[%s][%d] ft_write: %ld\n", strerror(err), err, ft);
	printf("[%s][%d] sys_write: %ld\n", strerror(err2), err2, sys);
	return (0);
}
