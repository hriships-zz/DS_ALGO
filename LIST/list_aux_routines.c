#include<stdio.h>
#include<stdlib.h>
#include "list.h"

node_t* get_new_node() {
    return (node_t*) xcalloc(1, sizeof(node_t));    
}

