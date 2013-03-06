import Qt 4.7

Rectangle {
    width: 210
    height: 260
    color: "#00000000"
    id:scene
    property alias istate: scene.state
    //vs
    Image{
        id:vs
        anchors.centerIn: parent
        width: 420
        height: 520
        opacity: 0
        source: "images/ind/vs.png"
        Behavior on width{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on height{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on opacity{
            NumberAnimation{duration:400;easing.type: Easing.OutQuad}
        }
    }
    //bw
    Image{
        id:bw
        anchors.centerIn: parent
        width: 420
        height: 520
        opacity: 0
        source: "images/ind/bw.png"
        Behavior on width{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on height{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on opacity{
            NumberAnimation{duration:400;easing.type: Easing.OutQuad}
        }
    }
    //ww
    Image{
        id:ww
        anchors.centerIn: parent
        width: 420
        height: 520
        opacity: 0
        source: "images/ind/ww.png"
        Behavior on width{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on height{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on opacity{
            NumberAnimation{duration:400;easing.type: Easing.OutQuad}
        }
    }
    //draw
    Image{
        id:dr
        anchors.centerIn: parent
        width: 420
        height: 520
        opacity: 0
        source: "images/ind/draw.png"
        Behavior on width{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on height{
            NumberAnimation{duration:200;easing.type: Easing.OutQuad}
        }
        Behavior on opacity{
            NumberAnimation{duration:400;easing.type: Easing.OutQuad}
        }
    }
    //ib
    Image{
        id:ib
        anchors.centerIn: parent
        width: 210
        height: 260
        opacity: 0
        source: "images/ind/i-b.png"
        Behavior on opacity{
            NumberAnimation{duration:300;easing.type: Easing.OutQuad}
        }
    }
    //iw
    Image{
        id:iw
        anchors.centerIn: parent
        width: 210
        height: 260
        opacity: 0
        source: "images/ind/i-w.png"
        Behavior on opacity{
            NumberAnimation{duration:300;easing.type: Easing.OutQuad}
        }
    }
    states: [
        State {
            name: "vs"
            PropertyChanges {target:vs;width:210;height:260;opacity:1 }
            PropertyChanges {target:bw;width:420;height:520;opacity:0 }
            PropertyChanges {target:ww;width:420;height:520;opacity:0 }
            PropertyChanges {target:dr;width:420;height:520;opacity:0 }
            PropertyChanges {target:ib;opacity:0 }
            PropertyChanges {target:iw;opacity:0 }
        },
        State {
            name: "bw"
            PropertyChanges {target:vs;width:420;height:520;opacity:0 }
            PropertyChanges {target:bw;width:210;height:260;opacity:1 }
            PropertyChanges {target:ww;width:420;height:520;opacity:0 }
            PropertyChanges {target:dr;width:420;height:520;opacity:0 }
            PropertyChanges {target:ib;opacity:0 }
            PropertyChanges {target:iw;opacity:0 }
        },
        State {
            name: "ww"
            PropertyChanges {target:vs;width:420;height:520;opacity:0 }
            PropertyChanges {target:bw;width:420;height:520;opacity:0 }
            PropertyChanges {target:ww;width:210;height:260;opacity:1 }
            PropertyChanges {target:dr;width:420;height:520;opacity:0 }
            PropertyChanges {target:ib;opacity:0 }
            PropertyChanges {target:iw;opacity:0 }
        },
        State {
            name: "dr"
            PropertyChanges {target:vs;width:420;height:520;opacity:0 }
            PropertyChanges {target:bw;width:420;height:520;opacity:0 }
            PropertyChanges {target:ww;width:420;height:520;opacity:0 }
            PropertyChanges {target:dr;width:210;height:260;opacity:1 }
            PropertyChanges {target:ib;opacity:0 }
            PropertyChanges {target:iw;opacity:0 }
        },
        State {
            name: "1"
            PropertyChanges {target:vs;width:420;height:520;opacity:0 }
            PropertyChanges {target:bw;width:420;height:520;opacity:0 }
            PropertyChanges {target:ww;width:420;height:520;opacity:0 }
            PropertyChanges {target:dr;width:420;height:520;opacity:0 }
            PropertyChanges {target:ib;opacity:1 }
            PropertyChanges {target:iw;opacity:0 }
        },
        State {
            name: "2"
            PropertyChanges {target:vs;width:420;height:520;opacity:0 }
            PropertyChanges {target:bw;width:420;height:520;opacity:0 }
            PropertyChanges {target:ww;width:420;height:520;opacity:0 }
            PropertyChanges {target:dr;width:420;height:520;opacity:0 }
            PropertyChanges {target:ib;opacity:0 }
            PropertyChanges {target:iw;opacity:1 }
        }
    ]
    state: ""
}
