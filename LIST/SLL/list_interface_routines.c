#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "sll.h"
#include "list_aux.h"

list_t *create_list() 
{
	return (list_t*) xcalloc(1, sizeof(list_t));
}

result_t insert_begin(list_t *list, data_t data)
{
	node_t *new_node = get_new_node(data);
	node_t *run = list;
	link_nodes(run, new_node);

	return (SUCCESS);
}

result_t insert_end(list_t *list, data_t data)
{
	node_t *new_node = (node_t*) calloc(1, sizeof(node_t));
	new_node -> data = data;

	node_t *run = list;
	while(run -> next != NULL) 
	{
		run = run -> next;
	}


	run -> next = new_node;

	return (SUCCESS);
}

result_t insert_before_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *run = list;
	node_t *target = NULL;

	while(run ->next != NULL) 
	{
		if(run -> next -> data == search_key) 
		{
			target = run;
			break;
		} 

		run = run -> next;
	}

	if(target == NULL) 
	{
		return (ERROR);
	} 
	else 
	{
		node_t *new_node = (node_t*) calloc(1, sizeof(node_t));
		new_node -> data = insert_key;

		new_node -> next = target -> next;
		target -> next = new_node;

		return (SUCCESS);
	}
}

result_t insert_after_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *run = list -> next;
	node_t *target = NULL;

	while(run != NULL) 
	{
		if(run -> data == search_key) {
			target = run;
			break;
		}

		run = run -> next;
	}

	if(target == NULL) 
	{
		return (ERROR);
	}
	else 
	{
		node_t *new_node = (node_t*) calloc(1, sizeof(node_t));
		new_node -> data = insert_key;

		new_node -> next = target -> next;
		target -> next = new_node;

		return (SUCCESS);
	}
}

result_t delete_begin(list_t *list)
{return ERROR;}

result_t delete_data(list_t *list, data_t data)
{return ERROR;}

result_t delete_end(list_t *list)
{return ERROR;}

result_t is_at_begining(list_t *list, data_t data)
{
	node_t *first_node = list -> next;
	return first_node -> data == data ? TRUE : FALSE;
}

result_t is_before(list_t *list, data_t search_key, data_t next_key)
{
	node_t *run = list -> next;

	while(run -> next != NULL) 
	{
		if(run -> data == search_key && run -> next -> data == next_key)
		{
			return (TRUE);
		}

		run = run -> next;
	}

	return (FALSE);
}

result_t find(list_t *list, data_t data)
{return FALSE;}

result_t is_after(list_t *list, data_t search_key, data_t after_data)
{
	node_t *run = list -> next;

	while(run -> next != NULL) 
	{
		if(run -> next -> data == search_key && run -> data == after_data) {
			return (TRUE);
		}

		run = run -> next;
	}

	return (FALSE);
}

result_t is_at_end(list_t *list, data_t data)
{
	node_t *run = list;
	while(run -> next != NULL) 
	{
		run = run -> next;
	}

	return  run -> data == data ? TRUE : FALSE;
}

result_t examine_del_beg(list_t *list, data_t *p_object)
{return ERROR;}

result_t examine_del_end(list_t *list, data_t *p_object)
{return ERROR;}

result_t is_empty(list_t *list)
{return ERROR;}

void print_list(list_t *list)
{
	node_t *run = list -> next;

	while(run != NULL) {
		printf("[%d] ", run -> data);
		run = run -> next;
	}

	printf("\n");
}

result_t sort(list_t *list)
{return ERROR;}

len_t length(list_t *list)
{return ERROR;}
