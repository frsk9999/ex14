#include <stdio.h>
#include "config.h"

int main()
{
    printf("%s\n",PACKAGE_STRING);
    printf("TEST_DEF:%d\n",TEST_DEF);
    return 0;
}
