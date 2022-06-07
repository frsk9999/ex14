/* bison */
%{
#include <stdio.h>
#include <string.h>
#include "test.h"
int yylex();

#define yyerror(...) { \
    printf(__VA_ARGS__); \
}

%}
%union yylval{
    char *string;
}
%token KEY1 
%token KEY2 
%token OPTIONA 
%token OPTIONC
%token EQ
%token ARROW
%token COM
%token OPV
%token CLV
%token DWQ
%token <string> STRING
%%
data :
     | line data
     ;
line : KEY1 EQ string
     | KEY2 EQ values
     ;
string : OPV DWQ STRING DWQ CLV
       { strncpy(conf.keyword1,$3,STRMAX);}
       ;
values : OPV DWQ STRING DWQ COM OPV OPTIONA ARROW DWQ STRING DWQ COM OPTIONC ARROW DWQ STRING DWQ CLV CLV
       { 
           strncpy(conf.keyword2.value,$3,STRMAX);
           strncpy(conf.keyword2.a,$10,STRMAX);
           strncpy(conf.keyword2.c,$16,STRMAX);
       }
       ;
%%

