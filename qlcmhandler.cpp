/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include "qlcmhandler.h"

QLcmHandler::QLcmHandler()
{
    m_lcm = new lcm::LCM();
    m_running = true;

    if(!m_lcm->good())
    {
        ///

    }
   m_lcm->subscribe("scan", &QLcmHandler::handleMessage, this);

}

void QLcmHandler::run()
{
    m_running = true;
    while(m_running&& 0 == m_lcm->handle());
}

void QLcmHandler::Close()
{
    m_running = false;
}

void QLcmHandler::handleMessage(const lcm::ReceiveBuffer *rbuf, const std::string &chan, const lcmtypes::lidar_laser_t *msg)
{
    emit scanData(*msg);
}
