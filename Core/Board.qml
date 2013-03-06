import QtQuick 1.0
import "plugins"
Rectangle {
    width: 588
    height: 588
    color: "#00000000"
    id:scene
    /******************* Logic area ***********************/
    Logic{
        id:logiccore
        onBoardupdate: matrix[_index].svalue=_color
        onDelay: {bblock();delay.start();}
        onDelayprev: {bblock();delayprev.start();}
        onWin:wined(_color)
        onPass: passed(_color)
        onLastmark: {lm.lmshow=true;lm.flicker();lm.anchors.centerIn=matrix[_index]}
        onDelaynext: {delaynext.start()}
    }
    function validate(i){
        if(matrix[i].svalue==0)
        if(logiccore.validate(i,logiccore.getcolor())){
            matrix[i].bs="11"
        }else{
            matrix[i].bs="00"
        }
    }
    function initial(){
        logiccore.initial()
        aflag=0
        lm.lmshow=false;
    }
    function rematch(){
        logiccore.rematch()
        lm.lmshow=false;
    }
    function aiflag(i){
        logiccore.setaiflag(i)
        aflag=i
        console.log(aflag)
    }
    function c_update(){
        colorupdate(logiccore.getcolor())
    }
    function aiinje(){
        logiccore.ainject();
    }
    /********************************************************/
    signal colorupdate(int _color);
    signal scoreupdate(int b,int w);
    signal bblock();
    signal brelease();
    signal wined(int _color);
    signal passed(int _color);
    signal airun();
    signal aicomp();
    property int aflag;
    property variant matrix: [b00,b00,b00,b00,b00,b00,b00,b00,b00,b00,
                              b00,b11,b12,b13,b14,b15,b16,b17,b18,b00,
                              b00,b21,b22,b23,b24,b25,b26,b27,b28,b00,
                              b00,b31,b32,b33,b34,b35,b36,b37,b38,b00,
                              b00,b41,b42,b43,b44,b45,b46,b47,b48,b00,
                              b00,b51,b52,b53,b54,b55,b56,b57,b58,b00,
                              b00,b61,b62,b63,b64,b65,b66,b67,b68,b00,
                              b00,b71,b72,b73,b74,b75,b76,b77,b78,b00,
                              b00,b81,b82,b83,b84,b85,b86,b87,b88,b00,
                              b00,b00,b00,b00,b00,b00,b00,b00,b00,b00]
    //set a timer to make room for animation to run,when the animations are done
    //continue global refresing and operating
    Timer{
        id:delay
        running:false;repeat:false;interval:400;
        onTriggered: {
            colorupdate(logiccore.getcolor())
            scoreupdate(logiccore.exact(1),logiccore.exact(2))
            brelease();
            if(!logiccore.wintest()){
                if(logiccore.passtest(logiccore.getcolor())){//not win&pass(white)
                    if(logiccore.passtest(logiccore.getcolor())){//double pass occurs,end immediately
                        if(logiccore.exact(1)>logiccore.exact(2)){
                            wined(1)
                        }else if(logiccore.exact(1)<logiccore.exact(2)){
                            wined(2)
                        }else{
                            wined(0)
                        }
                    }
                }
            }
        }
    }
    Timer{
        id:delayprev
        running:false;repeat:false;interval:400;
        onTriggered: {
            colorupdate(logiccore.getcolor())
            scoreupdate(logiccore.exact(1),logiccore.exact(2))
            airun()
            if(!logiccore.wintest()){
                if(logiccore.passtest(logiccore.getcolor())){//not win&pass(white)
                    aicomp();
                    if(logiccore.passtest(logiccore.getcolor())){//double pass occurs,end immediately
                        if(logiccore.exact(1)>logiccore.exact(2)){
                            wined(1)
                        }else if(logiccore.exact(1)<logiccore.exact(2)){
                            wined(2)
                        }else{
                            wined(0)
                        }
                    }
                }else{
                    aicache1.start()
                }
            }
        }
    }
    Timer{
        id:delaynext
        running:false;repeat:false;interval:400;
        onTriggered: {
            colorupdate(logiccore.getcolor())
            scoreupdate(logiccore.exact(1),logiccore.exact(2))
            aicomp()
            brelease()
            if(!logiccore.wintest()){
                if(logiccore.passtest(logiccore.getcolor())){//after white stone put,in case of win combine with pass
                    if(logiccore.passtest(logiccore.getcolor())){//in case of double win
                        if(logiccore.exact(1)>logiccore.exact(2)){
                            wined(1)
                        }else if(logiccore.exact(1)<logiccore.exact(2)){
                            wined(2)
                        }else{
                            wined(0)
                        }
                    }
                }
            }
        }
    }
    Timer{
        id:aicache1
        running: false;repeat:false;interval:250
        onTriggered:logiccore.ainject();  /***/
    }
    //unvisible occupyer
    Block{
        id:b00
        anchors.top:scene.bottom
        anchors.right: scene.left
        opacity: 0
        svalue:3
    }

   //board matrix
    Grid{
        id:matrixgrp
        columns: 8
        spacing: 4
        //row 1
        Block{id:b11;index: 11;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b12;index: 12;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b13;index: 13;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b14;index: 14;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b15;index: 15;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b16;index: 16;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b17;index: 17;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b18;index: 18;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 2
        Block{id:b21;index: 21;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b22;index: 22;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b23;index: 23;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b24;index: 24;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b25;index: 25;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b26;index: 26;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b27;index: 27;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b28;index: 28;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 3
        Block{id:b31;index: 31;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b32;index: 32;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b33;index: 33;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b34;index: 34;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b35;index: 35;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b36;index: 36;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b37;index: 37;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b38;index: 38;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 4
        Block{id:b41;index: 41;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b42;index: 42;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b43;index: 43;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b44;index: 44;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b45;index: 45;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b46;index: 46;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b47;index: 47;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b48;index: 48;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 5
        Block{id:b51;index: 51;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b52;index: 52;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b53;index: 53;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b54;index: 54;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b55;index: 55;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b56;index: 56;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b57;index: 57;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b58;index: 58;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 6
        Block{id:b61;index: 61;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b62;index: 62;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b63;index: 63;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b64;index: 64;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b65;index: 65;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b66;index: 66;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b67;index: 67;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b68;index: 68;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 7
        Block{id:b71;index: 71;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b72;index: 72;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b73;index: 73;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b74;index: 74;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b75;index: 75;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b76;index: 76;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b77;index: 77;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b78;index: 78;onVali:validate(_index);onInje:logiccore.inject(_index)}
        //row 8
        Block{id:b81;index: 81;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b82;index: 82;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b83;index: 83;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b84;index: 84;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b85;index: 85;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b86;index: 86;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b87;index: 87;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Block{id:b88;index: 88;onVali:validate(_index);onInje:logiccore.inject(_index)}
        Lastmark{
            id:lm
            lmshow: false
        }
    }
}
