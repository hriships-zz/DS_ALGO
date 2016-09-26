OS = $(shell uname -s)
CC = gcc
MAKEFLAGS += --silent

ifeq ($(OS), Darwin)
	LIB_NAME = libsll.dylib
	CCFLAGS = -dynamiclib -o $(LIB_NAME) -Wall /usr/lib/libsort.dylib
	CCBFLAGS =  -Wall /usr/lib/$(LIB_NAME)
else
	LIB_NAME = libsll.so 
	CCFLAGS = -fPIC -shared -o $(LIB_NAME)
	CCBFLAGS = -lc -lsll -lsort
endif

LIST_MAKE:
	make -C ../../SORTING/
	$(CC) $(CCFLAGS) list_interface_routines.c list_aux_routines.c
	sudo cp $(LIB_NAME) /usr/lib/
	rm $(LIB_NAME)
	sudo cp list.h /usr/include/
	sudo cp sll.h /usr/include/
	rm -f list
	$(CC) -g -o list client.c $(CCBFLAGS)
	./list
	echo "SLL TESTS: PASSED"
	echo "Singley Linked List (SLL) compiled successfully"

