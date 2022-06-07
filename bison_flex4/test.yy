/* bison C++ */
%skeleton "lalr1.cc"
%language "C++"
%defines "test.tab.hpp"
%output "test.tab.cpp"
%header
%define api.token.raw
%define api.token.constructor
%define api.value.type variant
%code requires {
#include <string>
#include <iostream>
#include "test.hpp"
#include "test.tab.hpp"
class test_driver;
}
%param { test_driver& driver }
%locations
%define parse.trace
%define parse.error detailed
%define parse.lac full
%code {
#include "test_driver.hpp"
}
%define api.token.prefix {TOK_}
%token <std::string> KEY1 
%token <std::string> KEY2 
%token <std::string> OPTIONA 
%token <std::string> OPTIONC
%token <std::string> EQ
%token <std::string> ARROW
%token <std::string> COM
%token <std::string> OPV
%token <std::string> CLV
%token <std::string> DWQ
%token <std::string> STRING
%printer { yyo << $$; }<*>;
%%
data :
     | line data
     ;
line : KEY1 EQ string
     | KEY2 EQ values
     ;
string : OPV DWQ STRING DWQ CLV
       {
           conf.keyword1 = std::string( $3 ).c_str();
       }
       ;
values : OPV DWQ STRING DWQ COM OPV OPTIONA ARROW DWQ STRING DWQ COM OPTIONC ARROW DWQ STRING DWQ CLV CLV
       { 
           conf.keyword2.value=std::string($3).c_str();
           conf.keyword2.a=std::string($10).c_str();
           conf.keyword2.c=std::string($16).c_str();
       }
       ;
%%
void yy::parser::error( const location_type& l,const std::string& error){
  std::cout << l << ":" << error << std::endl;
}
