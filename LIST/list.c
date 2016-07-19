#include<stdio.h>
#include<stdlib.h>
#include "list.h"

list_t *create_list() {
    return get_new_node(0);
}

result_t insert_beginning(list_t *list, data_t data) {
    node_t *new_node = get_new_node(data);

    node_t *run = list;

    new_node -> next = run -> next;
    run -> next = new_node;
    return SUCCESS;
}

result_t insert_before_data(list_t* list, data_t data, data_t search_key) {
	node_t *run = list;
	
	while(run->next != NULL) {
		if(run -> next -> data == search_key) {
			node_t *new_node = get_new_node(data);
           
			new_node -> next = run->next;
            run -> next = new_node;

			return SUCCESS;
		}

		run = run -> next;
	}

	return FAILURE;
} 

result_t insert_after_data(list_t *list, data_t insert_value, data_t search_key) {
    node_t *run = list -> next;

    while(run != NULL) {
        if(run -> data == search_key) {
            node_t * new_node = get_new_node(insert_value);

            new_node -> next = run -> next;
            run -> next = new_node;

            return SUCCESS;
        }
    }

    return FAILURE;
}

result_t insert_end(list_t *list, data_t data) {
    node_t *run = list -> next;
    while(run -> next != NULL) {
        run = run-> next;
    }
    
    node_t *new_node = get_new_node(data);

    new_node -> next = run -> next;
    run -> next = new_node;

    return SUCCESS;
}

void display(list_t *list) {
	node_t *run = list -> next;
	
    printf("[start]");
	while(run != NULL) {
		printf("[%d]->", run -> data);

        run = run -> next;
	}
    printf("[end]\n");
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
