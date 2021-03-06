%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
    int yylex(void);
    void yyerror(char *);
    int yylex();
%}


%token IDENTIFIER NUM
%token CHAR INT FLOAT DOUBLE
%token EQ LE GE AND OR XOR ASSIGN
%token IF ELSE SWITCH BREAK WHILE CASE
%token ADD
%token SUB 
%token MUL
%token DIV 
%token SEMICOLON COMMA
%token OP CP OB CB

%start program

%%
program 
	: declarations function {printf("Input accepted\n");exit(0);}
	;
declarations 
	: type variables SEMICOLON
	;
type 
	: INT
	| CHAR
	| FLOAT
	| DOUBLE
	;
variables
	: IDENTIFIER
	| IDENTIFIER COMMA variables
	;
function
	: type IDENTIFIER OP argumentlist CP OB statements CB
	;
argumentlist
	: variables
	;
statements
	: expressions SEMICOLON
	;
expressions
	: IDENTIFIER ASSIGN expressions
	| IDENTIFIER
	| NUM
	;
%%


void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}
int main()
{
	/* extern FILE *yyin;
    yyin=fopen("input.c","r"); */
	yyparse();
	/* fclose(yyin); */
	return 0;
}




