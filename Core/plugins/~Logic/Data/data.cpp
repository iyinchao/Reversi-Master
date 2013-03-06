#include "data.h"
Data::Data()
{
    color=1;
    r[0]=60;r[1]=2;r[2]=2;
    direction[0]=-11;direction[1]=-10;direction[2]=-9;
    direction[3]=-1; direction[4]=1;  direction[5]=9;
    direction[6]=10; direction[7]=11;
    //initial the board array,it boarder is marked 3 and set 2
    //black and white stone
    for(int i=0;i<100;i++){
        if(i<10||i>90||i%10==0||i%10==9){
            board[i]=3;
        }else{
        board[i]=0;
        }
    }
    board[54]=board[45]=1;
    board[55]=board[44]=2;

}
void Data::initial(){
    color=1;
    r[0]=60;
    r[1]=2;
    r[2]=2;
    for(int i=0;i<100;i++){
        if(i<10||i>90||i%10==0||i%10==9){
            board[i]=3;
        }else{
        board[i]=0;
        }
    }
    board[54]=board[45]=1;
    board[55]=board[44]=2;
}
Data::~Data()
{
}
