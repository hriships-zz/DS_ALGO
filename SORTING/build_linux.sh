#!/bin/sh
gcc -shared -o libsort.so -fPIC insertion_sort.c heap_sort.c merge_sort.c
sudo cp libsort.so /usr/lib/
rm libsort.so
sudo cp sorting.h /usr/include/
gcc  -o sorting sorting_framework.c -lc -lsort
sudo cp sorting /usr/bin/

