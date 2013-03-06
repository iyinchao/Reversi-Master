import QtQuick 1.0
Rectangle {
    width: 980
    height: 670
    id:scene
    /***********************function area*************************/
    //for help and about screen
    property string url: ""
    function loadsth(){
        if(load.status==Loader.Ready){
            load.source="";
            load.source=url;
        }else{
            load.source=url;
        }
    }
    //initial function
    function initial(){
        bd.initial()
        pb.initial()
        sh.initial()
        indi.istate="vs"
    }
    /************************ visual ****************************/
    Rectangle{
        id:domain
        width: 980
        height: 670
        Behavior on x{
            NumberAnimation{duration: 600; easing.type: Easing.OutQuint}
        }
    Image {
        id:bg
        width: 980
        height: 670
        source: "images/BG/2.png"
        anchors.centerIn: parent
    }
    Image{
        id:board_bg
        width: 670
        height: 670
        source: "images/main/board.png"
        anchors.verticalCenter: domain.verticalCenter
        anchors.left: domain.left
    }
    Board{
        id:bd
        anchors.left: parent.left
        anchors.leftMargin: 38
        anchors.top: parent.top
        anchors.topMargin: 38
        onAirun: {pb.aiis="run"}
        onAicomp: {pb.aiis="on"}
        onBblock: {sh.blockmb=true;sh.blockmh=true}
        onBrelease: {sh.blockmb=false;sh.blockmh=false}
        onColorupdate: {indi.istate=_color;console.log("changed to:"+_color)}
        onScoreupdate: {pb.blackscore=b;pb.whitescore=w}
        onWined: {
            sh.sheetstate="sheet_off"
            if(_color==1) indi.istate="bw"
            if(_color==2) indi.istate="ww"
            if(_color==3) indi.istate="dr"
            dr.btstate="highlight"
            dr.blockmb=true
            dr.blockmh=true
            sh.blockmb=false
            sh.blockmh=false
            if(bd.aflag){
                pb.aiis="on"
            }
        }
        onPassed: {
            sh.blockmb=true;
            sh.blockmh=true;
            if(_color==1){
                sh.sheetstate="pass_b_on"
            }
            if(_color==2){
                sh.sheetstate="pass_w_on"
            }
        }
    }
    Peer_board{
        id:pb
        anchors.verticalCenterOffset: 0
        anchors.rightMargin: 48
        anchors.verticalCenter: domain.verticalCenter
        anchors.right: domain.right
    }
    Indicator{
        id:indi
        anchors.verticalCenterOffset: 0
        anchors.rightMargin: 70
        anchors.verticalCenter: domain.verticalCenter
        anchors.right: domain.right

    }
   }
    Item{
        width: 980
        height: 670
        x:0;y:0;z:3
        id:load_widget
        Loader{
         z:3
         width: 980
         height: 670
         id:load
         source: "Splash.qml"
        }
        Timer{
            id:loadtimer
            interval:3500
            onTriggered: {load.source="";loadtimer.interval= 10;initial()}
            running: true
            repeat: false
        }
    }
   Drawer{
       id:dr
       z:1
       anchors.left: domain.left
       anchors.top: domain.top
       onInit: {domain.x=0;darkmask=0;blockmb=false;blockmh=false;btstate="normal";initial();}
       onRematch: {
           domain.x=0;darkmask=0;
           blockmb=false;blockmh=false;
           btstate="normal";
           bd.rematch();
           indi.istate="1";
           pb.blackscore=2;pb.whitescore=2;
       }
       onAbout: { url="About.qml";loadsth()}
       onHelp:{ url="Help.qml";loadsth()}
       onOpen:{domain.x=-310;darkmask=0.55;blockmb=true;blockmh=true;btstate="close"}
       onClose: {
           domain.x=0;
           darkmask=0;
           btstate="normal"
           if(indi.istate=="1"||indi.istate=="2"){
                blockmb=false;
                blockmh=false;
           }
       }
   }
   Sheet{
       id:sh
       z:2
       onMs:{
           bd.aiflag(_mode);
           pb.pb_state="out"
           if(bd.aflag==1){
               pb.aiis="on"
           }else{
               pb.aiis="off"
           }
       }
       onHelp:{ url="Help.qml";loadsth()}
       onPassname: {pb.blackname=b;pb.whitename=w;pb.state="in";indi.istate="1"}
       onCchange:{
           if(indi.istate==1||indi.istate==2) bd.c_update()
       }
       onPsok: {
           sh.blockmb=false
           sh.blockmh=false
           if(bd.aflag==1&&_color==1){
               pb.aiis="run"
               bd.aiinje();
           }else if(bd.aflag==1&&_color==2){
               pb.aiis="on";
           }
       }
   }
}

