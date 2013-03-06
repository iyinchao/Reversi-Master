import Qt 4.7
Rectangle{
id:sp
width: 980
height: 670
color: "#00000000"
Image {
    id: splashbg
    source: "images/main/splash.png"
}
/*Following is the player of frame images,
  use "property variant"array to hold image
  location.second timer is used to move frame
  forward and first timer form a loop
  */
Image {
  anchors.centerIn: splashbg;
  anchors.horizontalCenterOffset: 25
  anchors.verticalCenterOffset: 220
  id: psbar
 property variant frames:[ "images/psbar/1.png",
                           "images/psbar/2.png",
                           "images/psbar/3.png",
                           "images/psbar/4.png",
                           "images/psbar/5.png",
                           "images/psbar/6.png",
                           "images/psbar/7.png"]
  Timer {
      interval: 280; running: true; repeat: true
      onTriggered: {spt1.str=-1}
  }
  Timer{
      id:spt1
      interval: 40; running: true; repeat: true
      property int str:-1;
      onTriggered: {str++;psbar.source=psbar.frames[str]}
  }
}
Timer{
    id:splashtimer
    interval: 2500
    running: true
    onTriggered:sp.state="rollup"
}
//Block mouse action
MouseArea{
    anchors.fill: parent
    enabled: true
    hoverEnabled: true
}
states: [
    State {
        name: "rollup"
        PropertyChanges {target: splashbg; x: 0; y: -718}
    }
]
transitions:Transition {
    PropertyAnimation {target: splashbg; easing.type: Easing.InCubic; duration: 700;properties: "y"}
    }
}

