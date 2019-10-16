/*
** ETNA PROJECT, 09/10/2019 by baqui_y
** my_putnbr
** File description:
**      my_putnbr
*/

#include <unistd.h>

void my_putchar(char c);

void my_putnbr(int nb)
{
    if (nb == -2147483648) {
        my_putchar('-');
        my_putchar('2');
        nb = 147483648;
    }
    if (nb < 0) {
        my_putchar('-');
        nb = -nb;
    }
    if (nb >= 10) {
        my_putnbr(nb / 10);
        my_putchar(nb % 10 + 48);
    }
    if (nb < 10) {
        my_putchar(nb % 10 + 48);
    }
}
