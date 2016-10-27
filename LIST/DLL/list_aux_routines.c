#include <stdio.h>
#include <stdlib.h>
#include "dll.h"

void *xcalloc(int num_of_blocks, int block_size)
{
	void *mem_block;

	mem_block = calloc(num_of_blocks, block_size);
	if(mem_block == NULL) 
	{
		fprintf(stderr, "OUT OF MEMMORY : ERR CODE");
	}

	return mem_block;
}
