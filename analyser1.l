%{
#include <stdio.h>
%}
%%
if|else|while|int|switch|for|char|float|double|long   {printf("\n%s is a Keyword", yytext);}
([a-z]|[A-Z]|_)([a-z]|[A-Z]|[0-9]|_)*  {printf ("\n%s is an Identifier", yytext); }
[0-9]*  {printf ("\n%s is a Number", yytext); }
"+"|"*"|"/"|"-"|"="|"%"   {printf("\n%s is an Operator", yytext); }
.*   {printf("\n%s is not valid", yytext); }
%%

main()
{
yylex();
return 0;
}

