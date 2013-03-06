#include "labtest.h"
#include<QList>
#include <QtDeclarative/qdeclarative.h>

Labtest::Labtest(QDeclarativeItem *parent):
    QDeclarativeItem(parent)
{

    for(int i=0;i<4;i++){
        lv[i]=i;
    }
}
int Labtest::getlv(int i){
    return lv[i];
}

Labtest::~Labtest()
{
}

