#include <stdio.h>
#include <stdlib.h>
#include <sorting.h>
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
{
	if(is_empty(list) == TRUE)
	{
		return (ERROR);
	}

	unlink_nodes(list, list -> next);

	return (SUCCESS);
}

result_t delete_data(list_t *list, data_t data)
{
	if(is_empty(list) == TRUE)
	{
		return (ERROR);
	}

	node_t *target = serch_back_node(list, data);
	if(target == NULL)
	{
		return (ERROR);	
	}
	else
	{
		node_t *temp = target -> next;
		unlink_nodes(target, temp);
		return (SUCCESS);
	}
}

result_t delete_end(list_t *list)
{
	if(is_empty(list) == TRUE)
	{
		return (ERROR);
	}

	node_t *target_back = get_second_last_node(list);
	node_t *temp = target_back -> next;
	unlink_nodes(target_back, temp);
	return (SUCCESS);	
}

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
{
	node_t *run = list -> next;

	while(run != NULL)
	{
		if(run -> data == data)
		{
			return (TRUE);
		}

		run = run -> next;
	}

	return (FALSE);
}

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
{
	if(is_empty(list) == TRUE)
	{
		return (ERROR);	
	}
	else
	{
		*p_object = list -> next -> data;
		unlink_nodes(list, list -> next);
		return (SUCCESS);
	}
}

result_t examine_del_end(list_t *list, data_t *p_object)
{
	if(is_empty(list) == TRUE)
	{
		return (ERROR);
	}
	else 
	{
		node_t *target_back = get_second_last_node(list);
		node_t *temp = target_back -> next;
		*p_object = temp -> data;
		unlink_nodes(target_back, temp);
		return (SUCCESS);
	}
}

result_t is_empty(list_t *list)
{
	if(list == NULL || list -> next == NULL)
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

	while(run != NULL) {
		printf("[%d] ", run -> data);
		run = run -> next;
	}

	printf("\n");
}

result_t sort(list_t *list)
{
	len_t size = length(list);
	if(size == 0) {
		return (ERROR);	
	}

	data_t *array_data = (data_t*) xcalloc(size, sizeof(data_t));
	list_to_array(list, size, array_data);
	
	if(size < INSERTION_SHORT_SIZE)
	{
		insertion_sort(array_data, size);
	}
	else
	{
		merge_sort(array_data, size);
	}
	
	array_to_list(array_data, size, list);

	return (SUCCESS);
}

len_t length(list_t *list)
{
	int len = 0;
	if(is_empty(list) == TRUE)
	{
		return len;
	} 

	node_t *run = list -> next;

	while(run != NULL)
	{
		run = run -> next;
		len ++;
	}

	return (len);
}

result_t distroy(list_t **pp_list)
{
	node_t *run = *pp_list, *n_run;

	while(run != NULL)
	{
		n_run = run -> next;
		free(run);
		run = n_run;
	}

	*pp_list = NULL;

	return (SUCCESS);
}

list_t *concat(list_t *lst1, list_t *lst2)
{
	node_t *end_node = get_last_node(lst1);
	node_t *first_node = lst2 -> next;
	end_node -> next = first_node;

	return (lst1);
}

list_t *merge(list_t *lst1, list_t *lst2)
{
	list_t *list = concat(lst1, lst2);
	sort(list);

	return (list);
}
