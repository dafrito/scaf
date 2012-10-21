QT_CXXFLAGS = @QT_CXXFLAGS@
QT_LIBS = @QT_LIBS@
QT_MOC = @QT_MOC@

check_PROGRAMS = runtest
runtest_CXXFLAGS = $(AM_CXXFLAGS) $(QT_CXXFLAGS) -I../src
runtest_LDADD = $(QT_LIBS)

TESTS = $(check_PROGRAMS)

test_suites =         \
	BasicTests

runtest_SOURCES =         \
	tests.cpp             \
	BasicTests.hpp

nodist_runtest_SOURCES =      \
	moc_BasicTests.cpp

tests.cpp: $(addsuffix .hpp, $(test_suites))
	rm -f $@
	./make_wrapper.sh $^ >$@-wip
	mv $@-wip $@
	chmod -w $@

moc_%.cpp: %.hpp
	$(QT_MOC) -o $@ $<
