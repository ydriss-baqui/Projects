CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror -std=c11
NAME	=	my_test
SRC		=	test.c\
			my_funcs/my_delete.c\
			my_funcs/my_insert.c\
			my_funcs/my_lookup.c\
			my_funcs/my_putchar.c\
			my_funcs/my_putnbr.c

OBJ		=	$(SRC:%.c=%.o)
RM		=	rm -f

$(NAME):	$(OBJ)
			$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

all:		$(NAME)

clean:
			$(RM) ./my_funcs/*.o

fclean:		clean
			$(RM) $(NAME)
			$(RM) test.o
			$(RM) my_test

re:			fclean all
