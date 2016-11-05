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
	test_delete(list);
 	test_examine(list);
	
	exit (EXIT_SUCCESS);
}

list_t* test_create()
{
	list_t *list = create_list();
	assert(list != NULL);
	return list;
}

void _test_insert_at_begin(list_t *list)
{
	result_t insert_result;
	
	insert_result = insert_at_begin(list, 10);
	assert(insert_result == SUCCESS); 
	assert(is_at_begining(list, 10) == TRUE);

	insert_result = insert_at_begin(NULL, 10);
	assert(insert_result == ERROR);
	print_list(list);
}

void _test_insert_at_end(list_t *list)
{
	result_t insert_result;
	
	insert_result = insert_at_end(list, 40);
	assert(insert_result == SUCCESS);
	assert(is_at_end(list, 40) == TRUE);

	insert_result = insert_at_end(NULL, 40);
	assert(insert_result == ERROR);
	print_list(list);
}

void _test_insert_before_data(list_t *list)
{
	result_t insert_result;

	insert_result = insert_before_data(list, 40, 30);
	assert(insert_result == SUCCESS);
	assert(is_before(list, 30, 40) == TRUE);

	insert_result = insert_before_data(NULL, 40, 30);
	assert(insert_result == ERROR);
	print_list(list);
}

void _test_insert_after_data(list_t *list)
{
	result_t insert_result;
	
	insert_result = insert_after_data(list, 10, 20);
	assert(insert_result == SUCCESS);
	assert(is_after(list, 20, 10) == TRUE);

	insert_result = insert_after_data(NULL, 10, 20);
	assert(insert_result == ERROR);
	print_list(list);
}

void test_insert(list_t* list)
{
	_test_insert_at_begin(list);
	_test_insert_at_end(list);
	_test_insert_before_data(list);
	_test_insert_after_data(list);
}

void _test_delete_begin(list_t *list)
{
	result_t del_result;

	del_result = delete_begin(list);
	assert(del_result == SUCCESS);
	assert(is_at_begining(list, 10) == FALSE);

	del_result = delete_begin(NULL);
	assert(del_result == ERROR);

	print_list(list);
}

void _test_delete_data(list_t *list)
{
	result_t del_result;

	del_result = delete_data(list, 20);
	assert(del_result == SUCCESS);
	assert(find(list, 10) == FALSE);

	del_result = delete_data(list, 50);
	assert(del_result == ERROR);
	print_list(list);
}

void _test_delete_end(list_t *list)
{
	result_t del_result;
	
	del_result = delete_end(list);
	assert(del_result == SUCCESS);
	assert(is_at_end(list, 40) == FALSE);

	del_result = delete_end(NULL);
	assert(del_result == ERROR);
	print_list(list);
}

void test_delete(list_t *list)
{
	_test_delete_begin(list);
	_test_delete_data(list);
	_test_delete_end(list);
}

void test_examine(list_t* list)
{
	result_t examine_result;
	data_t data;

	examine_result = examine_del_beg(list, &data);
	assert(examine_result == SUCCESS);
	assert(data == 30);
	assert(is_at_begining(list, 30) == FALSE);
	print_list(list);
}
