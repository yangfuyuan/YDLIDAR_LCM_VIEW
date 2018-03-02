/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include <qwt_scale_engine.h>
#include <qwt_scale_widget.h>
#include <qwt_color_map.h>
#include <qlayout.h>
#include "plot.h"
#include "plotwindow.h"

class ColorMap: public QwtLinearColorMap
{
public:
    ColorMap():
        QwtLinearColorMap( Qt::darkBlue, Qt::yellow )
    {
        addColorStop( 0.05, Qt::blue );
        addColorStop( 0.3, Qt::cyan );
        addColorStop( 0.6, Qt::green );
        addColorStop( 0.98, Qt::red );
    }
};

PlotWindow::PlotWindow( QWidget *parent ):
    QWidget( parent )
{
    d_plot = new Plot( this );
    gridlayout = new QGridLayout(this);
    gridlayout->addWidget(d_plot);
}

PlotWindow::~PlotWindow(){
    if(d_plot){
        delete d_plot;
        d_plot = NULL;
    }
}

void PlotWindow::resetPloat(int count)
{
    if(d_plot){
        gridlayout->removeWidget(d_plot);
        delete d_plot;
        d_plot = NULL;
    }

    d_plot = new Plot( this, count );
    gridlayout->addWidget(d_plot);

}
