
all:
	bison -t -d test.y
	flex -otest.yy.c test.l
	gcc -o test test.c test.tab.c test.yy.c -lfl
#	gcc -o test test.c test.tab.c test.yy.c -lfl -DYYERROR_VERBOSE=1 -DYYDEBUG=1
clean:
	rm -f test test.tab.c test.yy.c test.tab.h
