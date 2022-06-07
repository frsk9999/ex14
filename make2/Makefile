all: test

test: test.h test2.o test.o; gcc -o clean test.o test2.o

test.h:

test.o: test.c
	@gcc -o test.o -c test.c
test2.o: test2.c
	@gcc -o test2.o -c test2.c

# わざとcleanという実行ファイル名にしている
# .PHONYがないとmake cleanが通らない
.PHONY: clean
clean:
	rm -f clean test.o test2.o 
