%{
#include<stdio.h>
int i;
%}

%token NAME NUMBER VAR

%left '-''+'
%left '*''/'
%nonassoc UMINUS
%right '^'

%%

statement : 	NAME '=' expression { printf("\nAssigning %s the value of %d",$1,$3);} |
		expression {printf("\n = %d",$1);}
		;
		
expression :	expression '+' expression {$$=$1+$3;printf("\nRecognized '+' operator");} |
		expression '-' expression {$$=$1-$3;printf("\nRecognized '-' operator");} |
		expression '*' expression {$$=$1*$3;printf("\nRecognized '*' operator");} |
		expression '/' expression {if($3==0)
						yyerror("Divide by 0 error");
					   else
						$$=$1/$3;printf("\nRecognized '/' operator");} |
		NUMBER	{ $$=$1; printf("\nRecognized a number");} |
		VAR 	{ $$=$1; printf("\nNumber enterned is %d",$1);}
		;
%%

int main(void)
{
	printf("\nEnter mathematical expression ");
	return yyparse();
}

int yyerror(char *msg)
{
return fprintf(stderr,"\nYACC : %s",msg);
}

yywrap()
{

}
