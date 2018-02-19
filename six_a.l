/* Write a LEX program to eliminate comment lines in a C program and copy the
resulting program into a separate file. */

%{
#include <stdio.h>
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/" /* do nothing */
"//".* /* do nothing */
.* { fprintf(yyout, "%s", yytext); } /* print everything else */
%%
int main() {
yyin = fopen("t1.c", "r");
yyout = fopen("t2.c", "w");
yylex();
return 0;
}
