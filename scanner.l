%{
#define YYSTYPE double
#include "y.tab.h"
#include <stdlib.h>
extern YYSTYPE yylval;
%}
NUM    [0-9]+
EXP    [Ee][-+]?{NUM}
%%
{NUM}("."{NUM})?({EXP})?	{ yylval = atof(yytext);
  				return NUMBER; }
[ \t]				;
.				|
\n 				return yytext[0];
