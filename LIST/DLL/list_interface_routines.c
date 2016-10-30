#include <stdio.h>
#include <stdlib.h>
#include "list_aux.h"
#include "dll.h"

list_t *create_list()
{
	return (list_t*) xcalloc(1, sizeof(list_t));	
}

result_t insert_at_begin(list_t *list, data_t data)
{
	node_t *head, *new_node;

	head = list;
	new_node = get_node(data);

	new_node -> next = head -> next;
	if(head -> next != NULL)
		head -> next -> prev = new_node;
	head -> next = new_node;
	new_node -> prev = head;

	return (SUCCESS);
}

result_t is_at_begining(list_t *list, data_t data)
{
	node_t *run = list;
	return (run -> next != NULL && run -> next -> data == data) ? (TRUE) : (FALSE);
}

result_t insert_at_end(list_t *list, data_t data)
{
	node_t *run, *new_node;

	run = list -> next;
	while(run -> next != NULL)
	{
		run = run -> next;
	}

	new_node = get_node(data);
	
	new_node -> next = run -> next;
	if(run -> next != NULL)
		run -> next -> prev = new_node;
	run -> next = new_node;
	new_node -> prev = run;

	return (SUCCESS);
}

result_t is_at_end(list_t *list, data_t data)
{
	node_t *run;
	
	run = list -> next;
	while(run -> next != NULL)
	{
		run = run -> next;
	}

	if(run -> data == data)
	{
		return (TRUE);
	}
	else 
	{
		return (FALSE);
	}
}

void print_list(list_t *list)
{
	node_t *run = list -> next;

	printf("[begin] -> ");
	while(run != NULL)
	{
		printf("[%d] -> ", run -> data);
		run = run -> next;
	}
	printf("[end]\n");
}

