
/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include <QApplication>
#include <QCoreApplication>
#include <QTextCodec>
#include "mainwindow.h"

int main( int argc, char **argv )
{
    QApplication a( argc, argv );

    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF8"));
    a.setWindowIcon(QPixmap( ":/images/app.png" ));
    QCoreApplication::setApplicationName("Lidar Scanning");
    QApplication::setApplicationVersion("1.0.0");

    MainWindow mainWindow;

    mainWindow.showMaximized();

    return a.exec();
}
