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
    printf("Result :: %d\n", result);
    assert(result == DATA_FOUND);

    insert_before_data(list, 20, 10);
	display(list);
	result = search(list, 20);
	assert(result == DATA_FOUND);

    /*insert_before_data(list, 20, 30);
    insert_end(list, 40);
	
    
    data_t data = 20;
    result_t result = examine_data(list, data);
    if(result == DATA_FOUND) {
        printf("data found : [%d]", data);
    } else {
        printf("data not found [%d]", data);
    }*/
    
    return (EXIT_SUCCESS);
}
