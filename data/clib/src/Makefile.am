QT_CXXFLAGS = @QT_CXXFLAGS@
QT_LIBS = @QT_LIBS@
QT_MOC = @QT_MOC@

lib_LTLIBRARIES = lib@@PROJECT@@.la
lib@@PROJECT@@_la_CPPFLAGS = @QT_CXXFLAGS@ -I$(top_srcdir)/include
lib@@PROJECT@@_la_LIBADD = @QT_LIBS@

lib@@PROJECT@@_la_MOC_SOURCES = \
	moc_@@PROJECT_OBJ@@.cpp

lib@@PROJECT@@_la_SOURCES = \
	$(lib@@PROJECT@@_la_MOC_SOURCES) \
	@@PROJECT_OBJ@@.cpp

mostlyclean-local:
	rm -f $(lib@@PROJECT@@_la_MOC_SOURCES)
.PHONY: mostlyclean-local

moc_%.cpp: $(top_srcdir)/include/%.hpp
	$(QT_MOC) -o $@ $<
