#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "dll.h"

list_t *create_list()
{
	void *mem_block;

	mem_block = calloc(1, sizeof(list_t));
	if(mem_block == NULL) 
	{
		fprintf(stderr, "OUT OF MEMMORY : ERR CODE");
	} 
	else 
	{
		return (list_t*) mem_block;	
	}
}
