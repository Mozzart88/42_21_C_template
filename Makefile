# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mozzart <mozzart@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/04 15:27:16 by tvanessa          #+#    #+#              #
#    Updated: 2020/10/05 23:31:14 by mozzart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

debug := 0

Fsrcs := fsrcs
SS := $(shell cat $(Fsrcs))
FH := fhdr
CHEADERS := $(shell cat $(FH))
OBJS := $(SS:.c=.o)
MAIN := 	shell


CC := clang
GCF := -g3 -Wall -Wextra -Werror
NAME := PROJ_NAME
LIBFT := libft
LIBFTA := libft/libft.a
CFLAGS := -Wall -Wextra -Werror

# Compiller selection
ifdef gcc
CC := gcc
else ifdef clang
CC := clang
else ifdef cc
CC := $(cc)
endif

# Debug mode
ifeq ($(debug), 1)
CFLAGS := $(GCF)
endif
CFLAGS += -I . -I libft/ -I includes/
CFS := -L libft/ -lft

all: $(LIBFT) $(NAME)

%.o: %.c $(CHEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): $(OBJS) $(LIBFTA)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(CFS)
	
$(LIBFT):
	make -C libft debug=$(debug)

clean:
	make -C libft/ clean
	/bin/rm -f $(OBJS)

fclean: clean
	make -C libft/ fclean
	/bin/rm -f $(NAME)

re: fclean all

.PHONY: clean libft all