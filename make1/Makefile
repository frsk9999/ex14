CC=/usr/local/bin/gcc
all:
	@echo "#include <stdio.h>" > test.c
	@echo "int main()" >> test.c
	@echo "{" >> test.c
	@echo "    printf(\"test\\n\");" >> test.c
	@echo "    return 0;" >> test.c
	@echo "}" >> test.c
	@$(CC) -o test test.c
	@./test
	@make clean
clean:
	@rm test test.c
