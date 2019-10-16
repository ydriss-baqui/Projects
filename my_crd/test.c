/*
** ETNA PROJECT, 11/10/2019 by baqui_y
** test
** File description:
**      test
*/

#include "./include/my_struct.h"
#include <stdlib.h>
#include "./include/my.h"
#include <unistd.h>

int main()
{
    my_crd_t *list;
    my_crd_t *tmp;

    list = NULL;
    list = my_insert(list, 5, 34);
    my_putchar('\n');
    list = my_insert(list, 7, 40);
    my_putchar('\n');
    list = my_insert(list, 8, 35);
    tmp = list;
    while (tmp != NULL) {
        my_putchar('\n');
        my_putnbr(tmp->data);
        my_putchar('\n');
        my_putnbr(tmp->key);
        tmp = tmp->next;
    }
    tmp = list;
    my_putchar('\n');
    my_remove(list, 40);
    my_lookup(list, 40);
    my_lookup(list, 35);
    my_lookup(list, 34);
    my_putchar('\n');
    return (0);
}
