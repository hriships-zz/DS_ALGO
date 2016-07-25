#include<stdio.h>
#include<stdlib.h>
#include "list.h"
#include "list_aux.h"

list_t *create_list() {
    return get_new_node(0);
}

result_t insert_beginning(list_t *list, data_t data) {
    node_t *new_node = get_new_node(data);
    node_t *run = list;

    place_node(run, new_node);

    return SUCCESS;
}

result_t insert_before_data(list_t* list, data_t data, data_t search_key) {
    result_t result;
    node_t *target_node = search_previous_node(list, search_key);

    if(target_node != NULL) {
        node_t *new_node = get_new_node(data);
        place_node(target_node, new_node);
        result = SUCCESS;
    } else {
        result = FAILURE;
    }

	return result;
} 

result_t insert_after_data(list_t *list, data_t insert_value, data_t search_key) {
    result_t result;
    node_t *target_node = search_node(list, search_key);

    if(target_node != NULL) {
        node_t * new_node = get_new_node(insert_value);
        place_node(target_node, new_node);
        result = SUCCESS;
    } else {
        result = FAILURE;
    }

    return result;
}

result_t insert_end(list_t *list, data_t data) {
    result_t result;
    node_t *end_node = get_end_node(list);
    
    if(end_node != NULL) {
        node_t *new_node = get_new_node(data);
        place_node(end_node, new_node);
        result = SUCCESS;
    } else {
        result = FAILURE;
    }

    return result;
}

result_t delete_beginning(list_t *list) {
    delete_node(list, list -> next);

    return SUCCESS;
}

result_t delete_data(list_t *list, data_t data) {
    
    node_t *node = search_node(list, data);

    if(node != NULL) {
        delete_node(list, node);
        return SUCCESS;
    } else {
        return FAILURE;
    }
}

result_t delete_end(list_t *list) {
    
    node_t *end_node = get_end_node(list);
    
    if(end_node != NULL) {
        delete_node(list, end_node);
        return SUCCESS;
    } else {
        return FAILURE;
    }
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
    node_t *run = list;
    while(run != NULL) {
        if(run -> data == data) {
            return (DATA_FOUND);
        }     
        run = run -> next;
    }

    return DATA_NOT_FOUND;
}
