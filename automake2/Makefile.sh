#!/bin/sh

	autoscan
	cat configure.scan |\
        sed -e "s/^AC_INIT\(.*\)/AC_INIT([test], [1.0])\nAM_INIT_AUTOMAKE([foreign])/" |\
        sed -e "s/AC_CONFIG_SRCDIR\(.*\)/AC_CONFIG_SRCDIR([test.c])/" |\
        sed -e "s/AC_CONFIG_HEADERS\(.*\)/AC_CONFIG_HEADERS([config.h])\nAC_DEFINE([TEST_DEF],[14],[test define])/" |\
        sed -e "s/AC_OUTPUT/AC_CONFIG_FILES([Makefile])\nAC_OUTPUT/" > configure.ac
	autoheader
	aclocal
	echo "bin_PROGRAMS=test" >Makefile.am
	echo "test_SOURCES=test.c config.h" >>Makefile.am
	automake -a -c
	autoconf
	./configure

