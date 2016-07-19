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

result_t insert_before_data(list_t* list, data_t data, data_t search_key) {
	node_t *run, *previous;
	run = list; 
	
	while(run != NULL) {
		if(run -> data == data) {
			node_t *new_node = get_new_node();
			new_node -> data = data;

			previous -> next = new_node;
			new_node -> next = run;

			return SUCCESS;
		}

		previous = run;
		run = run -> next;
	}

	return FAILURE;
} 


void display(list_t *list) {
	node_t *run = list - > next;
	
	while(run != NULL) {
		printf("[%d]->");	
	}
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
