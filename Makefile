# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tvanessa <tvanessa@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/04 15:27:16 by tvanessa          #+#    #+#              #
#    Updated: 2020/01/11 22:43:07 by tvanessa         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

S = ./
SS = $(S) ## !!!
H = -I . -I libft
NAME = ## !!!
CC = gcc
GCF = -g3 -Wall -Wextra -Werror
CF = -Wall -Wextra -Werror

all: $(NAME)

%.o: %.c libft.h
	$(CC) $(GCF) $(H) -c -o $@ $<

$(NAME): $(SS:.c=.o)
	## !!!

clean:
	make -C libft/ clean
	/bin/rm -f $(SS:.c=.o)

fclean: clean
	make -C libft/ fclean
	/bin/rm -f $(NAME)

re: fclean all
