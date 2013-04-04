#ifndef @@PROJECT_DEFINE@@_BOOTSTRAPPER_HEADER
#define @@PROJECT_DEFINE@@_BOOTSTRAPPER_HEADER

#include <QWidget>

class Bootstrapper
{
    QWidget _mainWidget;
public:
    Bootstrapper();

    QWidget& mainWidget();
};

#endif // @@PROJECT_DEFINE@@_BOOTSTRAPPER_HEADER

