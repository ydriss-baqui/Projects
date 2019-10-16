/*
** ETNA PROJECT, 11/10/2019 by baqui_y
** my_lookup
** File description:
**      my_lookup
*/

#include "../include/my_struct.h"
#include <stdlib.h>
#include "../include/my.h"
#include <unistd.h>

void my_lookup(my_crd_t *list, const int key_ref)
{
    my_crd_t *node;
    int t = 0;

    my_putchar('\n');
    node = list;
    while (node != NULL) {
        if (node->key == key_ref) {
            my_putnbr(node->data);
            t = 1;
        }
        node = node->next;
    }
    if (node == NULL && t == 0) {
        my_putnbr(-1);
    }
}
