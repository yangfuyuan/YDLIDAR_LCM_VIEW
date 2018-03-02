/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include <qwidget.h>

class Plot;
class QwtScaleWidget;
class QGridLayout;

class PlotWindow: public QWidget
{
public:
    explicit PlotWindow( QWidget * = NULL );
    ~PlotWindow();

    Plot *plot() { return d_plot; }

    void resetPloat(int count);

private:
    Plot *d_plot;
    QwtScaleWidget *d_colorScale;
    QGridLayout *gridlayout;
};

