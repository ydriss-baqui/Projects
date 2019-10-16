/*
** ETNA PROJECT, 09/10/2019 by baqui_y
** my_putchar
** File description:
**      my_putchar
*/

#include <unistd.h>

void my_putchar(char c)
{
    write(1, &c, 1);
}
