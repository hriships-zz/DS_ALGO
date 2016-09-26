#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "scll.h"

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

node_t *search_node(list_t *list, data_t data) 
{
	node_t *run = list -> next;

	while(run != list)
	{
		if(run -> data == data)
		{
			return run;
		}
		run = run -> next;
	}

	return (NULL);
}

node_t *get_last_node(list_t *list)
{
	node_t *run;
	run = list;

	while(run -> next != list) 
	{
		run = run -> next;
	}

	return run;
}

node_t *search_back_node(list_t *list, data_t data)
{
	node_t *run;
	run = list;
	
	while(run -> next != list)
	{
		if(run -> next -> data == data) 
		{
			return run;
		}
		run = run -> next;
	}
	
	return (NULL);
}

node_t *get_second_last_node(list_t *list)
{
	node_t *back_node = list, *run = list -> next;

	while(run -> next != list)
	{
		back_node = run;
		run = run -> next;
	}
	return back_node;
}

void reverse_node(node_t **pp_node, node_t *head)
{
	if(*pp_node == head)
		return;
	
	node_t *current = *pp_node;
	node_t *next_node = current -> next;

	if(current-> next == head)
		return;

	reverse_node(&next_node, head);
	node_t *temp = current -> next -> next;
	current -> next -> next = current;
	current -> next = temp;

	*pp_node = next_node;
}

data_t* list_to_array(list_t *list, len_t size)
{
	int index;
	data_t* array_object;
	node_t *run;

	index = 0;
	array_object = (data_t*) xcalloc(size, sizeof(data_t));
	run = list -> next;
	
	while(run !=list)
	{
		array_object[index++] = run -> data;
		run = run -> next;
	}

	return array_object;
}

void array_to_list(data_t array_object[], len_t size, list_t *list)
{
	int index = 0;
	node_t *run = list -> next;

	for(index =0; index < size; index++)
	{
		run -> data = array_object[index];
		run = run -> next;
	}
}
