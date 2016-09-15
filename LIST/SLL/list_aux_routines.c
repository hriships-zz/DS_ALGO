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

	return (NULL);
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

	return (NULL);
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
	node_t *back_node = list, *run = list -> next;

	while(run -> next != NULL)
	{
		back_node = run;
		run = run -> next;
	}
	return back_node;
}

void reverse_node(node_t **pp_node)
{
	if(*pp_node == NULL)
		return;
	
	node_t *current = *pp_node;
	node_t *next_node = current -> next;

	if(current-> next == NULL)
		return;

	reverse_node(&next_node);
	next_node -> next  = current;
	current -> next = NULL;

	*pp_node = next_node;
}

node_t *merge_sorted_list(node_t *head1, node_t *head2)
{
	if(head1 == NULL && head2 == NULL)
	{
		return NULL;
	}

	if(head2 == NULL && head1 != NULL)
	{
		head1 -> next = merge_sorted_list(head1 -> next, head2);
		return head1;
	}

	if(head1 == NULL && head2 != NULL)
	{
		head2 -> next = merge_sorted_list(head1, head2 -> next);
		return head2;
	}

	if(head1 -> data < head2 -> data)
	{
		 head1 -> next = merge_sorted_list(head1 -> next, head2);
		 return head1;
	}
	else
	{
		head2 -> next = merge_sorted_list(head1, head2 -> next);
		return head2;
	}

}

void list_to_array(list_t *list, len_t size, data_t array_object[])
{
	int index = 0;
	node_t *run = list -> next;
	
	while(run != NULL)
	{
		array_object[index++] = run -> data;
		run = run -> next;
	}
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
