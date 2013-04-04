# ===========================================================================
#    @PACKAGE_URL@
# ===========================================================================
#
# SYNOPSIS
#
#   AX_HAVE_@@PROJECT_DEFINE@@
#
# DESCRIPTION
#
#   Test for @PACKAGE_NAME@
#
#   This macro calls:
#
#     AC_SUBST(@@PROJECT_DEFINE@@_INCLUDE)
#     AC_SUBST(@@PROJECT_DEFINE@@_LIBS)
#
#   And sets:
#
#     HAVE_@@PROJECT_DEFINE@@
#
# LICENSE
#
#   Copyright (c) @@YEAR@@ @@OWNER@@ <@PACKAGE_BUGREPORT@>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

AC_DEFUN([AX_HAVE_@@PROJECT_DEFINE@@],
[
	AC_ARG_WITH([@@PROJECT@@],
    AS_HELP_STRING([--with-@@PROJECT@@], [use @PACKAGE_NAME@]),
    [
      if test x"$withval" = "xno"; then
        want_@@PROJECT_DEFINE_LOWER@@="no";
      else
        want_@@PROJECT_DEFINE_LOWER@@="yes";
      fi
    ],
    [want_@@PROJECT_DEFINE_LOWER@@="yes"]
  )

  if test x"$want_@@PROJECT_DEFINE_LOWER@@" = "xyes"; then
    AC_MSG_CHECKING([for @@PROJECT@@])

    # Ensure we have a suitable C++ compiler
    AC_REQUIRE([AC_PROG_CC])

    ax_@@PROJECT_DEFINE_LOWER@@_saved_CPPFLAGS="$CPPFLAGS"
    ax_@@PROJECT_DEFINE_LOWER@@_INCLUDE=""
    CPPFLAGS="$CPPFLAGS $ax_@@PROJECT_DEFINE_LOWER@@_INCLUDE"
    export CPPFLAGS

    ax_@@PROJECT_DEFINE_LOWER@@_saved_LIBS="$LIBS"
    ax_@@PROJECT_DEFINE_LOWER@@_LIBS=""
    LIBS="$LIBS $ax_@@PROJECT_DEFINE_LOWER@@_LIBS"
    export LIBS

    AC_LANG_PUSH([C++])
    AC_COMPILE_IFELSE([
      AC_LANG_PROGRAM(
        [[@%:@include <@@PROJECT@@/Bootstrapper.hpp>]],
        [[
          Bootstrapper bs;
          return 0;
        ]]
      )],
      ax_have_@@PROJECT_DEFINE_LOWER@@=yes,
      ax_have_@@PROJECT_DEFINE_LOWER@@=no
    )
    AC_LANG_POP([C++])

    AC_MSG_RESULT([$ax_have_@@PROJECT_DEFINE_LOWER@@])
    if test x"$ax_have_@@PROJECT_DEFINE_LOWER@@" = "xyes"; then
      AC_DEFINE(HAVE_@@PROJECT_DEFINE@@,,[define if @@PROJECT@@ is available])
      @@PROJECT_DEFINE@@_INCLUDE="$ax_@@PROJECT_DEFINE_LOWER@@_INCLUDE"
      dnl This doesn't yet test the location of this project
      @@PROJECT_DEFINE@@_LIBS="$ax_@@PROJECT_DEFINE_LOWER@@_LIBS -l@PACKAGE_NAME@"
    else
      AC_MSG_ERROR([Could not find @@PROJECT@@])
      @@PROJECT_DEFINE@@_INCLUDE=""
      @@PROJECT_DEFINE@@_LIBS=""
    fi
    AC_SUBST(@@PROJECT_DEFINE@@_INCLUDE)
    AC_SUBST(@@PROJECT_DEFINE@@_LIBS)

    CPPFLAGS="$ax_@@PROJECT_DEFINE_LOWER@@_saved_CPPFLAGS"
    LIBS="$ax_@@PROJECT_DEFINE_LOWER@@_saved_LIBS"
  fi;
])
