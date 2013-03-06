#ifndef DATA_H
#define DATA_H
class Data{
public:
    int board [100];
    int color;
    int r[3];
    int direction[8];
    int moves;
    Data();
    void initial(void);
};
#endif // DATA_H
