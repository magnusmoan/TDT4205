#include "typecheck.h"
#include <assert.h>
extern int outputStage;

static int type_errors = 0;

int has_type_errors(){
	return type_errors;
}

void type_error(node_t* root){
        fprintf(stdout, "Type error at:\n");
        if(root != NULL){
                fprintf(stdout,"%s", root->nodetype.text);
                if(root->nodetype.index == EXPRESSION){
                        fprintf(stdout," (%s)", root->expression_type.text);
                }
                fprintf(stdout,"\n");
        }
        type_errors++;
}

int equal_types(data_type_t a, data_type_t b){

	if(a.base_type == INT_TYPE || a.base_type == FLOAT_TYPE || a.base_type == BOOL_TYPE || a.base_type == STRING_TYPE){
		return a.base_type == b.base_type;
	}
	else if(a.base_type == ARRAY_TYPE){
		int equals = b.base_type == ARRAY_TYPE;
		equals = equals && (a.array_type == b.array_type);
		equals = equals && (a.n_dimensions == b.n_dimensions);
		if(!equals){
			return equals;
		}
		for(int i = 0; i < a.n_dimensions; i++){
			equals = equals && (a.dimensions[i] == b.dimensions[i]);
		}

		return equals;
	}
	else{
		return 0;
	}
}

data_type_t typecheck_default(node_t* root){
	for(int i = 0; i < root->n_children; i++){
		node_t* curr_node = root->children[i];
		if(curr_node != NULL){
			curr_node->data_type = curr_node->typecheck(curr_node);
		}
	}
	return root->data_type;
}

data_type_t typecheck_expression(node_t* root)
{

    //You may need to add code at various places to complete this function
    
	if(outputStage == 10)
		printf( "Type checking expression %s\n", root->expression_type.text);

	if(root->n_children == 0){
            
	}
	else if(root->n_children == 1){
            
            switch(root->expression_type.index){
                case UMINUS_E:
			{
			data_type_t data_type = root->children[0]->typecheck(root->children[0]);
			if( (data_type.base_type == FLOAT_TYPE) || (data_type.base_type == INT_TYPE) ){
				return data_type;
			}
			type_error(root);
			break;
			}

                case NOT_E:
			{
			data_type_t data_type = root->children[0]->typecheck(root->children[0]);
			if(data_type.base_type == BOOL_TYPE){
				return data_type;
			}
			type_error(root);
			break;
			}

                default:
			{
			return root->children[0]->typecheck(root->children[0]);
			break;
			}
            }
        }
        else if(root->n_children > 1){
            
            switch(root->expression_type.index)
            {
                case ADD_E: case SUB_E: case DIV_E: case MUL_E:
			{
			data_type_t first_child_type = root->children[0]->typecheck(root->children[0]);
			data_type_t second_child_type = root->children[1]->typecheck(root->children[1]);
			if(equal_types(first_child_type, second_child_type)){
				if((first_child_type.base_type == FLOAT_TYPE) || (first_child_type.base_type == INT_TYPE)){
					return first_child_type;
				}
			}
			type_error(root);
			break;
			}

                case  LEQUAL_E: case GEQUAL_E: case GREATER_E: case LESS_E:
			{
			data_type_t first_child_type = root->children[0]->typecheck(root->children[0]);
			data_type_t second_child_type = root->children[1]->typecheck(root->children[1]);
			if(equal_types(first_child_type, second_child_type)){
				if((first_child_type.base_type == FLOAT_TYPE) || (first_child_type.base_type == INT_TYPE)){
					data_type_t t;
					t.base_type = BOOL_TYPE;
					return t;
				}
			}
			type_error(root);
			break;
			}

                case AND_E: case OR_E:
			{
			data_type_t first_child_type = root->children[0]->typecheck(root->children[0]);
			data_type_t second_child_type = root->children[1]->typecheck(root->children[1]);
			if(equal_types(first_child_type, second_child_type)){ 
				if(first_child_type.base_type == BOOL_TYPE){
					return first_child_type;
				}
			}
			type_error(root);
			break;
			}

                case EQUAL_E: case NEQUAL_E:
			{
			data_type_t first_child_type = root->children[0]->typecheck(root->children[0]);
			data_type_t second_child_type = root->children[1]->typecheck(root->children[1]);
			if(equal_types(first_child_type, second_child_type)){
				if((first_child_type.base_type == BOOL_TYPE) || (first_child_type.base_type == FLOAT_TYPE) || (first_child_type.base_type == INT_TYPE)){
					data_type_t t;
					t.base_type = BOOL_TYPE;
					return t;
				}
			}
			type_error(root);
			break;
			}

                case FUNC_CALL_E: 
			{
			int n = root->function_entry->nArguments;
			node_t* args = root->children[1];
			if( (n == 0) && (args == NULL) ){
				return root->function_entry->return_type;
			}
			if(args != NULL){
				if(n == args->n_children){
					for(int i = 0; i < n; i++){
						node_t* curr_node = args->children[i];
						if(curr_node != NULL){
							data_type_t type1 = root->function_entry->argument_types[i];
							data_type_t type2 = curr_node->typecheck(curr_node);
							if(!equal_types(type1, type2)){
								type_error(root);
							}
						}
					}
					return root->function_entry->return_type;
				}
			}
			type_error(root);
			break;
			}
                
                case ARRAY_INDEX_E:
			{
			node_t* first_child = root->children[0];
			if(first_child->nodetype.index == VARIABLE){
				data_type_t* t = (data_type_t*)malloc(sizeof(data_type_t));
				memcpy(t, &(first_child->entry->type), sizeof(data_type_t));
				if(t->n_dimensions == 1){
				    data_type_t return_type;
				    return_type.base_type = t->array_type;
				    return return_type;
				}else{
				    t->n_dimensions -= 1;
				    t->dimensions = &(t->dimensions[1]);
				    return *t;
				}
			}
			node_t* second_child = root->children[1];
			data_type_t first_type = first_child->typecheck(first_child);
			data_type_t second_type = second_child->typecheck(second_child);
			if( (first_type.base_type != ARRAY_TYPE) || (second_type.base_type != INT_TYPE) ){
				type_error(root);
			}else{
			    if(first_type.n_dimensions == 1){
				data_type_t return_type;
				return_type.base_type = first_type.array_type;
				return return_type;
			    }else{
				first_type.n_dimensions -= 1;
				first_type.dimensions = &(first_type.dimensions[1]);
				return first_type;
			    }
			}
			break;
			}
                
                default:
		    {	    
		    for(int i = 0; i < root->n_children; i++){
			    node_t* curr_node = root->children[i];
			    if(curr_node != NULL){
				    curr_node->data_type = curr_node->typecheck(curr_node);
			    }
		    }
		    return root->data_type;
                    break;
		    }
            }
        }
        
}

data_type_t typecheck_variable(node_t* root){
	return root->entry->type;
}

data_type_t typecheck_assignment(node_t* root)
{
	if(outputStage == 10){
		printf( "Type checking assignment\n");
	}

	node_t* first_child = root->children[0];
	node_t* second_child = root->children[1];

	assert(!((first_child == NULL) || (second_child == NULL)));

	data_type_t type_first_child = first_child->typecheck(first_child);
	data_type_t type_second_child = second_child->typecheck(second_child);

	if(!equal_types(type_first_child, type_second_child)){
		type_error(root);
	}

	return type_first_child;
}
