QT_CXXFLAGS = @QT_CXXFLAGS@
QT_LIBS = @QT_LIBS@
QT_MOC = @QT_MOC@

bin_PROGRAMS = @@PROJECT@@
@@PROJECT@@_CPPFLAGS = @QT_CXXFLAGS@
@@PROJECT@@_LDADD = @QT_LIBS@

# moc-generated source files
@@PROJECT@@_MOC_SOURCES = 

@@PROJECT@@_SOURCES = \
	$(@@PROJECT@@_MOC_SOURCES) \
	main.cpp

mostlyclean-local:
	rm -f $(@@PROJECT@@_MOC_SOURCES)
.PHONY: mostlyclean-local

moc_%.cpp: %.hpp
	$(QT_MOC) -o $@ $<
