/* flex */
%{
     #include <string.h>   
     #include "test.tab.h"
%}
chars       [a-zA-Z_0-9 !]
%%
"->"        { yylval.string = strdup(yytext); return ARROW; }
"="         { yylval.string = strdup(yytext); return EQ;}
{chars}+    { yylval.string = strdup(yytext); return STRING;}
","         { yylval.string = strdup(yytext); return COM; }
"{"         { yylval.string = strdup(yytext); return OPV; }
"}"         { yylval.string = strdup(yytext); return CLV; }
["]         { yylval.string = strdup(yytext); return DWQ; }
[ \t\n]+    ;
.           ;
%%
//space+      { yylval.string = strdup(yytext); return SPACE;}
