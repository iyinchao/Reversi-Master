#ifndef LABTEST_H
#define LABTEST_H

#include <QtDeclarative/QDeclarativeItem>
#include<QList>
class Labtest : public QDeclarativeItem
{
    int lv[4];
    Q_OBJECT

    Q_DISABLE_COPY(Labtest)

public:
    Labtest(QDeclarativeItem *parent = 0);
    Q_INVOKABLE
    int getlv(int i);
    ~Labtest();
};

QML_DECLARE_TYPE(Labtest)

#endif // LABTEST_H

