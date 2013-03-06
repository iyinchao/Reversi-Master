import QtQuick 1.0

Rectangle {
    width: 70
    height:70
    color: "#00000000"
    property alias lmshow:lmimg.visible
    function flicker(){
        ani.enabled=false;
        lmimg.opacity=0
        t.start()
    }
    Timer{
        id:t
        running: false;repeat: false;interval:100
        onTriggered: {ani.enabled=true;lmimg.opacity=1}
    }
    Image{
        id:lmimg
        width: 70
        height: 70
        source: "images/block/lastmark.png"
        Behavior on opacity{
            id:ani
            NumberAnimation {}
        }
    }
}
