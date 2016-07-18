#include<stdio.h>
#include<stdlib.h>
#include "list.h"

list_t *create_list() {
    list_t *list = NULL;
    list = (node_t*) xcalloc(1, sizeof(node_t));

    return list;
}
