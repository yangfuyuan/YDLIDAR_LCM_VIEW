/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#ifndef QLCMHANDLER_H
#define QLCMHANDLER_H

#include <QThread>
#include <lcm/lcm-cpp.hpp>
#include "lcmtypes/lidar_laser_t.hpp"

#include <stdio.h>
#include <cmath>
#include <memory>


class QLcmHandler : public QThread
{
    Q_OBJECT
private:
    void run();
    lcm::LCM *m_lcm;

    bool m_running;
public:
    QLcmHandler();
    ~QLcmHandler() {}

    void handleMessage(const lcm::ReceiveBuffer* rbuf,
                  const std::string& chan,
   const lcmtypes::lidar_laser_t* msg);

Q_SIGNALS:
    void scanData(const lcmtypes::lidar_laser_t&);

public slots:
   void Close();

};

#endif // QLCMHANDLER_H
