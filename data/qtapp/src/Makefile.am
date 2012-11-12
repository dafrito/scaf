bin_PROGRAMS = @@PROJECT@@
@@PROJECT_PRIMARY@@_CPPFLAGS = @QT_CXXFLAGS@
@@PROJECT_PRIMARY@@_LDADD = @QT_LIBS@

# moc-generated source files
@@PROJECT_PRIMARY@@_MOC_SOURCES =

@@PROJECT_PRIMARY@@_SOURCES = \
	$(@@PROJECT_PRIMARY@@_MOC_SOURCES) \
	main.cpp

mostlyclean-local:
	rm -f $(@@PROJECT_PRIMARY@@_MOC_SOURCES)
.PHONY: mostlyclean-local

moc_%.cpp: %.hpp
	@QT_MOC@ -o $@ $<
