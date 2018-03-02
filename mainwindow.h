/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "plotwindow.h"
#include "plot.h"
#include "lcmtypes/lidar_laser_t.hpp"
#include "qlcmhandler.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_actionGrid_triggered(bool checked);
    void on_actionrotate_triggered();
    void on_actionmirror_triggered();
    void onscanData(const lcmtypes::lidar_laser_t& scan);


    void on_actionconnnect_triggered(bool checked);



private:
    Ui::MainWindow *ui;
    PlotWindow *d_plotWindow;

    QLcmHandler *lcmhandler;

Q_SIGNALS:
    void stop();


};

#endif // MAINWINDOW_H
