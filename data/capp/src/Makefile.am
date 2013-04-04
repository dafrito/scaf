lib_LTLIBRARIES = lib@@PROJECT@@.la
lib@@PROJECT_PRIMARY@@_la_CPPFLAGS = -I$(top_srcdir)/include
lib@@PROJECT_PRIMARY@@_la_LIBADD =
lib@@PROJECT_PRIMARY@@_la_LDFLAGS = -version-info 0:0:0

lib@@PROJECT_PRIMARY@@_la_SOURCES = \
	Bootstrapper.cpp \
	util.cpp

pkginclude_HEADERS = \
	../include/Bootstrapper.hpp \
	../include/util.hpp

bin_PROGRAMS = @@PROJECT@@
@@PROJECT_PRIMARY@@_CPPFLAGS = $(lib@@PROJECT_PRIMARY@@_la_CPPFLAGS)
@@PROJECT_PRIMARY@@_LDADD = lib@@PROJECT_PRIMARY@@.la $(lib@@PROJECT_PRIMARY@@_la_LIBADD)

@@PROJECT_PRIMARY@@_SOURCES = \
	main.cpp
