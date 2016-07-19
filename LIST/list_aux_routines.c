#include<stdio.h>
#include<stdlib.h>

node_t* get_node() {
    return (node_t*) xcalloc(1, sizeof(node_t));    
}

