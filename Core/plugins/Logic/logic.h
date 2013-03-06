#ifndef LOGIC_H
#define LOGIC_H

#include <QtDeclarative/QDeclarativeItem>
#include "..\Data\data.h"
const int valuemap[100]={
    0, 0,  0,0,0,0,0,  0, 0,0,
    0,40, -8,4,3,3,4, -8,40,0,
    0,-8,-10,2,1,1,2,-10,-8,0,
    0, 4,  2,3,1,1,3,  2, 4,0,
    0, 3,  1,1,2,2,1,  1, 3,0,
    0, 3,  1,1,2,2,1,  1, 3,0,
    0, 4,  2,3,1,1,3,  2, 4,0,
    0,-8,-10,2,1,1,2,-10,-8,0,
    0,40, -8,4,3,3,4, -8,40,0,
    0, 0,  0,0,0,0,0,  0, 0,0
};
class Logic : public QDeclarativeItem
{
    Data database;
    int aiflag;
    int boardcpy[100];
    int colorcpy;
    int movescpy;
    Q_OBJECT
    Q_DISABLE_COPY(Logic)
 signals:
    void pass(int _color);
    void win(int _color);
    void boardupdate(int _index,int _color);
    void delay();
    void lastmark(int _index);
    void delayprev();
    void delaynext();
 public:
    Logic(QDeclarativeItem *parent = 0);
    /*****************ai area************************/
    int ai(int dep,int exactdep,int color);
    int evaluate(int color);
    //virtural changes
    //attempt* :only change the virtual board:boardcpy
    void attempt(int x,int y,int &attnum,int (&attlist)[30]);
    //restore virtural changes
    //unattempt* :used to return original state before attempt
    void unattempt(int x,int y,int &attnum,int (&attlist)[30]);
    bool validate_ai(int x,int y,int color);
    int search(int alpha,int beta,int dep);
    int exactsearch(int alpha,int beta);
    Q_INVOKABLE void ainject();
    /*********************ai area********************/
    //
    Q_INVOKABLE void initial();
    //
    Q_INVOKABLE void rematch();
    //for validate the action
    Q_INVOKABLE bool validate(int index,int color);
    //get the number of[empty,black,white]
    Q_INVOKABLE int exact(int);
    //return certain value of the board
    Q_INVOKABLE int getboard(int index);
    //return now color
    Q_INVOKABLE int getcolor();
    //put a stone on a certain block(core function 1)
    Q_INVOKABLE void inject(int index);
    //tell c++ and qml whether the game an ai drived state
    Q_INVOKABLE void setaiflag(int);
    //test if passed
    Q_INVOKABLE int passtest(int color);
    //test if a guy win the game
    Q_INVOKABLE int wintest();
    ~Logic();
};

QML_DECLARE_TYPE(Logic)

#endif // LOGIC_H

