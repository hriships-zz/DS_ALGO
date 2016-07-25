#include<stdio.h>
#include<stdlib.h>

void *xcalloc(int number_of_blocks, int block_size) {
    void *memory_blocks = NULL;
    memory_blocks = calloc(number_of_blocks, block_size);
    if(memory_blocks == NULL) {
        fprintf(stderr, "error::out of memory\n");
    }

    return memory_blocks;
}
