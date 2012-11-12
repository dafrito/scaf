# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([@@PROJECT@@], [1.0], [@@EMAIL@@], [@@PROJECT@@], [@@WEBSITE@@])
AM_INIT_AUTOMAKE([-Wall foreign])
LT_PREREQ([2.2])
LT_INIT
AC_CONFIG_SRCDIR([src/@@PROJECT_OBJ@@.cpp])
AC_CONFIG_HEADERS([src/config.h])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_LIBTOOL

AX_HAVE_QT_CORE
AX_HAVE_QT_MOC
AX_HAVE_QT_TEST

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_SIZE_T

AC_LANG([C++])

# Checks for library functions.

AC_CONFIG_FILES([@@PROJECT@@.m4 Makefile src/Makefile include/Makefile tests/Makefile rpm.spec])
AC_OUTPUT
