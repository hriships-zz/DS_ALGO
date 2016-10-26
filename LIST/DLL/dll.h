#ifndef DLL_H
#define DLL_H

#include "list.h"

struct _node {
	data_t data;
	struct _node *prev, *next;
};

#endif /* SCLL_H */ 
