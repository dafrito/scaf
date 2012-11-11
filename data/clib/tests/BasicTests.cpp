#include <@@PROJECT_OBJ@@.hpp>

#define BOOST_TEST_MODULE basic tests
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE( additionWorks )
{
    @@PROJECT_OBJ@@ obj;
    BOOST_REQUIRE_EQUAL(4, obj.add(2, 2));
}
