# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([@@PROJECT@@], [1.0], [@@EMAIL@@], [@@PROJECT@@], [@@WEBSITE@@])
AC_SUBST([PACKAGE_RELEASE], [1])
AM_INIT_AUTOMAKE([-Wall foreign])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([src/config.h])
AC_CONFIG_MACRO_DIR([m4])

# Check for build programs
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_LN_S

# Initialize libtool
AM_PROG_AR
LT_PREREQ([2.2])
LT_INIT
AC_PROG_LIBTOOL

# Check for compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Check for Boost
AX_BOOST_BASE
AX_BOOST_UNIT_TEST_FRAMEWORK

AC_LANG([C++])

AC_CONFIG_FILES([@@PROJECT@@.m4 Makefile src/Makefile tests/Makefile rpm.spec])
AC_OUTPUT
