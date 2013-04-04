#include "Bootstrapper.hpp"

Bootstrapper::Bootstrapper() :
    _mainWidget()
{
}

QWidget& Bootstrapper::mainWidget()
{
    return _mainWidget;
}
