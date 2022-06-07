#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "test.tab.h"
#include "test.h"

test_t conf;

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
    printf("keyword1:%s\n",conf.keyword1);
    printf("keyword2.value:%s\n",conf.keyword2.value);
    printf("keyword2.a:%s\n",conf.keyword2.a);
    printf("keyword2.c:%s\n",conf.keyword2.c);
    return 0;
}
