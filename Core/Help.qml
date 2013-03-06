import Qt 4.7
Rectangle {
    id:bg
    width: 980
    height: 670
    color: "#00000000"
    Image{
        id:scene
        width: 980
        height: 718
        source: "images/widget/help_bg.png"
        MouseArea{
            anchors.fill: parent

        }
    }
    Help_content{
        id:hc
       anchors.bottom:scene.bottom
       anchors.bottomMargin: 48
       //anchors.verticalCenter: scene.verticalCenter
    }
    Image{
        width: 60
        height: 60
        anchors.rightMargin: 22
        anchors.topMargin: 21
        anchors.right: scene.right
        anchors.top: scene.top
        source: "images/widget/c-r.png"
        MouseArea{
            anchors.fill: parent
            onPressed: parent.source="images/widget/c-d.png"
            onReleased:{
                parent.source="images/widget/c-r.png";
                bg.state="rollup";
                hc.content="images/widget/help_buffer.png";
                hc.barstate=""
            }
        }
    }

    states: [
        State {
            name: "rollup"
            PropertyChanges {target: scene;x:0;y:-718}
        }
    ]
    transitions:[
        Transition {
            from: "rollup";to:""
            PropertyAnimation {target: scene; easing.amplitude: 0.5; easing.type: Easing.OutBounce; duration: 700;properties: "y"}
        },
        Transition {
            from: "";to:"rollup"
            PropertyAnimation {target: scene; easing.type: Easing.InQuad; duration: 300;properties: "y"}
        }
    ]
    state:"rollup"
    Timer{
        interval: 10;running: true;repeat: false
        onTriggered:{bg.state=""}
    }
    Timer{
        interval:750;running: true;repeat: false
        onTriggered: {hc.content="images/widget/help_content.png"}
    }
}
