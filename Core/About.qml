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
        source: "images/widget/about.png"
        MouseArea{
            anchors.fill: parent
        }
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
            onReleased:{parent.source="images/widget/c-r.png";bg.state="rollup"}
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
        onTriggered:bg.state=""
    }
}
