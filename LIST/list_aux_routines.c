#include<stdio.h>
#include<stdlib.h>
#include<signal.h>
#include "list.h"

node_t* get_new_node(data_t data) {
    node_t *node = (node_t*) xcalloc(1, sizeof(node_t));
    node -> data = data;

    return node;
}

void place_node(node_t *target, node_t *new_node) {
    new_node -> next = target -> next;
    target -> next = new_node;
}

void delete_node(list_t* list, node_t* node) {
    node_t **node_pp = &list -> next;

    while((*node_pp) != node)
        node_pp = &(*node_pp) -> next;

    *node_pp = node -> next;

    free(node);
}

node_t* search_node(list_t *list, data_t data) {
    node_t *run = list -> next;

    while(run != NULL) {
        if(run -> data == data)
            return run;
        else
            run = run -> next;
    }

    return NULL;

}

node_t* get_end_node(list_t *list) {
    node_t *run = list ->next;

    while(run -> next != NULL) {
        run = run -> next;
    }

    return run;
}

node_t* search_previous_node(list_t *list, data_t data) {
    node_t *run = list;
    
    while(run -> next -> data != data) {
        run = run -> next;
    }

    return run;
}
