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

void unlink_nodes(node_t *target, node_t *remove_node)
{
	target -> next = remove_node -> next;
	free(remove_node);
}

node_t *serch_node(list_t *list, data_t data) 
{
	node_t *run = list -> next;

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

node_t *serch_back_node(list_t *list, data_t data)
{
	node_t *run = list;

	while(run -> next != NULL)
	{
		if(run -> next -> data == data) 
		{
			return run;
		}
		run = run -> next;
	}

	return NULL;
}

node_t *get_last_node(list_t *list)
{
	node_t *run = list;

	while(run -> next != NULL) 
	{
		run = run -> next;
	}

	return run;
}

node_t *get_second_last_node(list_t *list)
{
	node_t **run = &list -> next;

	while(run != NULL && (*run) -> next != NULL) 
	{
		run = &(*run) -> next;
	}
	run = (node_t**)(run - sizeof(data_t));
		
	return (*run);
}