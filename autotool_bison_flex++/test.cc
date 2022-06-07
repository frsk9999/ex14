#include <iostream>
#include <cstring>
#include <fstream>
using std::string;
#include "test_yacc.hh"
#include "test.hh"
#include "test_driver.hh"
test_t conf;

int main(int argc,char *argv[])
{
    int ret = 0;
    memset(&conf,0,sizeof(test_t));
    if(2 != argc) {
        fprintf(stderr,"usage: %s test.data\n",argv[0]);
        return -1;
    }else{
        string filename=argv[1];
        test_driver driver(filename);
        driver.begin_bison(filename);
    } 
    std::cout << "keyword1:"       << conf.keyword1       << std::endl;
    std::cout << "keyword2.value:" << conf.keyword2.value << std::endl;
    std::cout << "keyword2.a:"     << conf.keyword2.a     << std::endl;
    std::cout << "keyword2.c:"     << conf.keyword2.c     << std::endl;
    return 0;
}
