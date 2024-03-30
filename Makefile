# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: martiper <martiper@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/30 09:59:57 by martiper          #+#    #+#              #
#    Updated: 2024/03/30 11:10:50 by martiper         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PROJECT_NAME = Libft

SRCS_DIR = src

SRCS = ft_write.s

OBJ_DIR = objs

SRC_FILES = $(addprefix $(SRCS_DIR)/, $(SRCS))
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.s=.o))

AR = ar
AS = nasm


ARFLAGS = rcs
ASFLAGS = -felf64 -g

ARCH_DIR = bin
NAME =	$(addprefix $(ARCH_DIR)/, libasm.a)

CC = cc
CFLAGS = -Wall -Wextra -Werror -Iincludes #-S -mllvm --x86-asm-syntax=intel
LFLAGS = -L$(ARCH_DIR) -lasm
### COLORS ###

RED = \033[0;31m
GREEN = \033[0;92m
YELLOW = \033[93m
BLUE = \033[0;34m
MAGENTA = \033[0;35m
CYAN = \033[96m
RESET = \033[0m

TAG = [$(CYAN)$(PROJECT_NAME)$(RESET)]

### END OF COLORS ###

all: $(NAME)

$(NAME) : $(OBJS)
	@mkdir -p $(dir $@)
	@$(AR) $(ARFLAGS) $(NAME) $^
	@echo "$(TAG) bundled $(YELLOW)$(NAME)$(RESET)!"

$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.s
	@echo "$(TAG) building $(YELLOW)$<$(RESET).."
	@mkdir -p $(dir $@)
	@$(AS) $(ASFLAGS) $< -o $@

clean:
	@printf "$(TAG) cleaned $(YELLOW)objects!$(RESET)\n"
	@rm -rf $(OBJS) $(OBJ_DIR)

fclean: clean
	@printf "$(TAG) cleaned $(YELLOW)archive!$(RESET)\n"
	@rm -f $(NAME)

re: fclean
	@$(MAKE) all --no-print-directory -j $(shell nproc)

bonus: all

.PHONY : all clean fclean re bonus

test: all main.c
	@$(CC) $(CFLAGS) main.c -o test $(LFLAGS)
