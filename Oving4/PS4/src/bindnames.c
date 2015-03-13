#include "bindnames.h"
extern int outputStage; // This variable is located in vslc.c
char* thisClass;

int bind_default( node_t *root, int stackOffset){
    for(int i = 0; i < root->n_children; i++){
        node_t* curr_node = root->children[i];
        if(curr_node != NULL){
            stackOffset = curr_node->bind_names(curr_node, stackOffset);
        }
    }
    return stackOffset;
}


int bc( node_t *root, int stackOffset){
    if(outputStage == 6)
        printf( "CONSTANT\n");
    
    if(root->data_type.base_type == STRING_TYPE){
        root->string_index = strings_add(root->string_const);
    }
    
    return stackOffset;
    
}


int bind_function ( node_t *root, int stackOffset){
	
	//Add scope for this function
	scope_add();

	if(outputStage == 6)
		printf( "FUNCTION: Start: %s\n", root->label);
	
	for(int i = 0; i < root->n_children; i++){
		node_t *curr_node = root->children[i];
		if(curr_node != NULL){
			
			//Check if we are going through a parameter list or statement list and setting the stackOffset accordingly
			//if(curr_node->nodetype.index == PARAMETER_LIST){
			if(i == 0){
				stackOffset = 8 + (curr_node->n_children - 1)*4;
			}else if(i == 1){
				stackOffset = -4;
			}

			for(int j = 0; j < curr_node->n_children; j++){
				node_t *child_curr_node = curr_node->children[j];
				if(child_curr_node != NULL){
					stackOffset = child_curr_node->bind_names(child_curr_node, stackOffset);
				}	
			}
		}
	}
	
	if(outputStage == 6)
		printf( "FUNCTION: End\n");
		
	scope_remove();

	return stackOffset;
}


function_symbol_t* create_function_symbol(node_t* function_node){
	function_symbol_t *function_symbol = malloc(sizeof(function_symbol_t));
	function_symbol->label = function_node->label;
	function_symbol->return_type = function_node->data_type;
   
	// If the function has zero parameters we set the number of arguments equal to zero and the argument type list equal to NULL
	if(function_node->children[0] != NULL){
		function_symbol->nArguments = function_node->children[0]->n_children;
		function_symbol->argument_types = (data_type_t*)malloc(sizeof(data_type_t)*function_symbol->nArguments);
		for(int i = 0; i < function_symbol->nArguments; i++){	
			function_symbol->argument_types[i] = function_node->children[0]->children[i]->data_type;
		}
	}else{
		function_symbol->nArguments = 0;
		function_symbol->argument_types = NULL;
	}

   return function_symbol;
}


int bind_function_list (node_t *root, int stackOffset){

	// Add a scope for function list
	scope_add();

	if(outputStage == 6)
		printf( "FUNCTION_LIST: Start\n");
	
	
	// Add all functions to the function table
	for(int i = 0; i < root->n_children; i++){
		node_t* curr_node = root->children[i];
		if(curr_node != NULL){
			function_add(curr_node->label, create_function_symbol(curr_node));
		}
	}
	
	// Traverse all the functions in the function list
	for(int j = 0; j < root->n_children; j++){
		node_t* curr_node = root->children[j];
		if(curr_node != NULL){
			curr_node->bind_names(curr_node, stackOffset);
		}
	}

	if(outputStage == 6)
		printf( "FUNCTION_LIST: End\n");
	
	// Remove scope for function list
	scope_remove();

	return stackOffset;
}

int bind_constant ( node_t *root, int stackOffset)
{
    return bc(root, stackOffset);
}


symbol_t* create_symbol(node_t* declaration_node, int stackOffset){
	symbol_t* symbol = malloc(sizeof(symbol_t));
	symbol->stack_offset = stackOffset;
	symbol->label = declaration_node->label;
	symbol->type = declaration_node->data_type;
	return symbol;
}

int bind_declaration ( node_t *root, int stackOffset){
	if(outputStage == 6)
		printf( "DECLARATION: parameter/variable : '%s', offset: %d\n", root->label, stackOffset);
	symbol_insert(root->label, create_symbol(root, stackOffset));
	stackOffset = stackOffset - 4;
	return stackOffset;
}

int bind_variable ( node_t *root, int stackOffset){
	if(outputStage == 6)
		printf( "VARIABLE: access: %s\n", root->label);

	root->entry = symbol_get(root->label);
	return stackOffset;
}

int bind_expression( node_t* root, int stackOffset){
	if(outputStage == 6)
		printf( "EXPRESSION: Start: %s\n", root->expression_type.text);
		
	if(root->expression_type.index == FUNC_CALL_E){
		root->function_entry = function_get(root->children[0]->label);
		if(root->children[1] != NULL){
		    stackOffset = root->children[1]->bind_names(root->children[1], stackOffset);
		}    
	}else{
		for(int i = 0; i < root->n_children; i++){
			node_t* curr_node = root->children[i];
			if(curr_node != NULL){
				stackOffset = curr_node->bind_names(curr_node, stackOffset);
			}
		}
	}

	//bind_names_children(root, stackOffset);
	if(outputStage == 6)
		printf( "EXPRESSION: End\n");
	
	return stackOffset;
}


