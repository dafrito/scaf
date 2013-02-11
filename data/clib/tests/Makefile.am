check_PROGRAMS = runtest
runtest_CXXFLAGS = $(AM_CXXFLAGS) -I$(top_srcdir)/include -I$(top_srcdir)/src -DBOOST_TEST_DYN_LINK

# Don't try changing "../src" to use "top_srcdir" - this is referring to the
# built artifact, not something in the source directory
runtest_LDADD = @BOOST_UNIT_TEST_FRAMEWORK_LIB@ ../src/lib@@PROJECT@@.la

TESTS = $(check_PROGRAMS)

runtest_SOURCES =         \
	BasicTests.cpp
