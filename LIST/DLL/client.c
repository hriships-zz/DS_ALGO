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

int main(int args, char *arg[]) {

	list_t *list = NULL;
	list = test_create();

	exit (EXIT_SUCCESS);
}

list_t* test_create()
{
	list_t *list = create_list();
	assert(list != NULL);
	return list;
}

