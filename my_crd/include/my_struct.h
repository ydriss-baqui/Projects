/*
** ETNA PROJECT, 11/10/2019 by baqui_y
** my_struct.h
** File description:
**      my_struct
*/

#ifndef __MY_CRD_H__
#define __MY_CRD_H__

typedef struct my_crd
{
    int key;
    int data;
    struct my_crd *next;
} my_crd_t;

#endif
