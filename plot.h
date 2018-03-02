/*
 *  YDLIDAR LCM VIEW
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include <qwt_polar_plot.h>
#include <qwt_polar_curve.h>
#include <qwt_point_polar.h>
#include <qwt_polar_canvas.h>
#include <qwt_polar_picker.h>
#include <qwt_polar_marker.h>
#include <QMouseEvent>

const QwtInterval radialInterval( 0.0, 16000 );
const QwtInterval azimuthInterval( 0, 360);

class Data: public QwtSeriesData<QwtPointPolar>
{
public:
    explicit Data( const QwtInterval &radialInterval,
          const QwtInterval &azimuthInterval, size_t size );

    virtual size_t size() const
    {
        return d_size;
    }

protected:
    QwtInterval d_radialInterval;
    QwtInterval d_azimuthInterval;
    size_t d_size;
};

class ScanData: public Data
{
public:
    explicit ScanData( const QwtInterval &radialInterval,
            const QwtInterval &azimuthInterval, size_t size );

    virtual ~ScanData(){}

    virtual QwtPointPolar sample( size_t i ) const
    {
        if(i>= points.size())
            return QwtPointPolar(this->points[0].x()*180/M_PI,this->points[0].y());
        const double a = this->points[i].x()*180/M_PI;
        const double r = this->points[i].y();

        return QwtPointPolar(a,r);
    }

    virtual QRectF boundingRect() const
    {
        if ( d_boundingRect.width() < 0.0 )
            d_boundingRect = qwtBoundingRect( *this );

        return d_boundingRect;
    }
    void setPoints(QVector<QPointF> p);


protected:
    QVector<QPointF> points;

};


class LineData: public Data
{
public:
    LineData( const QwtInterval &radialInterval,
            const QwtInterval &azimuthInterval, size_t size ):
        Data( radialInterval, azimuthInterval, size )
    {
        d =0.0;
    }

    virtual QwtPointPolar sample( size_t i ) const
    {
        const double stepA = 85;
        const double a = -85 + i * stepA;

        const double r = d/ cos(a*M_PI/180);

        return QwtPointPolar( a, r );
    }

    virtual QRectF boundingRect() const
    {
        if ( d_boundingRect.width() < 0.0 )
            d_boundingRect = qwtBoundingRect( *this );

        return d_boundingRect;
    }

    void sethight(double d){
        this->d = d;
    }

protected:
    double d;
};

class CalceData: public Data
{
public:
    CalceData( const QwtInterval &radialInterval,
            const QwtInterval &azimuthInterval, size_t size ):
        Data( radialInterval, azimuthInterval, size )
    {
        points.resize(size);

    }


    virtual QwtPointPolar sample( size_t i ) const
    {
        const double a = this->points[i].azimuth();
        const double r = this->points[i].radius();
        return QwtPointPolar( a, r );
    }

    virtual QRectF boundingRect() const
    {
        if ( d_boundingRect.width() < 0.0 )
            d_boundingRect = qwtBoundingRect( *this );

        return d_boundingRect;
    }

    void setEndPoint(const QVector<QwtPointPolar>& point){
        this->points = point;
    }

protected:
    QVector<QwtPointPolar> points;
};


class QwtPolarGrid;



class Plot: public QwtPolarPlot
{
    Q_OBJECT

public:
    explicit Plot( QWidget * = NULL, int count = 1440 );
public Q_SLOTS:
    void showGrid( bool );
    void rotate();
    void ClockwiseRotate();
    void mirror();
    void updata(const QVector<QPointF>& data);
    void upLine(const double hight);

    int getCount();

protected:
    virtual void mouseMoveEvent(QMouseEvent *event);

private:
    QwtPolarGrid *d_grid;
    //QwtPolarCurve *d_curve;
    QMap<QString, QwtPolarCurve*> d_curve;
    ScanData *d_data;
    CalceData *c_data;
    LineData *l_data;



    int cnt;
    int index;
    double angle;

    QVector<QPointF> scan_data;


};
