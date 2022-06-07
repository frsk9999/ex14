/* bison */
%{
#include <stdio.h>
#include <string.h>
#define STRMAX (256)
typedef struct {
    char key[STRMAX];
    char value[STRMAX];
}test_t;
test_t conf[3];
int cnt=0;
int yylex();
#define yyerror(...) { \
    printf(__VA_ARGS__); \
}
%}
%union yylval{
    char *string;
}
%token <string> EQ
%token <string> ARROW
%token <string> COM
%token <string> OPV
%token <string> CLV
%token <string> DWQ
%token <string> STRING
%token <string> SPACE
%expect 5
%%
data :
     | data line
     ;
line :  keyvalues EQ values
     ;
keyvalues: STRING { strncpy(conf[cnt].key,$1,STRMAX); }
     ;
values: 
      | OPV DWQ STRING DWQ CLV { strncpy(conf[cnt].value,$3,STRMAX); cnt++;}
      | OPV values CLV
      | values COM values
      | lvalues ARROW rvalues
      | STRING values
      ;
lvalues: STRING { strncpy(conf[cnt].key,$1,STRMAX);}
rvalues: DWQ STRING DWQ { strncpy(conf[cnt].value,$2,STRMAX);cnt++;}
%%
