/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <iomanip>
#include <QMetaType>

Q_DECLARE_METATYPE(lcmtypes::lidar_laser_t)

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    setWindowTitle("Scanning");
    this->setStyleSheet("background:black");

    d_plotWindow = new PlotWindow( this );
    setCentralWidget( d_plotWindow );



    qRegisterMetaType<lcmtypes::lidar_laser_t>();

    lcmhandler = new QLcmHandler();
    connect(lcmhandler, SIGNAL(scanData(lcmtypes::lidar_laser_t)), this, SLOT(onscanData(lcmtypes::lidar_laser_t)), Qt::QueuedConnection);
    connect(this, SIGNAL(stop()), lcmhandler, SLOT(Close()), Qt::QueuedConnection);

    connect( ui->actionmirror, SIGNAL( triggered() ),
        d_plotWindow->plot(), SLOT( mirror() ) );



}

MainWindow::~MainWindow()
{

    lcmhandler->deleteLater();
    delete ui;
}


void MainWindow::on_actionGrid_triggered(bool checked)
{
     d_plotWindow->plot()->showGrid(!checked);
     ui->actionGrid->setIcon(!checked?QIcon(":/images/grid-off.png"):QIcon(":/images/grid-on.png"));
     ui->actionGrid->setToolTip(checked?"view Grid":"hide Grid");
}

void MainWindow::on_actionconnnect_triggered(bool checked)
{
    if(checked){
        if(!lcmhandler->isRunning()){
            lcmhandler->start();
            ui->actionconnnect->setIcon(QIcon(":/images/Pause.png"));
            ui->actionconnnect->setToolTip("disconnect");
        }

    }else{
        while (lcmhandler->isRunning()) {
            emit stop();
            QCoreApplication::processEvents();//
            lcmhandler->quit();
            lcmhandler->wait(1000);
            lcmhandler->exit();
        }

        ui->actionconnnect->setIcon(QIcon(":/images/play.png"));
        ui->actionconnnect->setToolTip("connect");
    }

}

void MainWindow::on_actionrotate_triggered()
{


}

void MainWindow::on_actionmirror_triggered()
{

}


void MainWindow::onscanData(const lcmtypes::lidar_laser_t &scan)
{
    if(d_plotWindow->plot()->getCount() ==1440 &&scan.ranges.size() <= 720 ||d_plotWindow->plot()->getCount()==720 && scan.ranges.size() >720 ){
        if(scan.ranges.size() <=720)
            d_plotWindow->resetPloat(720);
        else
            d_plotWindow->resetPloat(1440);
        return;
    }

    int size = scan.ranges.size();

    QVector<QPointF> m_cartesian;
    m_cartesian.resize(size);
    double m_distances;
    double m_angle;
    for(int i = 0; i < size; i++) {
           m_distances =scan.ranges[i]*1000.0;
           m_angle = scan.angle_min + i*scan.angle_increment;
           if(m_angle >2*M_PI)
               m_angle -=2*M_PI;
           m_cartesian[i] = QPointF(m_angle, m_distances);
    }
    d_plotWindow->plot()->updata(m_cartesian);
    d_plotWindow->plot()->replot();


}


