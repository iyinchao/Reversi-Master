import Qt 4.7

Rectangle {
    id:scene
    width: 60
    height: 60
    color: "#00000000"
    property int str:-1
    signal open();
    signal close();
    //Following is the generator of flicker
    Item{
    id:high
      Timer {
          id:t2
          interval: 800; running: false; repeat: true
          onTriggered: {str=-1}
      }
      Timer{
          id:t1
          interval: 400; running: false; repeat: true
          onTriggered: {str++;img2.opacity=str}
      }
    }
    Image{
        id:img
        source: "images/drawer/o-r.png"
    }
    Image{
        id:img2
        source: "images/drawer/ho.png"
        opacity: 0
        Behavior on opacity{
            NumberAnimation{}
        }
    }
    MouseArea{
        id:bt
        anchors.fill: parent
    }
    states: [
        State {
            name: "normal"
            PropertyChanges {
                target: bt;
                onPressed:img.source="images/drawer/o-d.png";
                onReleased:{img.source="images/drawer/o-r.png";scene.open()}
            }
            PropertyChanges {
                target: img;
                source:"images/drawer/o-r.png";
            }
            PropertyChanges {target: t1;running:false;}
            PropertyChanges {target: t2;running:false;}
            PropertyChanges {target: img2;opacity:0;}
        },
        State {
            name: "close"
            PropertyChanges {
                target: bt;
                onPressed:img.source="images/drawer/c-d.png";
                onReleased:{img.source="images/drawer/c-r.png";scene.close()}
            }
            PropertyChanges {
                target: img;
                source:"images/drawer/c-r.png";
            }
            PropertyChanges {target: t1;running:false;}
            PropertyChanges {target: t2;running:false;}
            PropertyChanges {target: img2;opacity:0;}
        },
        State {
            name: "highlight"
            PropertyChanges {
                target: t1;
                running:true;
            }
            PropertyChanges {
                target: t2;
                running:true;
            }
            PropertyChanges {
                target: bt;
                onPressed:{img2.source="";img.source="images/drawer/o-d.png"}
                onReleased:{img.source="images/drawer/o-r.png";img2.source= "images/drawer/ho.png";scene.open()}
            }
        }
    ]
    state: "normal"
}
