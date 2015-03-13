%{
/* This %{ ... %} section is code that is glued into the generated scanner. */
#include "parser.h"

extern int outputStage; // This variable is located in vslc.c
    #define RETURN(t) do {                                             \
        if ( outputStage == 1 )                                        \
            printf( "TOKEN ( %d,\t'%s' )\n", t, yytext );    \
        return t;                                                      \
    } while ( 0 )
    
    
%}

%option array
%option noyywrap
%option yylineno

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9_]*

%%

"//".*\n
FUNC				    { RETURN(FUNC); }
PRINT				    { RETURN(PRINT); }
RETURN				    { RETURN(RETURN); }
NEW				    { RETURN(NEW); }
IF				    { RETURN(IF); }
THEN				    { RETURN(THEN); }
ELSE				    { RETURN(ELSE); }
END				    { RETURN(END); }
WHILE				    { RETURN(WHILE); }
DO				    { RETURN(DO); }
END				    { RETURN(END); }
FOR				    { RETURN(FOR); }
TO				    { RETURN(TO); }
INT				    { RETURN(INT); }
BOOL				    { RETURN(BOOL); }
FLOAT				    { RETURN(FLOAT); }
START				    { RETURN(START); }
VOID				    { RETURN(VOID); }
ARRAY				    { RETURN(ARRAY); }
"+"				    { RETURN('+'); }
"-"				    { RETURN('-'); }
"*"				    { RETURN('*'); }
"/"				    { RETURN('/'); }
":="				    { RETURN(ASSIGN); }
">"				    { RETURN('>'); }
"<"				    { RETURN('<'); }
">="				    { RETURN(GEQUAL); }
"<="				    { RETURN(LEQUAL); }
"=="				    { RETURN(EQUAL); }
"!="				    { RETURN(NEQUAL); }
"&&"				    { RETURN(AND); }
"||"				    { RETURN(OR); }
"!"				    { RETURN('!'); }
"."				    { RETURN('.'); }
{DIGIT}+			    { RETURN(INT_CONST); }
{DIGIT}*"."{DIGIT}+		    { RETURN(FLOAT_CONST); }
TRUE				    { RETURN(TRUE_CONST); }
FALSE				    { RETURN(FALSE_CONST); }
\"([^\n\"]|\\\")*\"		    { RETURN(STRING_CONST); }
{ID}				    { RETURN(IDENTIFIER); }
")"				    { RETURN(')'); }
"("				    { RETURN('('); }
","				    { RETURN(','); }
";"				    { RETURN(';'); }
"["				    { RETURN('['); }
"]"				    { RETURN(']'); }
[ \t\n]+

%%
