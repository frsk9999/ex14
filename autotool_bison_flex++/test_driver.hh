#ifndef __TEST_DRIVER_HPP__
#define __TEST_DRIVER_HPP__
#include <string>
#include "test_yacc.hh"

#define YY_DECL \
  yy::parser::symbol_type yylex(test_driver& driver)

YY_DECL;

class test_driver
{
    public:
        test_driver(std::string &f);
        ~test_driver();
        int ret;
        int begin_bison(std::string &f);
        yy::location loca;
};
#endif
