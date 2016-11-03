#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include "list.h"
#include "dll.h"

list_t* test_create();
void test_insert(list_t*);
void test_delete(list_t*);
void test_examine(list_t*);
void test_sorting(list_t*);
void test_distroy(list_t**);
void test_concat_lists();
void test_merge_lists();
void test_reverse_lists();

int main(int args, char *arg[]) 
{

	list_t *list = NULL;
	list = test_create();

	test_insert(list);
	exit (EXIT_SUCCESS);
}

list_t* test_create()
{
	list_t *list = create_list();
	assert(list != NULL);
	return list;
}


void test_insert(list_t* list)
{
	result_t insert_result;

	insert_result = insert_at_begin(list, 10);
	assert(insert_result == SUCCESS); 
	assert(is_at_begining(list, 10) == TRUE);
	print_list(list);

	insert_result = insert_at_end(list, 40);
	assert(insert_result == SUCCESS);
	assert(is_at_end(list, 40) == TRUE);
	print_list(list);

	insert_result = insert_before_data(list, 40, 30);
	assert(insert_result == SUCCESS);
	assert(is_before(list, 30, 40) == TRUE);
	print_list(list);

	insert_result = insert_after_data(list, 10, 20);
	assert(insert_result == SUCCESS);
	print_list(list);
	assert(is_after(list, 20, 10) == TRUE);
}
