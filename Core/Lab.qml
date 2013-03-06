import Qt 4.7
//◊‘∂®“Âsignal
/*Rectangle {
    property variant st:["normal","close","highlight"]
    property int index: 0
    function loop(){
    index++
        if(index>2){
            index=0
        }
    }
    width: 980
    height: 670
    Rectangle{
        width: 100
        height: 100
        color:"blue"
        anchors.centerIn: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {loop();console.log(index);db.state=st[index]}
        }
    }

    Drawer_bt {
        id: db
        x: 413
        y: 145
        onOpen:console.log("Open")
        onClose:console.log("Close")
    }
}*/
//≤‚ ‘
/*Rectangle {
    width: 210
    height: 260
    color: "#00000000"

    }
    MouseArea{
        width: 210
        height: 260
        onClicked: {bw.opacity=1;bw.width=210;bw.height=260}
    }
}*/
Item{
Grid{
    columns: 8
    Repeater {
        id:rept
        model: ["dfs",'dfs']
        Text { id:modelData; text: modelData }
    }
}
}

