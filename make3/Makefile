# 環境に応じて変えてね
bsdmake=/usr/bin/make
gnumake=/usr/local/bin/gmake

all: bsd 

bsd:
	$(bsdmake) -f Makefile.bmk
gnu:
	$(gnumake) -f Makefile.gmk

clean: bsdclean

bsdclean:
	$(bsdmake) clean cleandepend -f Makefile.bmk

gnuclean:
	$(gnumake) clean -f Makefile.gmk
