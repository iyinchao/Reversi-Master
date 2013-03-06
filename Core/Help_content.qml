import QtQuick 1.0

 Rectangle {
     width: 980
     height: 550
     color: "#00000000"
     property alias content:picture.source;
     property alias barstate: view.state;
     // Create a flickable to view a large image.
     Flickable {
         id: view
         anchors.fill: parent
         contentWidth: picture.width
         contentHeight: picture.height
         maximumFlickVelocity : 1500
         flickableDirection :Flickable.VerticalFlick
         //visibleArea.heightRatio :40
        // boundsBehavior:Flickable.StopAtBounds
         Image {
             id: picture
             source: "images/widget/help_buffer.png"
             asynchronous: true
         }
         MouseArea{
             id:wiki
             anchors.left: picture.left
             anchors.leftMargin: 323
             anchors.top: picture.top
             anchors.topMargin: 476
             width: 250
             height: 20
             onClicked: {Qt.openUrlExternally("http://zh.wikipedia.org/wiki/黑白棋")}
         }
         MouseArea{
             id:baidu
             anchors.left: picture.left
             anchors.leftMargin: 323
             anchors.top: picture.top
             anchors.topMargin: 498
             width: 300
             height: 20
             onClicked: {Qt.openUrlExternally("http://baike.baidu.com/view/24242.htm")}
         }
         // Only show the scrollbars when the view is moving.
         states: State {
             name: "ShowBars"
             when: view.movingVertically || view.movingHorizontally
             PropertyChanges { target: verticalScrollBar; opacity: 1 }
         }

         transitions: Transition {
             NumberAnimation { properties: "opacity"; duration: 400 }
         }
     }
     Image {
         id:mask
         width: 980
         height: 670
         anchors.bottom: parent.bottom
         source: "images/widget/help_mask.png"
     }
     // Attach scrollbars to the right and bottom edges of the view.
     ScrollBar {
         id: verticalScrollBar
         width: 10; height: view.height-50
         anchors.right: view.right
         anchors.rightMargin: 15
         anchors.verticalCenter: view.verticalCenter
         anchors.verticalCenterOffset: -35
         opacity: 0.0
         orientation: Qt.Vertical
         position: view.visibleArea.yPosition
         pageSize: view.visibleArea.heightRatio
     }

 }
