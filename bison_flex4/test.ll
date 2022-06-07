/* reflex C++ */
%{
#include "test_driver.hpp"
#include "test.tab.hpp"
int i=0;
%}
%option noyywrap nounput noinput batch nodebug
%x DOUBLEQUOTE
%{
#undef YY_USER_ACTION
#define YY_USER_ACTION loc.columns(yyleng);
%}
%%
%{
    yy::location& loc = driver.loca;
    loc.step();
%}
keyword1       { return yy::parser::make_KEY1(yytext,loc);}
keyword2       { return yy::parser::make_KEY2(yytext,loc);}
optiona        { return yy::parser::make_OPTIONA(yytext,loc);}
optionc        { return yy::parser::make_OPTIONC(yytext,loc);}
[ \t\n]+       ; // ignore space 
"="            { return yy::parser::make_EQ(yytext,loc);}
"->"           { return yy::parser::make_ARROW(yytext,loc); }
","            { return yy::parser::make_COM(yytext,loc); }
"{"            { return yy::parser::make_OPV(yytext,loc); }
"}"            { return yy::parser::make_CLV(yytext,loc); }
<*>"\""        {
                   if (0==i) {
                     BEGIN(DOUBLEQUOTE);
                     i++;
                   } else if (1 == i) {
                     BEGIN(INITIAL);
                     i=0;
                   }
                   return yy::parser::make_DWQ(yytext,loc); 
               }
<DOUBLEQUOTE>([^"]|(\\\"))+ {
                   return yy::parser::make_STRING(yytext,loc);
               }
<<EOF>>        return yy::parser::make_YYEOF(loc);
%%
