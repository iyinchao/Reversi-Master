#include "logic.h"
#include "Data\data.h"
#include <QtDeclarative/qdeclarative.h>

Logic::Logic(QDeclarativeItem *parent):
        QDeclarativeItem(parent)
{

}
bool Logic::validate(int index,int color){
    int ava=0;
    int s[8]={0};
    for(int i=0;i<8;i++){
        if(database.board[(index+database.direction[i])]==(3-color)){
            ava++;
            s[ava-1]=database.direction[i];
        }
    }
    if(ava==0)return false;
    for(int i=0;i<ava;i++){
        int num=index+s[i]*2;
        do{
            if (database.board[num]==color)return true;
            num+=s[i];
        } while(database.board[num]!=3);
    }
    return false;
}

Logic::~Logic()
{
}

