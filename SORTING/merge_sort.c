#include "sorting.h"

void devide_merge(int array[], int start, int end);
void merge(int[], int start, int mid, int end);

void merge_sort(int array[], int size) {
    devide(array, 0, size -1);
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

void merge(int array[], int start, int mid, int end) {
	int i;
	int n1 = (mid - start) + 1;
	int n2 = end - mid;

	int *left = (int*) calloc(n1, sizeof(int));
	int *right = (int*) calloc(n2, sizeof(int));

	for(i =0; i < n1; i++) {
		left[i] = array[start + i];
	}

	for(i =0; i < n2; i++) {
		right[i] = array[mid + 1 + i];
	}

	int left_ind = 0, right_ind = 0; 
	for(i = start; i < end; i++) {
		if(left_index < n1 && (right_ind >= n2 || left[left_ind] < right[right_ind]) {
			array[i] = left[left_ind];
			left_ind ++;
		} else {
			array[i] = right[right_ind];
			right_ind ++;
		}
	}
}
