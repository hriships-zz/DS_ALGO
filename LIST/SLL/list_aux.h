#ifndef LIST_AUX_H
#define LIST_AUX_H

#include "list.h"

void *xcalloc(int units, int unit_size);
node_t *get_new_node(data_t data);

void link_nodes(node_t *target, node_t *new_node);

node_t *serch_node(list_t *list, data_t data);
node_t *serch_back_node(list_t *list, data_t data);

#endif