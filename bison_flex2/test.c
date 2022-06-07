#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "test.tab.h"

extern FILE *yyin;
#define MAXSTR (256)
typedef struct {
    char key[MAXSTR];
    char value[MAXSTR];
}test_t;
extern test_t conf[4];

int main(int argc,char *argv[])
{
    FILE *fp=NULL;
    if(2 == argc){
        if(NULL != (fp=fopen(argv[1],"r"))){
            yyin=fp;
            yyparse();
        }else{
            fprintf(stderr,"%s open failed\n",argv[1]);
            exit(1);
        }
    } else { 
        fprintf(stderr,"[need argument] %s filename \n",argv[0]);
        exit(1);
    }
    fclose(fp);
    printf("key:%s,value:%s\n",conf[0].key,conf[0].value);
    printf("key:%s,value:%s\n",conf[1].key,conf[1].value);
    printf("key:%s,value:%s\n",conf[2].key,conf[2].value);
    printf("key:%s,value:%s\n",conf[3].key,conf[3].value);
    return 0;
}
