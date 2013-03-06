import QtQuick 1.0
Rectangle {
    id:scene
    width: 70
    height: 70
    color: "#00000000"
    onSvalueChanged:{change();/*console.log(index+" "+svalue)*/}
    property int index;
    property int svalue:0;
    property alias bs:scene.state
    signal vali(int _index);
    signal inje(int _index);
    //change stone conditon
    function change(){
        if(svalue==0){
            bs="0"
            return
        }
        if(bs==0&&svalue==1){
            bs="1"
            return
        }
        if(bs==0&&svalue==2){
            bs="2"
            console.log("index:"+index+"change to white")
            return
        }
        if(bs=="11"&&svalue==1){
            bs="1"
            return
        }
        if(bs=="11"&&svalue==2){
            bs="2"
            return
        }
        if(bs=="1"&&svalue==2){
            b2w();
            return
        }
        if(bs=="2"&&svalue==1){
            w2b();
            return
        }
    }

    //turn stone animation implement(black to white)
    property variant fb2w:[  "images/block/a1.png",
                             "images/block/a2.png",
                             "images/block/a3.png",
                             "images/block/a4.png",
                             "images/block/a5.png"]
    property variant fw2b:[  "images/block/a5.png",
                             "images/block/a4.png",
                             "images/block/a3.png",
                             "images/block/a2.png",
                             "images/block/a1.png"]
    function b2w(){
        tb2w.running=true;
        tb2w1.running=true;
    }
    Timer {
         id:tb2w
         interval: 300; running: false; repeat: false
         onTriggered: {
             tb2w1.frame=-1;
             tb2w.running=false;
             tb2w1.running=false;
             scene.state="2";
             stoneimg.source="images/block/w.png";
         }
     }
    Timer{
         id:tb2w1
         interval: 50; running: false; repeat: true
         property int frame:-1;
         onTriggered: {frame++;stoneimg.source=scene.fb2w[frame]}
     }
     //turn stone animation implement(white to black)
     function w2b(){
         tw2b.running=true;
         tw2b1.running=true;
     }
     Timer {
          id:tw2b
          interval: 300; running: false; repeat: false
          onTriggered: {
              tw2b1.frame=-1;
              tw2b.running=false;
              tw2b1.running=false;
              scene.state="1";
              stoneimg.source="images/block/b.png";
          }
      }
     Timer{
          id:tw2b1
          interval: 50; running: false; repeat: true
          property int frame:-1;
          onTriggered: {frame++;stoneimg.source=scene.fw2b[frame]}
      }

      //validate image
    Image{
        id:vimg
        width:70
        height: 70
        anchors.centerIn: parent
        opacity: 0
        Behavior on opacity{
            NumberAnimation{ duration: 100; easing.type: Easing.InQuad}
        }
    }
    //stone image
    Image{
        id:stoneimg
        width: 125
        height: 125
        anchors.centerIn: parent
        opacity: 0.4
        Behavior on width{
            NumberAnimation{ duration: 130; easing.type: Easing.InQuad}
        }
        Behavior on height{
            NumberAnimation{ duration: 130; easing.type: Easing.InQuad}
        }
        Behavior on opacity{
            NumberAnimation{ duration: 180; easing.type: Easing.OutQuad}
        }
    }
    MouseArea{
        id:receiver
        anchors.fill: parent
        hoverEnabled: true
        enabled: true
        onEntered: {
           vimg.opacity=1
            vali(scene.index)
        }
        onExited: {
            vimg.opacity=0
        }
        onClicked: {
            inje(index);
        }
    }
    //if you put a stone,then block the block
   MouseArea{
        id:blocker
        anchors.fill: parent
        enabled: false
        hoverEnabled: false
    }
    states: [
        //no stone(0)
        State {
            name: "0"
            PropertyChanges {target:vimg;opacity:0}
            //PropertyChanges {target: scene;svalue:0}
        },
        //black(1)
        State{
            name: "1"
            PropertyChanges {target: stoneimg;source:"images/block/b.png";opacity:1;width:70;height:70}
            PropertyChanges {target: blocker;enabled:true;hoverEnabled:true}
            //PropertyChanges {target: scene;svalue:1}
        },
        //white(2)
        State{
            name: "2"
            PropertyChanges {target: stoneimg;source:"images/block/w.png";opacity:1;width:70;height:70}
            PropertyChanges {target: blocker;enabled:true;hoverEnabled:true}
            //PropertyChanges {target: scene;svalue:2}
        },
        //validate false(00)
        State{
            name: "00"
            PropertyChanges {target: vimg;source:"images/block/v-f.png";opacity:1}
            PropertyChanges {target: blocker;enabled:true;hoverEnabled:false}
            //PropertyChanges {target: scene;svalue:0}
        },
        //validate true(11)
        State{
            name: "11"
            PropertyChanges {target: vimg;source:"images/block/v-t.png";opacity:1}
            PropertyChanges {target: blocker;enabled:false;hoverEnabled:false}
            //PropertyChanges {target: scene;svalue:0}
        }
    ]
    state: svalue
}
