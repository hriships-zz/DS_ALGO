OS = $(shell uname -s)
CC = gcc
MAKEFLAGS += --silent

ifeq ($(OS), Darwin)
	LIB_NAME = libsort.dylib
	CCFLAGS = -dynamiclib -o $(LIB_NAME)
	CCBFLAGS =  -Wall /usr/lib/libsort.dylib
else
	LIB_NAME = libsort.so 
	CCFLAGS = -shared -o $(LIB_NAME) -fPIC
	CCBFLAGS = -lc -lsort
endif

SORING_MAKE:
	$(CC) $(CCFLAGS) insertion_sort.c heap_sort.c merge_sort.c
	sudo cp $(LIB_NAME) /usr/lib/
	rm $(LIB_NAME)
	sudo cp sorting.h /usr/include/
	$(CC) -o sorting sorting_framework.c $(CCBFLAGS) 
	./sorting 10
	./sorting 1000
	echo "SORTING TESTS: PASSED"
