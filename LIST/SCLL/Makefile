OS = $(shell uname -s)
CC = gcc

ifeq ($(OS), Darwin)
	LIB_NAME = libsll.dylib
	CCFLAGS = -g -dynamiclib -o $(LIB_NAME) -Wall /usr/lib/libsort.dylib
	CCBFLAGS =  -g -Wall /usr/lib/$(LIB_NAME)
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
	@sudo cp {list.h,scll.h} /usr/include/
	@rm -f list
	@$(CC) $(CCBFLAGS) -o list client.c
	@./list
	@echo "SCLL TEST : PASSED"
