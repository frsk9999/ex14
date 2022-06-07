/* flex */
%{
     #include <string.h>   
     #include "test.tab.h"
     int i=0;
%}
%x DOUBLEQUOTE
%%
keyword1       { yylval.string = strdup(yytext); return KEY1;} /* 設定のキーワード */
keyword2       { yylval.string = strdup(yytext); return KEY2;}
optiona        { yylval.string = strdup(yytext); return OPTIONA; }
optionc        { yylval.string = strdup(yytext); return OPTIONC; }
[ \t\n]+       /* ignore space */
[=]            { return EQ;}
(->)           { return ARROW; }
[,]            { return COM; }
[{]            { return OPV; }
[}]            { return CLV; }
<*>"\""        { /* 開始条件をどこにでもにしないと開けないし閉じれない */
                   if (0==i) {
                     BEGIN(DOUBLEQUOTE); /* ダブルクォートを開いた時の処理 */
                     i++;
                   }else if (1 == i) {
                     BEGIN(INITIAL);     /* ダブルクォートを閉じたときの処理 */
                     i=0;
                   }
                   return DWQ; 
               }
<DOUBLEQUOTE>([^"]|(\\\"))+ {
                   /* ダブルクォート内の文字列はすべて文字列として扱い、 *
                    * ダブルクォートを閉じた後は無効になる               */
                   yylval.string = strdup(yytext);
                   return STRING;
               }
%%
