import Qt 4.7

Rectangle {
    id:scene
    width: 500
    height: 200
    color: "#00000000"
    property alias st:solo_text.text
    property alias dt_b:dual_text_b.text
    property alias dt_w:dual_text_w.text
    signal modes(int _m)
    signal helps()
    signal unblock()
    signal oks(int _m)
    signal psoks(int _c)
    //modeselect
   Item{
        id:modeselect
        width: 500
        height: 200
        anchors.centerIn: parent
        Image{
           source:  "images/sheet/mode_select.png"
        }
        Image {
            id:ms_m
            anchors.left: modeselect.left
            anchors.leftMargin: 110
            anchors.verticalCenterOffset: -3
            anchors.verticalCenter: modeselect.verticalCenter
            source: "images/sheet/mode-m-r.png"
            MouseArea{
                anchors.fill: parent
                onPressed: parent.source="images/sheet/mode-m-d.png"
                onReleased: {parent.source="images/sheet/mode-m-r.png";modes(0)}
            }
        }
        Image {
            id:ms_c
            anchors.right: modeselect.right
            anchors.rightMargin: 110
            anchors.verticalCenterOffset: -3
            anchors.verticalCenter: modeselect.verticalCenter
            source: "images/sheet/mode-c-r.png"
            MouseArea{
                anchors.fill: parent
                onPressed: parent.source="images/sheet/mode-c-d.png"
                onReleased: {parent.source="images/sheet/mode-c-r.png";modes(1)}
            }
        }
        Image {
            id: s_help
            width: 43
            height: 42
            anchors.right: modeselect.right
            anchors.rightMargin: 27
            anchors.verticalCenterOffset: 49
            anchors.verticalCenter: modeselect.verticalCenter
            source: "images/sheet/h-r.png"
            MouseArea{
                anchors.fill: parent
                onPressed: parent.source="images/sheet/h-d.png"
                onReleased: {parent.source="images/sheet/h-r.png";helps()}
            }
        }
    }
   //dual_name
   Item{
        id:dual_name
        width: 500
        height: 200
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -200
        opacity: 0
        Image {
            source: "images/sheet/dual_name.png"
        }
        Image {
            id:d_ok
            anchors.right: dual_name.right
            anchors.rightMargin: 49
            anchors.bottom: dual_name.bottom
            anchors.bottomMargin: 57
            source: "images/sheet/okbt-r.png"
            MouseArea{
                anchors.fill: parent
                onPressed: parent.source="images/sheet/okbt-d.png"
                onReleased: {parent.source="images/sheet/okbt-r.png";oks(2)}
            }
        }
       TextInput{
           id:dual_text_b
           anchors.top: dual_name.top
           anchors.topMargin: 51
           anchors.horizontalCenter: dual_name.horizontalCenter
           anchors.horizontalCenterOffset: -32
           width: 235
           height: 23
           text: "Player1"
           font.pointSize: 13
           font.family: "Tahoma"
           selectByMouse: true
       }
       TextInput{
           id:dual_text_w
           anchors.top: dual_name.top
           anchors.topMargin: 118
           anchors.horizontalCenter: dual_name.horizontalCenter
           anchors.horizontalCenterOffset: -32
           width: 235
           height: 23
           text: "Player2"
           font.pointSize: 13
           font.family: "Tahoma"
           selectByMouse: true
       }
    }
   //solo_name
   Item{
       id:solo_name
       width: 500
       height: 200
       anchors.centerIn: parent
       anchors.verticalCenterOffset: -200
       opacity: 0
       Image {
           source: "images/sheet/solo_name.png"
       }
       Image{
           id:s_ok
           anchors.bottomMargin: 114
           anchors.right: solo_name.right
           anchors.rightMargin: 49
           anchors.bottom: solo_name.bottom
           source: "images/sheet/okbt-r.png"
           MouseArea{
               anchors.fill: parent
               onPressed: parent.source="images/sheet/okbt-d.png"
               onReleased: {parent.source="images/sheet/okbt-r.png";oks(1)}
           }
       }
       TextInput{
           id:solo_text
           anchors.top: solo_name.top
           anchors.topMargin: 60
           anchors.horizontalCenter: solo_name.horizontalCenter
           anchors.horizontalCenterOffset: -26
           width: 235
           height: 23
           text: "Player"
           font.pointSize: 13
           font.family: "Tahoma"
           selectByMouse: true
       }
   }
   //pass_b
   Item{
       id:pass_b
       width: 500
       height: 200
       anchors.verticalCenter: parent.verticalCenter
       anchors.verticalCenterOffset: -200
       opacity: 0
       Image {
           source: "images/sheet/pass_b.png"
       }
       Image{
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 82
           source: "images/sheet/psbt-r.png"
           MouseArea{
               anchors.fill: parent
               onPressed: parent.source="images/sheet/psbt-d.png"
               onReleased: {parent.source="images/sheet/psbt-r.png";psoks(1)}
           }
       }
   }
   Item{
       id:pass_w
       width: 500
       height: 200
       anchors.verticalCenter: parent.verticalCenter
       anchors.verticalCenterOffset: -200
       opacity: 0
       Image {
           source: "images/sheet/pass_w.png"
       }
       Image{
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 82
           source: "images/sheet/psbt-r.png"
           MouseArea{
               anchors.fill: parent
               onPressed: parent.source="images/sheet/psbt-d.png"
               onReleased: {parent.source="images/sheet/psbt-r.png";psoks(2)}
           }
       }
   }


   states:[
       State {
       name: "sheet_off"
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: -200;opacity:0}
      },
       State {
       name: "modeselect_on"
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: 0;opacity:1}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: -200;opacity:0}
      },
       State {
       name: "dual_name_on"
       PropertyChanges {target: dual_text_b;focus:true}
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset: 0;opacity:1}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: -200;opacity:0}
      },
       State {
       name: "solo_name_on"
       PropertyChanges {target: solo_text;focus:true}
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: 0;opacity:1}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: -200;opacity:0}
      },
       State {
       name: "pass_b_on"
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset:-200;opacity:0}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: 0;opacity:1}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: -200;opacity:0}
      },
       State {
       name: "pass_w_on"
       PropertyChanges {target: modeselect;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: dual_name;anchors.verticalCenterOffset:-200;opacity:0}
       PropertyChanges {target: solo_name;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_b;anchors.verticalCenterOffset: -200;opacity:0}
       PropertyChanges {target: pass_w;anchors.verticalCenterOffset: 0;opacity:1}
      }
   ]
   transitions: Transition{
       reversible: true
       ParallelAnimation{
          NumberAnimation {property: "anchors.verticalCenterOffset"; duration: 270; easing.type: Easing.OutQuad}
          NumberAnimation {property: "opacity" ; easing.type: Easing.OutQuad;duration: 300}
      }
   }
   //set default
   state: "sheet_off"
}
