#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "sll.h"

void *xcalloc(int units, int unit_size) 
{
	void *block = calloc(units, unit_size);
	
	if(block == NULL) 
	{
		fprintf(stderr, "OUT OF MEMMORY");
	}

	return block;
}
node_t *get_new_node(data_t data) 
{
	node_t *new_node = (node_t*) xcalloc(1, sizeof(node_t));
	new_node -> data =  data;
	return new_node;
}

void link_nodes(node_t *target, node_t *new_node) 
{
	new_node -> next = target -> next;
	target -> next = new_node;
}
