#include "simplifynodes.h"

extern int outputStage; // This variable is located in vslc.c


//Helper used to simplify the children of a node
void simplify_children( Node_t *root, int depth){
	for(int i = 0; i < root->n_children; i++){
		Node_t* curr_node = root->children[i];
		if(curr_node != NULL){
			root->children[i] = curr_node->simplify(curr_node, depth+1);
		}
	}
}


Node_t* simplify_default ( Node_t *root, int depth ){
    simplify_children(root, depth);
    return root;
}


Node_t *simplify_types ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );

	simplify_children(root, depth);

	if(root->data_type.base_type == ARRAY_TYPE && root->n_children == 2){
		
	    Node_t* type_node = root->children[0];
	    Node_t* index_list_node = root->children[1];

	    root->data_type.array_type = type_node->data_type.base_type;

	    root->data_type.n_dimensions = index_list_node->n_children;
	    root->data_type.dimensions = malloc(sizeof(int)*root->data_type.n_dimensions);

	    for(int i = 0; i < index_list_node->n_children; i++){
		    root->data_type.dimensions[i] = index_list_node->children[i]->int_const;
		    free(index_list_node->children[i]);
	    }
	    
	    free(index_list_node);
	    free(type_node);
	    free(root->children);
	    root->n_children = 0;
	}
	
	return root;
}


Node_t *simplify_function ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );

	Node_t** new_children = malloc(sizeof(node_t)*2);
	int counter = 0;


	for(int i = 0; i < root->n_children; i++){
		Node_t* curr_node = root->children[i];
		if(curr_node != NULL){
			curr_node = curr_node->simplify(curr_node, depth+1);
			if(curr_node->nodetype.index == TYPE){
				root->data_type = curr_node->data_type;
				free(curr_node);
			}
			else if(curr_node->nodetype.index == VARIABLE){
				root->label = STRDUP(curr_node->label);
				free(curr_node);
			}
			else{
				new_children[counter] = curr_node;
				counter++;
			}
		}else{
			new_children[counter] = curr_node;
			counter++;
		}
	}

	free(root->children);
	root->children = new_children;
	root->n_children = 2;
	
	return root;
}

Node_t *simplify_declaration_statement ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );


	simplify_children(root, depth);

	if(root->n_children == 2){	
		Node_t* type_node = root->children[0];
		Node_t* var_node = root->children[1];

		root->data_type = type_node->data_type;
		root->label = var_node->label;
		root->n_children = 0;

		free(type_node);
		free(var_node);
		free(root->children);
	}
	return root;
}


Node_t *simplify_single_child ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );
	

	simplify_children(root, depth);

	if(root->n_children == 1){
	    Node_t* single_child = root->children[0];
	    free(root->children);
	    free(root);
	    return single_child;
	}
	
	return root;
}

Node_t *simplify_list_with_null ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );


	
	if(root->children[0] == NULL){
		Node_t** new_children = malloc(sizeof(node_t*));
		Node_t* other_child = root->children[1];

		other_child = other_child->simplify(other_child, depth+1);
		new_children[0] = other_child;

		free(root->children);
		root->children = new_children;
		root->n_children = 1;
		return root;
	}else{
		simplify_children(root, depth);

		Node_t* first_child = root->children[0];
		
		// +1 to make sure there is room for the second child of the root
		int new_n_children = first_child->n_children + 1;
		Node_t** new_children = malloc(sizeof(node_t*)*new_n_children);
		
		for(int i = 0; i<first_child->n_children; i++){
			new_children[i] = first_child->children[i];
		}

		new_children[new_n_children-1] = root->children[1];

		free(first_child);
		free(root->children);
		root->children = new_children;
		root->n_children = new_n_children;

		return root;
	}
	return root;
}


Node_t *simplify_list ( Node_t *root, int depth ){   
	if(outputStage == 4)
		printf( "%*cSimplify %s \n", depth, ' ', root->nodetype.text );
	
	simplify_children(root, depth);

	if(root->n_children == 1){
		return root;
	}

	Node_t* first_child = root->children[0];
	
	// +1 one to make sure there is room for the second child of the root.
	int new_n_children = first_child->n_children + 1;
	Node_t** new_children = malloc(sizeof(node_t*)*new_n_children);

	for(int i = 0; i<first_child->n_children; i++){
		new_children[i] = first_child->children[i];
	}

	new_children[new_n_children-1] = root->children[1];

	free(first_child);
	free(root->children);
	root->n_children = new_n_children;
	root->children = new_children;
	
	return root;	
}


Node_t *simplify_expression ( Node_t *root, int depth ){
	if(outputStage == 4)
		printf( "%*cSimplify %s (%s) \n", depth, ' ', root->nodetype.text, root->expression_type.text );

	simplify_children(root, depth);

	if(root->n_children == 1){
		et_number expr_type = root->expression_type.index;
		if((expr_type != NEW_E) && (expr_type != NOT_E) && (expr_type != UMINUS_E)){
			Node_t* first_Child = root->children[0];
			free(root->children);
			free(root);
			return first_Child;
		}else{
			return root;
		}
	}
	return root;
}

