#define BOOST_TEST_MODULE @@PROJECT@@
#include "init.hpp"

#include <QApplication>

struct QApplicationFixture
{
    int argc;
    char name[100];
    char* argv[1];

    QApplication* app;
public:
    QApplicationFixture() :
        argc(1)
    {
        strcpy(name, "@@PROJECT@@");
        argv[0] = name;
        app = new QApplication(argc, argv);
    }

    ~QApplicationFixture()
    {
        delete app;
    }
};

BOOST_GLOBAL_FIXTURE(QApplicationFixture);
