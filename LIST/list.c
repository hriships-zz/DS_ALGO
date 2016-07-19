#include<stdio.h>
#include<stdlib.h>
#include "list.h"

list_t *create_list() {
    return get_new_node();
}

result_t insert_beginning(list_t *list, data_t data) {
    node_t *node = get_new_node();
    node -> data = data;

    node_t *run = list -> next;
    list -> next = node;
    if(run != NULL) {
        node -> next = run;
    }

    return SUCCESS;
}

result_t search(list_t *list, data_t data) {
    node_t *run = list -> next;
    while(run != NULL) {
        if(run -> data == data) {
            return (DATA_FOUND);
        }     
        run = run -> next;
    }

    return DATA_NOT_FOUND;
}
