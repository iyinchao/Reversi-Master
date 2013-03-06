#ifndef LOGIC_H
#define LOGIC_H

#include <QtDeclarative/QDeclarativeItem>
#include "Data\data.h"
class Logic : public QDeclarativeItem
{
    Data database;
    Q_OBJECT
    Q_DISABLE_COPY(Logic)

public:
    Logic(QDeclarativeItem *parent = 0);
    Q_INVOKABLE
    bool validate(int index,int color);

    ~Logic();
};

QML_DECLARE_TYPE(Logic)

#endif // LOGIC_H

