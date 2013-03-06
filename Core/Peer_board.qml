import QtQuick 1.0

Rectangle {
    id:scene
    width: 250
    height: 670
    color: "#00000000"
    property alias blackname: n_b.text
    property alias whitename: n_w.text
    property alias blackscore: s_b.text
    property alias whitescore: s_w.text
    property alias pb_state: scene.state
    property alias aiis: aind.aii_s
    function initial(){
        blackname="Player 1"
        whitename="Player 2"
        blackscore="2"
        whitescore="2"
        pb_state="out"
    }
    Item{
        id:black
        width: 250
        height: 150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 75
        Image{
            source: "images/peer/peer-b.png"
        }
        Text {
            id: n_b
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 21
            anchors.top: parent.top
            anchors.topMargin: 40
            width: 150
            height: 60
            text: "Player 1"
            font.family: "黑体"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            elide: Text.ElideRight
        }
        Text {
            id: s_b
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 21
            anchors.top: parent.top
            anchors.topMargin: 70
            width: 100
            height: 60
            text: "0"
            font.family: "黑体"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 43
        }
    }
    Item{
        id:white
        width: 250
        height: 150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 75
        Ai_ind{
            id:aind
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -25
        }
        Image{
            source: "images/peer/peer-w.png"
        }
        Text {
            id: n_w
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 21
            anchors.top: parent.top
            anchors.topMargin: 40
            width: 150
            height: 60
            text: "Player 2"
            font.family: "黑体"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize:20
            elide: Text.ElideRight
        }
        Text {
            id: s_w
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 21
            anchors.top: parent.top
            anchors.topMargin: 70
            width: 100
            height: 60
            text: "0"
            font.family: "黑体"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 43
        }
    }
   states: [
        State {
            name: "out"
            PropertyChanges {target: black;anchors.topMargin: -150}
            PropertyChanges {target: white;anchors.bottomMargin: -150}
        },
        State {
            name: "in"
            PropertyChanges {target: black;anchors.topMargin: 75}
            PropertyChanges {target: white;anchors.bottomMargin: 75}
        }
    ]
    transitions: [
        Transition {
            reversible: true
            NumberAnimation { target: black; property: "anchors.topMargin"; easing.type: Easing.OutQuad;  duration: 300 }
            NumberAnimation { target: white; property: "anchors.bottomMargin"; easing.type: Easing.OutQuad;  duration: 300 }
        }
    ]
    state: "out"
}
