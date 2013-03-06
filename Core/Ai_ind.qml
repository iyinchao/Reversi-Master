import QtQuick 1.0

Rectangle {
    id:scene
    width: 250
    height: 120
    color: "#00000000"
    property alias aii_s:scene.state
    Image {
        id: ai_on
        source: "images/peer/ai_on.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin:27
        visible: false
    }
    Image{
        id:ai_run
        source: "images/peer/ai_run.png"
        anchors.centerIn: ai_on
        visible: false
    }
    states: [
        State{
            name:"off"
            PropertyChanges {target:ai_on;visible:false;anchors.bottomMargin: 27}
            PropertyChanges {target:ai_run;visible:false}
        },
        State{
            name:"on"
            PropertyChanges {target:ai_on;visible:true;anchors.bottomMargin: 0}
            PropertyChanges {target:ai_run;visible:false}
        },
        State {
            name: "run"
            PropertyChanges {target:ai_on;visible:true;anchors.bottomMargin: 0}
            PropertyChanges {target:ai_run;visible:true}
        }
    ]
    state: "off"
}
