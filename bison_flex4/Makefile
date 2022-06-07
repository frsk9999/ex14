all:
	bison -o test.tab.cpp -d test.yy
	flex -otest.yy.cpp test.ll
	g++ -o test test_driver.cpp test.cpp test.tab.cpp test.yy.cpp -lfl
clean:
	rm -f test test.tab.cpp test.yy.cpp test.tab.hpp location.hh position.hh stack.hh
