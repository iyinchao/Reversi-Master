#ifndef DATA_H
#define DATA_H

#include <QtDeclarative/QDeclarativeItem>
#include<QList>

class Data : public QDeclarativeItem
{
    Q_OBJECT
    Q_DISABLE_COPY(Data)

public:
    int board [100];
    int color;
    int r[3];
    int direction[8];
    Data(QDeclarativeItem *parent = 0);
    Q_INVOKABLE
    void initial(void);

    ~Data();
};

QML_DECLARE_TYPE(Data)

#endif // DATA_H

