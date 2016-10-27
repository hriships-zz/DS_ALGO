#include <stdio.h>
#include <stdlib.h>
#include "list_aux.h"
#include "dll.h"

list_t *create_list()
{
	return (list_t*) xcalloc(1, sizeof(list_t));	
}
