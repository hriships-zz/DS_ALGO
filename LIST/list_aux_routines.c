#include<stdio.h>
#include<stdlib.h>
#include "list.h"

node_t* get_new_node(data_t data) {
    node_t *node = (node_t*) xcalloc(1, sizeof(node_t));
    node -> data = data;

    return node;
}

