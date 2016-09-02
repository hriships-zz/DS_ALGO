#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include "list.h"
#include "sll.h"

void test_create(list_t **list);
void test_insert(list_t*);
void test_delete(list_t*);
void test_examine(list_t*);
void test_sorting(list_t*);
void test_distroy(list_t*);
void test_concat();

int main() {

	list_t *list = NULL;
	test_create(&list);
	test_insert(list);
	test_delete(list);
	test_examine(list);
	test_distroy(&list);
	test_create(&list);	
	test_sorting(list);
    test_concat();
	exit (EXIT_SUCCESS);
}

void test_create(list_t **list)
{
	*list = create_list();
	assert(*list != NULL);
}

void test_insert(list_t *list) 
{
	result_t insert_result;

	insert_result = insert_at_begin(list, 10);
	assert(insert_result == SUCCESS && is_at_begining(list, 10) == TRUE);

	insert_result = insert_at_end(list, 40);
	assert(insert_result == SUCCESS && is_at_end(list, 40) == TRUE);

	insert_result = insert_before_data(list, 40, 30);
	assert(insert_result == SUCCESS && is_before(list, 30, 40) == TRUE);

	insert_result = insert_before_data(list, 10, 5);
	assert(insert_result == SUCCESS && is_before(list, 5, 10) == TRUE);

	insert_result = insert_before_data(list, 100, 50);
	assert(insert_result == ERROR && is_before(list, 50, 100) == FALSE);

	insert_result = insert_after_data(list, 40, 50);
	assert(insert_result == SUCCESS && is_after(list, 50, 40) == TRUE);

	insert_result = insert_after_data(list, 5, 8);
	assert(insert_result == SUCCESS && is_after(list, 8, 5) == TRUE);

	insert_result = insert_after_data(list, 35, 45);
	assert(insert_result == ERROR && is_after(list, 45, 35) == FALSE);
}

void test_delete(list_t *list)
{
	result_t delete_result;

	delete_result = delete_begin(list);
	assert(delete_result == SUCCESS && is_at_begining(list, 5) == FALSE);

	delete_result = delete_data(list, 50);
	assert(delete_result == SUCCESS && find(list, 50) == FALSE);

	delete_result = delete_data(list, 8);
	assert(delete_result == SUCCESS && find(list, 8) == FALSE);

	delete_result = delete_data(list, 80);
	assert(delete_result == ERROR);
	
	delete_result = delete_end(list);
	assert(delete_result == SUCCESS && is_at_end(list, 40) == FALSE);
}

void test_examine(list_t *list)
{
	result_t examine_result;
	data_t examine_data;

	examine_result = examine_del_beg(list, &examine_data);
	assert(examine_result == SUCCESS && examine_data == 10);

	examine_result = examine_del_end(list, &examine_data);
	assert(examine_result == SUCCESS && examine_data == 30);
}

void test_distroy(list_t** list)
{
	distroy(*list);
	assert(length(*list) == 0 && *list == NULL);
}

void test_sorting(list_t *list)
{
	int i, num_of_elements;
 	srand(time(NULL));
 	num_of_elements = rand() % 16;

 	for(i=0; i < num_of_elements; i++) {
        insert_at_end(list, rand() % 10);    
    }

    result_t sort_result = sort(list);
    assert(sort_result == SUCCESS);
}

void test_concat()
{
}
