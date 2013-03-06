import Qt 4.7
Rectangle {
    id:dr
    width: 1290
    height: 670
    color: "#00000000"
    signal about();
    signal exit();
    signal help();
    signal open();
    signal close();
    signal init();
    signal rematch();
    property alias darkmask:darkfade.opacity
    property alias blockmb:blocker.enabled
    property alias blockmh:blocker.hoverEnabled
    property alias btstate:bt.state
    MouseArea{
        id:blocker
        width: 980
        height: 670
        anchors.top: parent.top
        anchors.left: parent.left
        hoverEnabled: false
        enabled: false
        Rectangle{
            id:darkfade
            color: "#000000"
            opacity: 0.0
            anchors.fill: parent
            Behavior on opacity {
                NumberAnimation{ duration: 400;easing.type: Easing.OutQuint}
            }
        }
    }
    Image{
        source: "images/drawer/drawer.png"
        anchors.left: blocker.right
        anchors.top: parent.top
    }
    //initial
    Image{
        id:ini
        source: "images/drawer/inibt-r.png"
        anchors.left: blocker.right
        anchors.leftMargin: 41
        anchors.top: parent.top
        anchors.topMargin: 65
        MouseArea{
            anchors.fill: parent
            onPressed: parent.source="images/drawer/inibt-d.png"
            onReleased: {parent.source="images/drawer/inibt-r.png";init()}
        }
    }
    //again
    Image{
        id:again
        source: "images/drawer/againbt-r.png"
        anchors.left: blocker.right
        anchors.leftMargin: 41
        anchors.top: parent.top
        anchors.topMargin: 204
        MouseArea{
            anchors.fill: parent
            onPressed: parent.source="images/drawer/againbt-d.png"
            onReleased: {parent.source="images/drawer/againbt-r.png";rematch()}
        }
    }
    //help
    Image{
        id:help
        source: "images/drawer/helpbt-r.png"
        anchors.left: blocker.right
        anchors.leftMargin: 41
        anchors.top: parent.top
        anchors.topMargin: 424
        MouseArea{
            anchors.fill: parent
            onPressed: parent.source="images/drawer/helpbt-d.png"
            onReleased: {parent.source="images/drawer/helpbt-r.png";dr.help();}
        }
    }
    //about
    Image{
        id:about
        source: "images/drawer/aboutbt-r.png"
        anchors.left: blocker.right
        anchors.leftMargin: 41
        anchors.top: parent.top
        anchors.topMargin: 494
        MouseArea{
            anchors.fill: parent
            onPressed: parent.source="images/drawer/aboutbt-d.png"
            onReleased: {parent.source="images/drawer/aboutbt-r.png";dr.about();}
        }
    }
    //exit
    Image{
        id:exit
        source: "images/drawer/exitbt-r.png"
        anchors.left: blocker.right
        anchors.leftMargin: 41
        anchors.top: parent.top
        anchors.topMargin: 564
        MouseArea{
            anchors.fill: parent
            onPressed:parent.source="images/drawer/exitbt-d.png"
            onReleased: {parent.source="images/drawer/exitbt-r.png";  Qt.quit()}
        }
    }
    Drawer_bt {
        id: bt
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: blocker.right
        anchors.rightMargin: -3
        onOpen: dr.open()
        onClose: dr.close()
    }
}
