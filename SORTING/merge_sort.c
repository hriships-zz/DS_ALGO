#include "sorting.h"

void devide_merge(int array[], int start, int end);
void merge(int[], int start, int mid, int end);

void merge_sort(int array[], int size) {
    devide(array, 0, size);
}

void devide_merge(int array[], int start, int end) {
    int mid;
    if(start < end) {
        mid = (start + end) / 2;
        devide_merge(array, start, mid);
        devide_merge(array, mid+1, end);
        merge(array, start, mid, end);
    }
}
