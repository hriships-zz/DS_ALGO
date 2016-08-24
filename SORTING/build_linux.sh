#!/bin/sh
gcc -c -Wall -sahred  insertion_sort.c heap_sort.c merge_sort.c
sudo cp libsort.so /usr/lib/
rm libsort.dylib
sudo cp sorting.h /usr/include/
gcc -Wall sorting_framework.c -o sorting /usr/lib/lsort.so
cp sorting /usr/bin/

