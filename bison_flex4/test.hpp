#ifndef __TEST_H__
#define __TEST_H__
#define STRMAX (256)
typedef struct {
    std::string value;
    std::string a;
    std::string c;
} k2_t;
typedef struct {
    std::string keyword1;
    k2_t keyword2;
}test_t;
extern test_t conf;
#endif
