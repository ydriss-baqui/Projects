/*
** ETNA PROJECT, 04/10/2019 by baqui_y
** my.h
** File description:
**      my.h
*/

#include "./my_struct.h"

void my_putchar(char c);
my_crd_t *my_insert(my_crd_t *list, int data, const int key_ref);
void my_remove(my_crd_t *list, const int key_ref);
void my_lookup(my_crd_t *list, const int key_ref);
void my_putnbr(int nb);
void my_putstr(const char *str);
