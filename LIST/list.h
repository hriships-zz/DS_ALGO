#ifndef LIST_H
#define LIST_H

struct node;
typedef struct node node_t;
typedef struct node list_t;
typedef int data_t;
typedef int result_t;

list_t *create_list();

/*insert operations*/
result_t insert_beginning(list_t *list, data_t data);

result_t insert_before_data(list_t *list, data_t insert_value, data_t search_key);

result_t insert-after_data(list_t *list, data_t insert_value, data_t search_keey);

result_t insert_end(list_t *list,  data_t data);

#endif
