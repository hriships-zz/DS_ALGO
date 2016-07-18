#include<stdio.h>
#include<stdlib.h>
#include "list.h"


list_t *create_list() {
    list_t *list = NULL;
    list = (list_t*) calloc(1, sizeof(node_t));
    
    if(list == NULL) {
        fprintf(stderr, "error::out of memory\n");
    }

    return list;
}

