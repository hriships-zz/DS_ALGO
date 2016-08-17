#ifndef LIST_H
#define LIST_H

//Constants
#define SUCCESS 2
#define ERROR 	-1
#define TRUE 	1
#define FALSE	0

struct _node;

//Hide data layout and define list ADT
typedef struct _node node_t;
typedef struct _node list_t;
typedef int data_t;
typedef int result_t;
typedef int len_t;

/*List interface routines*/

// Creation
list_t *create_list();

// Insertion
result_t insert_at_begin(list_t *list, data_t data);
result_t insert_at_end(list_t *list, data_t data);
result_t insert_before_data(list_t *list, data_t search_key, data_t insert_key);
result_t insert_after_data(list_t *list, data_t search_key, data_t insert_key);

// Deletion
result_t delete_begin(list_t *list);
result_t delete_data(list_t *list, data_t data);
result_t delete_end(list_t *list);

// Membership routines
result_t is_at_begining(list_t *list, data_t data);
result_t is_before(list_t *list, data_t search_key, data_t next_key);
result_t find(list_t *list, data_t data);
result_t is_after(list_t *list, data_t search_key, data_t after_data);
result_t is_at_end(list_t *list, data_t data);

// Examine
result_t examine_del_beg(list_t *list, data_t *p_object);
result_t examine_del_end(list_t *list, data_t *p_object);

// Misc
result_t is_empty(list_t *list);
void print_list(list_t *list);
result_t sort(list_t *list);
len_t length(list_t *list);

#endif /* _LIST_H */