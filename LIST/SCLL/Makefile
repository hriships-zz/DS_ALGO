OS = $(shell uname -s)
CC = gcc
MAKEFLAGS += --silent

ifeq ($(OS), Darwin)
	LIB_NAME = libscll.dylib
	CCFLAGS = -g -dynamiclib -o $(LIB_NAME) -Wall /usr/lib/libsort.dylib
	CCBFLAGS =  -g -Wall /usr/lib/$(LIB_NAME)
else
	LIB_NAME = libscll.so 
	CCFLAGS = -fPIC -shared -o $(LIB_NAME)
	CCBFLAGS = -lc -lscll -lsort
endif

LIST_MAKE:
	make -C ../../SORTING/
	$(CC) $(CCFLAGS) list_interface_routines.c list_aux_routines.c
	sudo cp $(LIB_NAME) /usr/lib/
	rm $(LIB_NAME)
	sudo cp list.h /usr/include/
	sudo cp scll.h /usr/include/
	rm -f list
	$(CC) -o list client.c $(CCBFLAGS)
	./list
	echo "SCLL TESTS: PASSED"
	echo "Singley Circular Linked List (SCLL) compiled successfully"
