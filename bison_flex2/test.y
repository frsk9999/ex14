/* bison */
%{
#define STRMAX (256)
typedef struct {
    char key[STRMAX];
    char value[STRMAX];
}test_t;
test_t conf[4];

int cnt=0;
int incnt=0;
#include <stdio.h>
#include <string.h>

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
%expect 8
%%
data :
     | line data
     ;
line :  keyvalues EQ values
     ;
keyvalues: STRING { strncpy(conf[cnt].key,$1,STRMAX); }
     ;
values:
      | OPV DWQ STRING DWQ CLV {strncpy(conf[cnt].value,$3,STRMAX); cnt++;}
      | OPV values CLV
      | values COM values
      | lvalues ARROW rvalues 
      | DWQ STRING DWQ values
      { 
          strncpy(conf[cnt-incnt].value,$2,STRMAX); /* 無理やり感のある入れ方 */
          cnt++;
      }
      | STRING values
      ;
lvalues: STRING { 
            if('\0' != conf[cnt].key[0]) {
                cnt++;
                incnt++;
            }
            strncpy(conf[cnt].key,$1,STRMAX);
         }
rvalues: DWQ STRING DWQ {
             strncpy(conf[cnt].value,$2,STRMAX);
             cnt++;
             incnt++;
         }
%%

