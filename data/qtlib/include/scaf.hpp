#ifndef @@PROJECT_DEFINE@@_@@PROJECT_DEFINE@@_HEADER
#define @@PROJECT_DEFINE@@_@@PROJECT_DEFINE@@_HEADER

#include <QObject>

class @@PROJECT_OBJ@@ : public QObject
{
    Q_OBJECT
public:
    int add(const int a, const int b) const;
};

#endif // @@PROJECT_DEFINE@@_@@PROJECT_DEFINE@@_HEADER
