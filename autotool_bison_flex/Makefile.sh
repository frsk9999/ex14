#!/bin/sh

autoscan
cat configure.scan | \
sed -e "s/^AC_INIT\(.*\)/AC_INIT([test], [1.0])\nAM_INIT_AUTOMAKE([foreign])/" | \
sed -e "s/AC_CONFIG_SRCDIR\(.*\)/AC_CONFIG_SRCDIR([test.c])/" | \
sed -e "s/AC_PROG_INSTALL/AC_PROG_INSTALL\nAC_PROG_LEX\nAC_PROG_YACC/" | \
sed -e "s/# Checks for libraries./# Checks for libraries.\nAC_CHECK_LIB(fl,main)/"| \
sed -e "s/AC_OUTPUT/AC_CONFIG_FILES([Makefile])\nAC_OUTPUT/" > configure.ac
autoheader
aclocal
echo "BUILT_SOURCES=test_yacc.h"                           > Makefile.am
echo "AM_YFLAGS = -d"                                      >>Makefile.am
echo "bin_PROGRAMS=test"                                   >>Makefile.am
echo "test_SOURCES=test_yacc.y test_lex.l test.c config.h" >>Makefile.am
automake -a -c
autoconf
./configure
# あとはmakeするだけ
