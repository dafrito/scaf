#ifndef @@PROJECT_UPPER@@_@@PROJECT_UPPER@@_HEADER
#define @@PROJECT_UPPER@@_@@PROJECT_UPPER@@_HEADER

#include <QObject>

class @@PROJECT_OBJ@@ : public QObject
{
    Q_OBJECT
public:
    int add(const int a, const int b) const;
};

#endif // @@PROJECT_UPPER@@_@@PROJECT_UPPER@@_HEADER
