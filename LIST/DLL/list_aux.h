#ifndef LIST_AUX_H
#define LIST_AUX_H

#include "list.h"

void *xcalloc(int num_of_blocks, int block_size);
node_t *get_node(data_t data);
node_t *get_last_node(list_t *list);
node_t *search_node(list_t *list, data_t data);
void link_nodes(node_t *target_node, node_t *new_node);
void unlink_node(node_t *target);

data_t *list_to_array(list_t *list, len_t size);
list_t *array_to_list(data_t *array_data, len_t size);
#endif
