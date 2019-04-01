%{
#include "y.tab.h"
extern int yylval;
%}

id [A-Z][A-Z0-9]*

%%

[0-9]+ { yylval=atoi(yytext);
	printf("\nScanned the number %d",yylval);
	return NUMBER;}

{id}	{return NAME;}

[\t]	{printf("\nSkipped Whitespace");}

\n	{printf("\nEnd of line");
	return 0;}
	
[a-z]+	{printf("Enter the value for %s ",yytext);
	scanf("%d",&yylval);
	return VAR;}
	
.	{printf("\nFound Other data %s",yytext);
	return yytext[0];}
	
%%
