%{
#include <stdio.h>
int id=0, operator=0, paren=0, flag=0;
%}
%%
[0-9]+ {id++;}
[+*] {operator++;}
[(] {paren++;}
[)] {paren--;}
%%
int main() {
yylex();
if (paren==0)
printf("The number of IDs are %d and the operators are %d", id, operator);
else
printf("invalid operation");
return 0;
}
