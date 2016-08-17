#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "sll.h"
#include "list_aux.h"

list_t *create_list() 
{
	return (list_t*) xcalloc(1, sizeof(list_t));
}

result_t insert_at_begin(list_t *list, data_t data)
{
	node_t *new_node = get_new_node(data);
	node_t *run = list;
	link_nodes(run, new_node);

	return (SUCCESS);
}

result_t insert_at_end(list_t *list, data_t data)
{
	node_t *new_node = get_new_node(data);
	node_t *last_node = get_last_node(list);
	link_nodes(last_node, new_node);

	return (SUCCESS);
}

result_t insert_before_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *target = serch_back_node(list, search_key);

	if(target == NULL) 
	{
		return (ERROR);
	} 
	else 
	{
		node_t *new_node = get_new_node(insert_key);
		link_nodes(target, new_node);
		return (SUCCESS);
	}
}

result_t insert_after_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *target = serch_node(list, search_key);

	if(target == NULL) 
	{
		return (ERROR);
	}
	else 
	{
		node_t *new_node = get_new_node(insert_key);
		link_nodes(target, new_node);
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
	node_t *target = serch_node(list, search_key);

	if(target != NULL && (target -> next == NULL || target -> next -> data == next_key)) 
	{
		return (TRUE);
	}
	else 
	{
		return (FALSE);		
	}
}

result_t find(list_t *list, data_t data)
{return FALSE;}

result_t is_after(list_t *list, data_t search_key, data_t after_data)
{
	node_t *target = serch_node(list, after_data);

	if(target != NULL && (target -> next != NULL || target -> next -> data == search_key))
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}

result_t is_at_end(list_t *list, data_t data)
{
	node_t *target = get_last_node(list);
	return  target -> data == data ? TRUE : FALSE;
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
