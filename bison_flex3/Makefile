all:
	bison -t -d test.y
	flex -otest.yy.c test.l
	gcc -o test test.c test.tab.c test.yy.c -lfl
clean:
	rm -f test test.tab.c test.yy.c test.tab.h
