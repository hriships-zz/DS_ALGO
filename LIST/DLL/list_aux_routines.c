#include <stdio.h>
#include <stdlib.h>
#include "dll.h"

void *xcalloc(int num_of_blocks, int block_size)
{
	void *mem_block;

	mem_block = calloc(num_of_blocks, block_size);
	if(mem_block == NULL) 
	{
		fprintf(stderr, "OUT OF MEMMORY : ERR CODE");
	}

	return mem_block;
}

node_t *get_node(data_t data)
{
	node_t *new_node = NULL;

	new_node = (node_t*) xcalloc(1, sizeof(node_t));
	new_node -> data = data;
	
	return new_node;
}

node_t *get_last_node(list_t *list)
{
	node_t *run;

	run = list;
	while(run -> next != NULL)
	{
		run = run -> next;
	}

	return run;
}

node_t *search_node(list_t *list, data_t data)
{
	node_t *run;

	run = list;
	while(run != NULL)
	{
		if(run -> data == data)
		{
			return run;
		}

		run = run -> next;
	}

	return NULL;
}

void link_nodes(node_t *target_node, node_t *new_node)
{
	new_node -> next = target_node -> next;
	new_node -> prev = target_node;
	if(target_node -> next != NULL)
	{
		target_node -> next -> prev = new_node;
	}
	target_node -> next = new_node;
}

void unlink_node(node_t *target)
{
	target -> prev -> next = target -> next;
	if(target -> next != NULL)
	{
		target -> next -> prev = target -> prev;
	}
	free(target);
}
