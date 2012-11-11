#include <QtTest/QtTest>
#include <@@PROJECT_OBJ@@.hpp>

using namespace std;

class BasicTests : public QObject
{
    Q_OBJECT
private slots:

    void testProject()
    {
        @@PROJECT_OBJ@@ obj;
        QCOMPARE(4, obj.add(2, 2));
    }
};
