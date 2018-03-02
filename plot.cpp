/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include <qpen.h>
#include <qlocale.h>
#include <qwt_series_data.h>
#include <qwt_polar_panner.h>
#include <qwt_polar_magnifier.h>
#include <qwt_polar_grid.h>
#include <qwt_polar_curve.h>
#include <qwt_scale_div.h>
#include <qwt_symbol.h>
#include <qwt_round_scale_draw.h>
#include "plot.h"




Data::Data( const QwtInterval &radialInterval,
          const QwtInterval &azimuthInterval, size_t size ):
        d_radialInterval( radialInterval ),
        d_azimuthInterval( azimuthInterval ),
        d_size( size )
    {
    }




ScanData::ScanData( const QwtInterval &radialInterval,
            const QwtInterval &azimuthInterval, size_t size ):
        Data( radialInterval, azimuthInterval, size )
    {
        points.resize(size);
    }


void ScanData::setPoints(QVector<QPointF> p){
        points = p;
}


Plot::Plot( QWidget *parent , int count):
    QwtPolarPlot( parent ),
    cnt(count)
{
    d_data = new ScanData(radialInterval, azimuthInterval, cnt);

    c_data = new CalceData(radialInterval, azimuthInterval, 2);

    l_data = new LineData(radialInterval, azimuthInterval, 3);



    scan_data.resize(cnt);
    setAutoReplot( true );
    setPlotBackground( Qt::black );

    // scales
    setScale( QwtPolar::Azimuth,
        azimuthInterval.maxValue(), azimuthInterval.minValue(),
        -azimuthInterval.width() / 12 );
    setScaleMaxMinor( QwtPolar::Azimuth, 2.5 );

    setScale( QwtPolar::Radius,radialInterval.minValue(), radialInterval.maxValue(),2 );
    setScaleMaxMinor( QwtPolar::Radius, 2.5 );

    setAzimuthOrigin( M_PI/2 );


    // grids
    d_grid = new QwtPolarGrid();
    d_grid->setPen( QPen( Qt::darkGray ) );
    for ( int scaleId = 0; scaleId < QwtPolar::ScaleCount; scaleId++ )
    {
        d_grid->showGrid( scaleId );
        d_grid->showMinorGrid( scaleId );

        QPen minorPen( Qt::darkGray );
        d_grid->setMinorGridPen( scaleId, minorPen );
    }
    d_grid->setAxisPen( QwtPolar::AxisAzimuth, QPen( Qt::darkGray ) );
    d_grid->showAxis( QwtPolar::AxisAzimuth, true );
    d_grid->showAxis( QwtPolar::AxisLeft, false );
    d_grid->showAxis( QwtPolar::AxisRight, true );
    d_grid->showAxis( QwtPolar::AxisTop, true );
    d_grid->showAxis( QwtPolar::AxisBottom, false );
    d_grid->showGrid( QwtPolar::Azimuth, true );
    d_grid->showGrid( QwtPolar::Radius, true );
    d_grid->attach( this );

    d_curve["scan"] = new QwtPolarCurve() ;

    d_curve["scan"]->setStyle( QwtPolarCurve::NoCurve );

    d_curve["scan"]->setTitle( "Scan" );
    d_curve["scan"]->setPen( QPen( Qt::green, 3 ) );
    d_curve["scan"]->setSymbol( new QwtSymbol( QwtSymbol::Rect,
        QBrush( Qt::green ), QPen( Qt::green ), QSize( 5, 5 ) ) );

    d_curve["scan"]->setData(d_data);
    d_curve["scan"]->attach( this );


    d_curve["line"] = new QwtPolarCurve();
    d_curve["line"]->setStyle(QwtPolarCurve::Lines);

    d_curve["line"]->setTitle( "Line" );
    d_curve["line"]->setPen( QPen( Qt::red, 2 ) );
    d_curve["line"]->setSymbol( new QwtSymbol( QwtSymbol::Rect,
                    QBrush( Qt::cyan ), QPen( Qt::white ), QSize( 3, 3 ) ) );
    d_curve["line"]->setData(l_data);
    d_curve["line"]->attach(this);


    d_curve["track"] = new QwtPolarCurve();
    d_curve["track"]->setStyle(QwtPolarCurve::Lines);

    d_curve["track"]->setTitle( "Track" );
    d_curve["track"]->setPen( QPen( Qt::red, 1 ) );
    d_curve["track"]->setSymbol( new QwtSymbol( QwtSymbol::Rect,
                    QBrush( Qt::cyan ), QPen( Qt::white ), QSize( 3, 3 ) ) );
    d_curve["track"]->setData(c_data);
    d_curve["track"]->attach(this);
    setMouseTracking(true);
    this->canvas()->setMouseTracking(true);


    QwtPolarMagnifier *magnifier = new QwtPolarMagnifier( canvas() );
    magnifier->setMouseButton( Qt::RightButton, Qt::ShiftModifier );
    new QwtPolarPanner( canvas() );



}

void Plot::mouseMoveEvent(QMouseEvent *event)
{
    QPoint point = event->pos();  //程序界面坐标系，左上角为原点
    QwtPointPolar ppoint = this->canvas()->invTransform(point);
    angle = ppoint.azimuth();
}


void Plot::updata(const QVector<QPointF>& data)
{
    d_data->setPoints(data);
    scan_data = data;

    double resolution = (azimuthInterval.maxValue() - azimuthInterval.minValue())/scan_data.size();
    QVector<QwtPointPolar> points;
    points.append(QwtPointPolar(0,0));

    for(int i=0; i < data.size(); i++){
        if(fabs(angle - data[i].x()*180/M_PI) <= resolution){
            points.append(QwtPointPolar(scan_data[i].x()*180/M_PI,scan_data[i].y()));
            c_data->setEndPoint(points);
            break;
        }
    }

    replot();
}

void Plot::upLine(const double hight)
{
    l_data->sethight(hight);
    replot();
}

int Plot::getCount()
{
    return cnt;
}


void Plot::rotate()
{
    const double interval = 0.25; // degrees

    double origin = azimuthOrigin() / M_PI * 180.0;
    origin = qRound( origin / interval ) * interval + interval;
    setAzimuthOrigin( origin / 180.0 * M_PI );
    replot();
}

void Plot::ClockwiseRotate(){
    const double interval = -0.25; // degrees

    double origin = azimuthOrigin() / M_PI * 180.0;
    origin = qRound( origin / interval ) * interval + interval;
    setAzimuthOrigin( origin / 180.0 * M_PI );
    replot();
}

void Plot::mirror()
{
    const double a1 = scaleDiv( QwtPolar::Azimuth )->upperBound();
    const double a2 = scaleDiv( QwtPolar::Azimuth )->lowerBound();

    setScale( QwtPolar::Azimuth, a1, a2, qAbs( a2 - a1 ) / 12.0 );
    replot();
}

void Plot::showGrid( bool on )
{
    d_grid->setVisible( on );
    replot();
}
