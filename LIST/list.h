#ifndef LIST_H
#define LIST_H

struct node;
typedef struct node node_t;
typedef node_t list_t;
typedef int data_t;
typedef int result_t;

struct node {
    data_t data;
    node_t *next;
}; 

#define DATA_FOUND 1
#define DATA_NOT_FOUND 2

#define SUCCESS 0;
#define FAILURE -1;

/*create operation*/
list_t *create_list();

/*insert operations*/
result_t insert_beginning(list_t *list, data_t data);
result_t insert_before_data(list_t *list, data_t insert_value, data_t search_key);
result_t insert_after_data(list_t *list, data_t insert_value, data_t search_key);
result_t insert_end(list_t *list,  data_t data);

/*delete operations*/
result_t delete_beginning(list_t *list);
result_t delete_after_data(list_t *list, data_t data);
result_t delete_before_data(list_t *list, data_t data);
result_t delete_end(list_t *list);

/*search*/
result_t examine_data(list_t *list, data_t data);
result_t search(list_t *list, data_t data);

/*display*/
void display(list_t *list);

/*list aux function*/
node_t *get_new_node(data_t data);

/*auxilary routines*/
void *xcalloc(int number_of_blocks, int block_size);


#endif
