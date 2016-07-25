#ifndef AUX_LIST
#define AUX_LIST

node_t *get_new_node(data_t data);
void place_node(node_t *target, node_t* new_node);
void delete_node(list_t* list, node_t* node);

node_t* search_node(list_t *list, data_t data);
node_t* get_end_node(list_t *list);
node_t* search_previous_node(list_t *list, data_t data);

#endif
