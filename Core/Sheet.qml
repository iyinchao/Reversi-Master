import Qt 4.7
Rectangle {
    property alias sheetstate:sp.state
    property alias blockmb:sheet_blocker.enabled
    property alias blockmh:sheet_blocker.hoverEnabled
    property alias st:sp.st
    property alias dt_b:sp.dt_b
    property alias dt_w:sp.dt_w
    signal ms(int _mode)
    signal passname(string b,string w)
    signal cchange()
    signal psok(int _color);
    signal help()
    function initial(){
        sheet_blocker.enabled=true
        sheet_blocker.hoverEnabled=true
        delay.start()
    }
    Timer{
      id:delay
      running: false;repeat: false;interval: 300
      onTriggered: {sp.state="modeselect_on";st="Player";dt_b="Player 1";dt_w="Player 2"}
    }
    width: 980
    height: 670
    color: "#00000000"
    MouseArea{
        id:sheet_blocker
        anchors.fill: parent
        enabled:true
        hoverEnabled:true
    }
    Sheet_page {
        id: sp
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        onModes: {
            ms(_m)
            if(_m==0) sp.state="dual_name_on";
            if(_m==1)sp.state="solo_name_on"
        }
        onHelps: {help()}
        onOks: {
            sheet_blocker.enabled=false
            sheet_blocker.hoverEnabled=false
            if(_m==1){
                passname(sp.st,"Charles")
            }
            if(_m==2){
                passname(sp.dt_b,sp.dt_w)
            }
            sheetstate="sheet_off"
        }
        onPsoks: {
            cchange()
            psok(_c)
            sheetstate="sheet_off"
        }
    }
}

