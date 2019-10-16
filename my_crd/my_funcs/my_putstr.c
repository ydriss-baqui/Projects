/*
** ETNA PROJECT, 09/10/2019 by baqui_y
** my_putstr
** File description:
**      my_putstr
*/

#include <unistd.h>

void my_putchar(char c);

void my_putstr(const char *str)
{
    int compteur = 0;

    while (str[compteur] != '\0') {
        my_putchar(str[compteur]);
        ++compteur;
    }
}
