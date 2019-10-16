/*
** ETNA PROJECT, 11/10/2019 by baqui_y
** my_delete
** File description:
**      my_delete
*/

#include "../include/my_struct.h"
#include <stdlib.h>
#include "../include/my.h"
#include <unistd.h>

void my_remove(my_crd_t *list, const int key_ref)
{
    my_crd_t *node;
    my_crd_t *temp;
    my_crd_t *temp2;
    int verif = 0;

    node = list;
    while (node != NULL) {
        if (node->key == key_ref) {
            temp = node;
            if (node == list) {
                temp = list;
                list = list->next;
                free(temp);
            }
            else {
                temp2 = node->next;
                free(node);
                temp->next = temp2;
            }
            my_putnbr(key_ref);
            verif = 1;
        }
        node = node->next;
    }
    if (verif == 0)
        my_putnbr(-1);
}
