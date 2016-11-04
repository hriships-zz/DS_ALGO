#include <stdio.h>
#include <stdlib.h>
#include "list_aux.h"
#include "dll.h"

#define NULL_CHECK(x) x == NULL

list_t *create_list()
{
	return (list_t*) xcalloc(1, sizeof(list_t));	
}

result_t insert_at_begin(list_t *list, data_t data)
{
	node_t *head, *new_node;
	
	if(NULL_CHECK(list))
	{
		return (ERROR);
	}

	head = list;
	new_node = get_node(data);

	link_nodes(head, new_node);

	return (SUCCESS);
}

result_t is_at_begining(list_t *list, data_t data)
{
	node_t *run = list;
	return (run -> next != NULL && run -> next -> data == data) ? (TRUE) : (FALSE);
}

result_t insert_at_end(list_t *list, data_t data)
{
	node_t *last_node, *new_node;

	if(NULL_CHECK(list))
	{
		return (ERROR);
	}

	last_node = get_last_node(list); 
	new_node = get_node(data);
	
	link_nodes(last_node, new_node);

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

result_t insert_before_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *target;

	if(NULL_CHECK(list))
	{
		return (ERROR);
	}

	target = search_node(list, search_key);
	if(target != NULL)
	{
		link_nodes(target -> prev, get_node(insert_key));
		return (SUCCESS);
	} 
	else 
	{
		return (ERROR);
	}
}

result_t is_before(list_t *list, data_t search_key, data_t next_key)
{
	node_t *target;

	target = search_node(list, search_key);
	
	if(target != NULL && target -> next -> data == next_key)
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}

result_t insert_after_data(list_t *list, data_t search_key, data_t insert_key)
{
	node_t *target;
	
	if(NULL_CHECK(list))
	{
		return (ERROR);
	}

	target = search_node(list, search_key);

	if(target != NULL)
	{
		link_nodes(target, get_node(insert_key));
		return (SUCCESS);
	}
	else 
	{
		return (ERROR);
	}
}

result_t is_after(list_t *list, data_t search_key, data_t after_key)
{
	node_t *target;

	target = search_node(list, search_key);

	if(target != NULL && target -> prev -> data == after_key)
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}

result_t is_empty(list_t *list)
{
	if(list == NULL && list -> next == NULL)
		return (TRUE);
	else 
		return (FALSE);
}

void print_list(list_t *list)
{
	#ifdef DEBUG 
	node_t *run = list -> next;
	
	printf("[begin] -> ");
	while(run != NULL)
	{
		printf("[%d] -> ", run -> data);
		run = run -> next;
	}
	printf("[end]\n");
	#endif
}

