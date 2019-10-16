/*
** ETNA PROJECT, 12/10/2019 by baqui_y
** my_main
** File description:
**      my_main
*/

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "./include/my_struct.h"

void my_putchar(char c)
{
    write(1, &c, 1);
}
void my_putstr(const char *str)
{
    int compteur = 0;

    while (str[compteur] != '\0') {
        my_putchar(str[compteur]);
        ++compteur;
    }
}


char *my_readline(void)
{
    size_t n = 0;
    char *ret = NULL;
    ssize_t result = getline(&ret, &n, stdin);

    if (result <= 0) {
        free(ret);
        return NULL;
    }
    if (ret[result - 1] == '\n') {
        ret[result - 1] = '\0';
    }
    return ret;
}

int main()
{
    char *str = my_readline();
    while (*str != 0) {
        my_putchar('\n');
        my_putstr(str);
        str = my_readline();
    }
    return (0);
}
