import Qt 4.7
Rectangle{
width: 980
height: 670
Image{
    width: 980
    height: 670
    anchors.centerIn: parent
    source: "images/bg/2.png"
}

Image{
    source: "images/main/board.png"
}

property variant st:["sheet_off","modeselect_on","dual_name_on","solo_name_on","pass_b_on","pass_w_on"]
property variant pb:["in","out"]
property int index: 0
function loop(){
index++
    if(index>5){
        index=0
    }
}
Sheet {
    id: s
    x: 0
    y: 0
    z: 1
}
Rectangle{
    anchors.centerIn: parent
    width: 50
    height: 50
    color:"blue"
    MouseArea{
        anchors.fill: parent
        onClicked: {loop();console.log(index);s.sheet_p=st[index];pt.state=pb[index]}
    }
}
Rectangle{
    anchors.centerIn: parent
    anchors.horizontalCenterOffset: 60
    width: 50
    height: 50
    color:"red"
    MouseArea{
        anchors.fill: parent
       // onClicked: s.sheet_block=true//s.sheet_state="sheet_off"
       // onClicked: {loop();console.log(index);s.sheet_p=st[index]}
    }
}

Peer_board {
    id: pt
    x: 679
    y: 0
}
}
