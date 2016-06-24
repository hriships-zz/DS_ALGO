#include<stdio.h>
#include<stdlib.h>
#include "sorting.h"

#define VALID_ARGUMENTS 2

/*aux functions*/
void* xcalloc(int, int);

/*framework functions*/
void input(int [], int);
void test_sorting(int[], int);
void output(int [], int);

int main(int argv, char *args[]) {

    if(argv != VALID_ARGUMENTS) {
        fprintf(stderr, "Invalid arguments: %s \n", args[1]);
        exit(EXIT_FAILURE);
    }

    int num_of_elements = atoi(args[1]);
    int* arr;
    arr = xcalloc(num_of_elements, sizeof(int));
    srand(time());

    input(arr, num_of_elements);

    insertion_sort(arr, num_of_elements);
    test_sorting(arr, num_of_elements);
    output(arr, num_of_elements);

    free(arr);

    exit(EXIT_SUCCESS);
}

void input(int arr[], int num_of_elements) {
    int i;
    for(i=0; i < num_of_elements; i++) {
        arr[i] = rand();    
    }
}

void output(int arr[], int num_of_elements) {
    int i;
    for(i=0; i < num_of_elements; i++) {
        printf("arr[%d] = %d \n", i, arr[i]);
    }
}

void* xcalloc(int instances, int size) {
    void* m_blocks;
    m_blocks = calloc(instances, size);
    
    if(m_blocks == NULL) {
        fprintf(stderr, "Out of memory \n");
        exit(EXIT_FAILURE);
    }
}

void test_sorting(int arr[], int size) {
    int i;
    for(i=1; i < size; i++) {
        if(arr[i-1] > arr[i]) {
            fprintf(stderr, "Sorting algorithm has failed ;), wrong key %d at %d position", arr[i], i);
            exit(EXIT_FAILURE);
        }
    }
}

