#ifndef __TEST_H__
#define __TEST_H__
extern FILE *yyin;
#define STRMAX (256)
typedef struct {
    char value[STRMAX];
    char a[STRMAX];
    char c[STRMAX];
} k2_t;
typedef struct {
    char keyword1[STRMAX];
    k2_t keyword2;
}test_t;
extern test_t conf;
#endif
