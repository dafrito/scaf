lib_LTLIBRARIES = lib@@PROJECT@@.la
lib@@PROJECT_PRIMARY@@_la_CPPFLAGS = @QT_CXXFLAGS@ -I$(top_srcdir)/include
lib@@PROJECT_PRIMARY@@_la_LIBADD = @QT_LIBS@
lib@@PROJECT_PRIMARY@@_la_LDFLAGS = -version-info 0:0:0

# moc-generated source files
lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES =

nodist_lib@@PROJECT_PRIMARY@@_la_SOURCES = $(lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES)

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

nodist_@@PROJECT_PRIMARY@@_SOURCES = $(@@PROJECT_PRIMARY@@_MOC_SOURCES)

mostlyclean-local:
	rm -f $(lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES)
.PHONY: mostlyclean-local

moc_%.cpp: $(top_srcdir)/src/%.hpp
	@QT_MOC@ -o $@ $<

moc_%.cpp: $(top_srcdir)/include/%.hpp
	@QT_MOC@ -o $@ $<
