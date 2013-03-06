#include "logic.h"
#include "..\Data\data.cpp"
#include <QtDeclarative/qdeclarative.h>
#include <ctime>
#include<cstdlib>
Logic::Logic(QDeclarativeItem *parent):
    QDeclarativeItem(parent)
{
      initial();
}
///****************ai area(below)********************/
int Logic::ai(int dep,int exactdep,int color){
    int list[30]={0};
    int count=0;
    int result=2;
    int v;
    //clone board state,boardcpy is a virtual board
    //for computer to experiment and find the best way to move
    for(int i=0;i<100;i++){
        boardcpy[i]=database.board[i];
    }
    colorcpy=color;
    movescpy=database.moves;
    //
    if(!dep)dep=0;
    if(!exactdep)exactdep=dep;
    int max=-32767;//default max is set to Negative infinity
    for(int y=1;y<=8;y++){
        for(int x=1;x<=8;x++){
            if(boardcpy[y*10+x]){
                continue;
            }else{
                if(!validate_ai(x,y,colorcpy))continue;
                int attemptnum=0;
                int attemptlist[30]={0};
                attempt(x,y,attemptnum,attemptlist);
                if(database.moves+exactdep>=60){
                    v=-exactsearch(-32767,32767);
                }else if((x==2||x==7)&&(y==2||y==7)){
                    v=-search(-32767,32767,dep+1);
                }else{
                    v=-search(-32767,32767,dep);
                }
                unattempt(x,y,attemptnum,attemptlist);
                if(v<max)continue;
                if(v>max){
                    max=v;
                    for(int i=0;i<15;i++)list[i]=0;
                    count=1;
                    result=10*y+x;
                    list[count-1]=result;
                }else{
                    count++;
                    list[count-1]=10*y+x;
                }
            }     
        }
    }
    if(count==1){
        return list[0];
    }else{
        srand((unsigned)time(0));
        int r=rand()%count;
        return list[r];
    }
}
int Logic::search(int alpha,int beta,int dep){
    if(dep==0)return evaluate(colorcpy);//leaf node
    for(int y=1;y<=8;y++){
        for(int x=1;x<=8;x++){
            if(boardcpy[y*10+x]==0){
                if(!validate_ai(x,y,colorcpy))continue;
                int attemptnum=0;
                int attemptlist[30]={0};
                attempt(x,y,attemptnum,attemptlist);
                int r=-search(-beta,-alpha,dep-1);
                unattempt(x,y,attemptnum,attemptlist);
                if(r>=alpha)alpha=r;
                if(alpha>beta)return 32767;

            }
        }
    }
    return alpha;
}
int Logic::exactsearch(int alpha,int beta){
    if(movescpy==60)return evaluate(colorcpy);//leaf node
    for(int y=1;y<=8;y++){
        for(int x=1;x<=8;x++){
            if(boardcpy[y*10+x]==0){
                if(!validate_ai(x,y,colorcpy))continue;
                int attemptnum=0;
                int attemptlist[30]={0};
                attempt(x,y,attemptnum,attemptlist);
                int r=-exactsearch(-beta,-alpha);
                unattempt(x,y,attemptnum,attemptlist);
                if(r>=alpha)alpha=r;
                if(alpha>beta)return 32767;
            }
        }
    }
    return alpha;
}
//attempt*:only change the virtual board:boardcpy
void Logic::attempt(int x,int y,int &attnum,int (&attlist)[30]){
    for(int i=0;i<8;i++){
        int num=10*y+x+database.direction[i];
        if(boardcpy[num]==3-colorcpy){
            while(boardcpy[num]!=0&&boardcpy[num]!=3){
                num+=database.direction[i];
                if(boardcpy[num]==colorcpy){
                    while((num-=database.direction[i])!=10*y+x){
                        boardcpy[num]=colorcpy;
                        attlist[attnum]=num; //save stone changes
                        attnum++;            //and will be used in unattempt
                    }
                    break;
                }
            }
        }
    }
    boardcpy[10*y+x]=colorcpy;
    colorcpy=3-colorcpy;
    movescpy++;
}
//unattempt* :used to return original state before attempt
void Logic::unattempt(int x,int y,int &attnum,int (&attlist)[30]){
    for(int i=0;i<attnum;i++)boardcpy[attlist[i]]=colorcpy;
    boardcpy[10*y+x]=0;
    colorcpy=3-colorcpy;
    movescpy--;
}
bool Logic::validate_ai(int x,int y,int color){
    int flag;
    int num;
    for(int i=0;i<8;i++){
        flag=0;
        num=10*y+x+database.direction[i];
        while(boardcpy[num]!=3&&boardcpy[num]!=0){
            if(boardcpy[num]==3-color) flag++;
            if(!flag) break;
            if(boardcpy[num]==color&&flag)return true;
            num+=database.direction[i];
        }
    }
    return false;
}
int Logic::evaluate(int color){
    int v=0;
    //get value by valuemap
    for(int i=11;i<=88;i++){
        if(boardcpy[i]==color){
            v+=::valuemap[i];
        }else if(boardcpy[i]==3-color){
            v-=::valuemap[i];
        }
    }
    return v;
}
void Logic::ainject(){
    int index=ai(4,10,database.color);/**/
    int count=0;
    int num;
    int i;
    int t;
    int flag=0;
    database.board[index]=database.color;
    emit boardupdate(index,database.color);
    for(i=0;i<8;i++){
            count=0;
            flag=0;
        num=index+database.direction[i];
        while(database.board[num]!=3&&database.board[num]!=0){
            if(database.board[num]==3-database.color){
                count++;
            }else{
                flag=1;
                break;
            }
                num+=database.direction[i];
        }
        if(!flag){
            continue;
        }else{
            for(t=1;t<=count;t++){
                database.board[index+database.direction[i]*t]=database.color;
                emit boardupdate(index+database.direction[i]*t,database.color);
            }
        }
    }
    database.color=3-database.color;//switch color
    database.moves++;//add a move
    emit lastmark(index);
    emit delaynext();
}
///*****************ai area(above)*******************/
void Logic::initial(){
    database.initial();
    aiflag=0;
    for(int i=11;i<=88;i++){
        emit boardupdate(i,database.board[i]);
    }
}
void Logic::rematch(){
    database.initial();
    for(int i=11;i<=88;i++){
        emit boardupdate(i,database.board[i]);
    }
}
bool Logic::validate(int index,int color){
    int flag;
    int num;
    for(int i=0;i<8;i++){
        flag=0;
        num=index+database.direction[i];
        while(database.board[num]!=3&&database.board[num]!=0){
            if(database.board[num]==3-color) flag++;
            if(!flag) break;
            if(database.board[num]==color&&flag)return true;
            num+=database.direction[i];
        }
    }
    return false;
}
int Logic::exact(int color=0){
    database.r[0]=0;
    database.r[1]=0;
    database.r[2]=0;
    for(int i=0;i<100;i++){
        if(database.board[i]==3)continue;
        database.r[database.board[i]]++;
    }
    return database.r[color];
}
int Logic::getboard(int index){
    return database.board[index];
}
int Logic::getcolor(){
    return database.color;
}
void Logic::inject(int index){
   int count=0;
   int num;
   int i;
   int t;
   int flag=0;
   database.board[index]=database.color;
   emit boardupdate(index,database.color);
   for(i=0;i<8;i++){
           count=0;
           flag=0;
       num=index+database.direction[i];
       while(database.board[num]!=3&&database.board[num]!=0){
           if(database.board[num]==3-database.color){
               count++;
           }else{
               flag=1;
               break;
           }
                   num+=database.direction[i];
       }
       if(!flag){
           continue;
       }else{
           for(t=1;t<=count;t++){
               database.board[index+database.direction[i]*t]=database.color;
               emit boardupdate(index+database.direction[i]*t,database.color);
           }
       }
   }
   database.color=3-database.color;//switch color
   database.moves++;//add a move
   emit lastmark(index);
   if(!aiflag){
       emit delay();
   }else{
       emit delayprev();
   }
}
void Logic::setaiflag(int flag){
    aiflag=flag;
}
int Logic::passtest(int color){
    if(database.moves<60){
        for(int i=0;i<100;i++){
            if(database.board[i]!=0)continue;
            if(validate(i,color)) return 0;
        }
        database.color=3-color;//switch color
        emit pass(color);
        return color;
    }
}
int Logic::wintest(){
    if(database.moves==60){
        exact();
        if(database.r[1]>database.r[2]){
            emit win(1);
            return 1;
        }else if(database.r[1]==database.r[2]){
            emit win(3);
            return 3;
        }else{
            emit win(2);
            return 2;
        }
    }
    exact();
    if(database.r[1]==0){
        emit win(2);
        return 2;
    }
    if(database.r[2]==0){
        emit win(1);
        return 1;
    }
    return 0;
}

Logic::~Logic()
{
}
