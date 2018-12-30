%{
#include <stdio.h>
#define YYSTYPE double
%}
%token NUMBER
%start input
%%
input 	: /* empty input */
	| input lines
	;
lines 	: '\n' /* line ends */ 
	| expression '\n' 	{ printf("%g\n", $1); }
	;
expression : sum 		{$$ = $1;}
  	;
sum 	: sum '+' term		{$$ = $1 + $3;} 
	| sum '-' sum		{$$ = $1 - $3;}
	| term			{$$ = $1;}
	;
term 	: term '*' factor	{$$ = $1 * $3;}
	| term '/' factor	{$$ = $1 / $3;}
	| factor 		{$$ = $1;}
	;
factor 	: NUMBER		{$$ = $1;}
	| '(' expression ')'	{$$ = $2;}
%%
int yyerror(char *msg) {
	fprintf(stderr, "%s\n", msg); 
}
int main() {
        return yyparse();
}
