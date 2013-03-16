lib_LTLIBRARIES = lib@@PROJECT@@.la
lib@@PROJECT_PRIMARY@@_la_CPPFLAGS = @QT_CXXFLAGS@ -I$(top_srcdir)/include
lib@@PROJECT_PRIMARY@@_la_LIBADD = @QT_LIBS@

lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES = \
	moc_@@PROJECT_OBJ@@.cpp

nodist_lib@@PROJECT_PRIMARY@@_la_SOURCES = $(lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES)

lib@@PROJECT_PRIMARY@@_la_SOURCES = \
	@@PROJECT_OBJ@@.cpp

mostlyclean-local:
	rm -f $(lib@@PROJECT_PRIMARY@@_la_MOC_SOURCES)
.PHONY: mostlyclean-local

moc_%.cpp: $(top_srcdir)/include/%.hpp
	@QT_MOC@ -o $@ $<
