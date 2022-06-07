#include "test_driver.hpp"
#include "test.tab.hpp"
#include <cstring>
extern FILE *yyin;

test_driver::test_driver(std::string &f)
{
    if(!(yyin = fopen(f.c_str(),"r"))){
        std::cerr << "cannot open" << f << ":" << strerror (errno) << std::endl;
        exit(-1);
    }
}
test_driver::~test_driver()
{
    fclose(yyin);
}

int test_driver::begin_bison(std::string &f)
{
    loca.initialize(&f);
    yy::parser parse(*this);
    int ret = parse();
    return ret;
}
