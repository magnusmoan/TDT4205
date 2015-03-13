#include "bindnames.h"
extern int outputStage; // This variable is located in vslc.c
char* thisClass;

int bind_default ( node_t *root, int stackOffset){
	for(int i = 0; i < root->n_children; i++){
		node_t* curr_node = root->children[i];
		if(curr_node != NULL){
			curr_node->bind_names(curr_node, 0);
		}
	}
	return 0;
}



int bind_constant ( node_t *root, int stackOffset){
	if(outputStage == 6)
		printf( "CONSTANT\n");

	if(root->data_type.base_type == STRING_TYPE){
		root->string_index = strings_add(root->string_const);
	}

	return 0;

}





