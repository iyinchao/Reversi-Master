#include <QtGui/QApplication>
#include<QWidget>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    viewer.setSource(QUrl("qrc:/Core/main.qml") );
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.showExpanded();
    viewer.setFixedSize(980,670);
    //viewer.setWindowFlags(Qt::CustomizeWindowHint);
    //viewer.show();
    viewer.setWindowTitle("Charles' Reversi Master");
    return app.exec();
}
