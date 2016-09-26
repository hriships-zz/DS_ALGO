#ifndef LIST_AUX_H
#define LIST_AUX_H

#include "list.h"

void *xcalloc(int units, int unit_size);
node_t *get_new_node(data_t data);

void link_nodes(node_t *target, node_t *new_node);
void unlink_nodes(node_t *target, node_t *remove_node);

node_t *search_node(list_t *list, data_t data);
node_t *search_back_node(list_t *list, data_t data);
node_t *get_last_node(list_t *list);
node_t *get_second_last_node(list_t *list);
void reverse_node(node_t **pp_node, node_t *head);

data_t* list_to_array(list_t *list, len_t size);
void array_to_list(data_t array_object[], len_t size, list_t *list);

#endif
