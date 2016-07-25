#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include"list.h"

int main(int argv, char *args[]) {
    list_t *list;
    list = create_list();
    assert(list != NULL);

    insert_beginning(list, 10);
    result_t result = search(list, 10);
    display(list);
    assert(result == DATA_FOUND);

    insert_before_data(list, 20, 10);
    display(list);
    result = search(list, 20);
    assert(result == DATA_FOUND);

    insert_after_data(list, 30, 20);
    display(list);
    result = search(list, 30);
    assert(result == DATA_FOUND);

    insert_end(list, 40);
    display(list);
    result = search(list, 40);
    assert(result == DATA_FOUND);
   
    delete_beginning(list);
    display(list);
    result = search(list, 20);
    assert(result == DATA_NOT_FOUND);

    delete_data(list, 10);
    display(list);
    result = search(list, 10);
    assert(result == DATA_NOT_FOUND);

    delete_end(list);
    display(list); 
    result = search(list, 40);
    assert(result == DATA_NOT_FOUND);

    return (EXIT_SUCCESS);
}
