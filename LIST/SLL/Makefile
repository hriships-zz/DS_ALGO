OS = $(shell uname -s)
CC = gcc

ifeq ($(OS), Darwin)
	LIB_NAME = libsll.dylib
	CCFLAGS = -dynamiclib -o $(LIB_NAME) -Wall /usr/lib/libsort.dylib
	CCBFLAGS =  -Wall /usr/lib/$(LIB_NAME)
else
	LIB_NAME = libsll.so 
	CCFLAGS = -shared -o $(LIB_NAME) -lc lsort -fPIC -lc lsort
	CCBFLAGS = -lc -lsll
endif

LIST_MAKE:
	@make -C ../../SORTING/
	@$(CC) $(CCFLAGS) list_interface_routines.c list_aux_routines.c
	@sudo cp $(LIB_NAME) /usr/lib/
	@rm $(LIB_NAME)
	@sudo cp {list.h,sll.h} /usr/include/
	@rm -f list
	@$(CC) $(CCBFLAGS) -o list client.c
	@./list
	@echo "SLL TESTS: PASSED"
	@sudo cp list /usr/bin/
	@echo "Singley Linked List (SLL) compiled successfully, build with <3 core programming academy"
	@echo "https://www.facebook.com/coreprogrammingacademy/"

