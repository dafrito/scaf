#include "init.hpp"

BOOST_AUTO_TEST_CASE(additionWorks)
{
    @@PROJECT_OBJ@@ obj;
    BOOST_REQUIRE_EQUAL(4, obj.add(2, 2));
}
