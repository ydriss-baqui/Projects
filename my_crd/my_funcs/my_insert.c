/*
** ETNA PROJECT, 11/10/2019 by baqui_y
** my_insert
** File description:
**      my_insert
*/

#include "../include/my_struct.h"
#include <stdlib.h>
#include "../include/my.h"
#include <unistd.h>

my_crd_t *my_insert(my_crd_t *list, int data, const int key_ref)
{
    my_crd_t *node;
    my_crd_t *tmp;

    tmp = list;
    while (tmp != NULL) {
        if (tmp->key == key_ref) {
            tmp->data = data;
            my_putnbr(tmp->key);
            return (list);
        }
        tmp = tmp->next;
    }
    node = malloc(sizeof(*node));
    node->next = list;
    node->key = key_ref;
    node->data = data;
    my_putnbr(node->key);
    list = node;
    return (list);
}
