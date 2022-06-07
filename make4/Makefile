all: test.o
	gcc test.o -o test
.c.o:
	gcc -c $< -o $@
clean:
	rm test.o test 
