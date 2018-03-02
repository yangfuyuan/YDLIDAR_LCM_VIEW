
#-------------------------------------------------
#
# Project created by QtCreator 2017-12-11T17:05:04
#
#-------------------------------------------------

QT       += core gui
QT += serialport
QT += opengl
QT += printsupport
QT += svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET       = YDLIDAR_LCM_SCANNING
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG += static
CONFIG += c++11


INCLUDEPATH +=$$PWD/lcmtypes

INCLUDEPATH +=$$PWD/qwt-6.1.3/src
INCLUDEPATH +=$$PWD/qwtpolar-1.1.1/src



SOURCES = \
    plot.cpp \
    plotwindow.cpp \
    main.cpp \
    mainwindow.cpp \
    qlcmhandler.cpp \
    qwt-6.1.3/src/qwt_abstract_legend.cpp \
    qwt-6.1.3/src/qwt_abstract_scale.cpp \
    qwt-6.1.3/src/qwt_abstract_scale_draw.cpp \
    qwt-6.1.3/src/qwt_abstract_slider.cpp \
    qwt-6.1.3/src/qwt_analog_clock.cpp \
    qwt-6.1.3/src/qwt_arrow_button.cpp \
    qwt-6.1.3/src/qwt_clipper.cpp \
    qwt-6.1.3/src/qwt_color_map.cpp \
    qwt-6.1.3/src/qwt_column_symbol.cpp \
    qwt-6.1.3/src/qwt_compass.cpp \
    qwt-6.1.3/src/qwt_compass_rose.cpp \
    qwt-6.1.3/src/qwt_counter.cpp \
    qwt-6.1.3/src/qwt_curve_fitter.cpp \
    qwt-6.1.3/src/qwt_date.cpp \
    qwt-6.1.3/src/qwt_date_scale_draw.cpp \
    qwt-6.1.3/src/qwt_date_scale_engine.cpp \
    qwt-6.1.3/src/qwt_dial.cpp \
    qwt-6.1.3/src/qwt_dial_needle.cpp \
    qwt-6.1.3/src/qwt_dyngrid_layout.cpp \
    qwt-6.1.3/src/qwt_event_pattern.cpp \
    qwt-6.1.3/src/qwt_graphic.cpp \
    qwt-6.1.3/src/qwt_interval.cpp \
    qwt-6.1.3/src/qwt_interval_symbol.cpp \
    qwt-6.1.3/src/qwt_knob.cpp \
    qwt-6.1.3/src/qwt_legend.cpp \
    qwt-6.1.3/src/qwt_legend_data.cpp \
    qwt-6.1.3/src/qwt_legend_label.cpp \
    qwt-6.1.3/src/qwt_magnifier.cpp \
    qwt-6.1.3/src/qwt_math.cpp \
    qwt-6.1.3/src/qwt_matrix_raster_data.cpp \
    qwt-6.1.3/src/qwt_null_paintdevice.cpp \
    qwt-6.1.3/src/qwt_painter.cpp \
    qwt-6.1.3/src/qwt_painter_command.cpp \
    qwt-6.1.3/src/qwt_panner.cpp \
    qwt-6.1.3/src/qwt_picker.cpp \
    qwt-6.1.3/src/qwt_picker_machine.cpp \
    qwt-6.1.3/src/qwt_pixel_matrix.cpp \
    qwt-6.1.3/src/qwt_plot.cpp \
    qwt-6.1.3/src/qwt_plot_abstract_barchart.cpp \
    qwt-6.1.3/src/qwt_plot_axis.cpp \
    qwt-6.1.3/src/qwt_plot_barchart.cpp \
    qwt-6.1.3/src/qwt_plot_canvas.cpp \
    qwt-6.1.3/src/qwt_plot_curve.cpp \
    qwt-6.1.3/src/qwt_plot_dict.cpp \
    qwt-6.1.3/src/qwt_plot_directpainter.cpp \
    qwt-6.1.3/src/qwt_plot_glcanvas.cpp \
    qwt-6.1.3/src/qwt_plot_grid.cpp \
    qwt-6.1.3/src/qwt_plot_histogram.cpp \
    qwt-6.1.3/src/qwt_plot_intervalcurve.cpp \
    qwt-6.1.3/src/qwt_plot_item.cpp \
    qwt-6.1.3/src/qwt_plot_layout.cpp \
    qwt-6.1.3/src/qwt_plot_legenditem.cpp \
    qwt-6.1.3/src/qwt_plot_magnifier.cpp \
    qwt-6.1.3/src/qwt_plot_marker.cpp \
    qwt-6.1.3/src/qwt_plot_multi_barchart.cpp \
    qwt-6.1.3/src/qwt_plot_panner.cpp \
    qwt-6.1.3/src/qwt_plot_picker.cpp \
    qwt-6.1.3/src/qwt_plot_rasteritem.cpp \
    qwt-6.1.3/src/qwt_plot_renderer.cpp \
    qwt-6.1.3/src/qwt_plot_rescaler.cpp \
    qwt-6.1.3/src/qwt_plot_scaleitem.cpp \
    qwt-6.1.3/src/qwt_plot_seriesitem.cpp \
    qwt-6.1.3/src/qwt_plot_shapeitem.cpp \
    qwt-6.1.3/src/qwt_plot_spectrocurve.cpp \
    qwt-6.1.3/src/qwt_plot_spectrogram.cpp \
    qwt-6.1.3/src/qwt_plot_svgitem.cpp \
    qwt-6.1.3/src/qwt_plot_textlabel.cpp \
    qwt-6.1.3/src/qwt_plot_tradingcurve.cpp \
    qwt-6.1.3/src/qwt_plot_xml.cpp \
    qwt-6.1.3/src/qwt_plot_zoneitem.cpp \
    qwt-6.1.3/src/qwt_plot_zoomer.cpp \
    qwt-6.1.3/src/qwt_point_3d.cpp \
    qwt-6.1.3/src/qwt_point_data.cpp \
    qwt-6.1.3/src/qwt_point_mapper.cpp \
    qwt-6.1.3/src/qwt_point_polar.cpp \
    qwt-6.1.3/src/qwt_raster_data.cpp \
    qwt-6.1.3/src/qwt_round_scale_draw.cpp \
    qwt-6.1.3/src/qwt_sampling_thread.cpp \
    qwt-6.1.3/src/qwt_scale_div.cpp \
    qwt-6.1.3/src/qwt_scale_draw.cpp \
    qwt-6.1.3/src/qwt_scale_engine.cpp \
    qwt-6.1.3/src/qwt_scale_map.cpp \
    qwt-6.1.3/src/qwt_scale_widget.cpp \
    qwt-6.1.3/src/qwt_series_data.cpp \
    qwt-6.1.3/src/qwt_slider.cpp \
    qwt-6.1.3/src/qwt_spline.cpp \
    qwt-6.1.3/src/qwt_symbol.cpp \
    qwt-6.1.3/src/qwt_system_clock.cpp \
    qwt-6.1.3/src/qwt_text.cpp \
    qwt-6.1.3/src/qwt_text_engine.cpp \
    qwt-6.1.3/src/qwt_text_label.cpp \
    qwt-6.1.3/src/qwt_thermo.cpp \
    qwt-6.1.3/src/qwt_transform.cpp \
    qwt-6.1.3/src/qwt_wheel.cpp \
    qwt-6.1.3/src/qwt_widget_overlay.cpp \
    qwtpolar-1.1.1/src/qwt_polar_canvas.cpp \
    qwtpolar-1.1.1/src/qwt_polar_curve.cpp \
    qwtpolar-1.1.1/src/qwt_polar_fitter.cpp \
    qwtpolar-1.1.1/src/qwt_polar_grid.cpp \
    qwtpolar-1.1.1/src/qwt_polar_item.cpp \
    qwtpolar-1.1.1/src/qwt_polar_itemdict.cpp \
    qwtpolar-1.1.1/src/qwt_polar_layout.cpp \
    qwtpolar-1.1.1/src/qwt_polar_magnifier.cpp \
    qwtpolar-1.1.1/src/qwt_polar_marker.cpp \
    qwtpolar-1.1.1/src/qwt_polar_panner.cpp \
    qwtpolar-1.1.1/src/qwt_polar_picker.cpp \
    qwtpolar-1.1.1/src/qwt_polar_plot.cpp \
    qwtpolar-1.1.1/src/qwt_polar_renderer.cpp \
    qwtpolar-1.1.1/src/qwt_polar_spectrogram.cpp

HEADERS = \
    plot.h \
    plotwindow.h \
    mainwindow.h \
    qlcmhandler.h \
    qwt-6.1.3/src/qwt.h \
    qwt-6.1.3/src/qwt_abstract_legend.h \
    qwt-6.1.3/src/qwt_abstract_scale.h \
    qwt-6.1.3/src/qwt_abstract_scale_draw.h \
    qwt-6.1.3/src/qwt_abstract_slider.h \
    qwt-6.1.3/src/qwt_analog_clock.h \
    qwt-6.1.3/src/qwt_arrow_button.h \
    qwt-6.1.3/src/qwt_clipper.h \
    qwt-6.1.3/src/qwt_color_map.h \
    qwt-6.1.3/src/qwt_column_symbol.h \
    qwt-6.1.3/src/qwt_compass.h \
    qwt-6.1.3/src/qwt_compass_rose.h \
    qwt-6.1.3/src/qwt_compat.h \
    qwt-6.1.3/src/qwt_counter.h \
    qwt-6.1.3/src/qwt_curve_fitter.h \
    qwt-6.1.3/src/qwt_date.h \
    qwt-6.1.3/src/qwt_date_scale_draw.h \
    qwt-6.1.3/src/qwt_date_scale_engine.h \
    qwt-6.1.3/src/qwt_dial.h \
    qwt-6.1.3/src/qwt_dial_needle.h \
    qwt-6.1.3/src/qwt_dyngrid_layout.h \
    qwt-6.1.3/src/qwt_event_pattern.h \
    qwt-6.1.3/src/qwt_global.h \
    qwt-6.1.3/src/qwt_graphic.h \
    qwt-6.1.3/src/qwt_interval.h \
    qwt-6.1.3/src/qwt_interval_symbol.h \
    qwt-6.1.3/src/qwt_knob.h \
    qwt-6.1.3/src/qwt_legend.h \
    qwt-6.1.3/src/qwt_legend_data.h \
    qwt-6.1.3/src/qwt_legend_label.h \
    qwt-6.1.3/src/qwt_magnifier.h \
    qwt-6.1.3/src/qwt_math.h \
    qwt-6.1.3/src/qwt_matrix_raster_data.h \
    qwt-6.1.3/src/qwt_null_paintdevice.h \
    qwt-6.1.3/src/qwt_painter.h \
    qwt-6.1.3/src/qwt_painter_command.h \
    qwt-6.1.3/src/qwt_panner.h \
    qwt-6.1.3/src/qwt_picker.h \
    qwt-6.1.3/src/qwt_picker_machine.h \
    qwt-6.1.3/src/qwt_pixel_matrix.h \
    qwt-6.1.3/src/qwt_plot.h \
    qwt-6.1.3/src/qwt_plot_abstract_barchart.h \
    qwt-6.1.3/src/qwt_plot_barchart.h \
    qwt-6.1.3/src/qwt_plot_canvas.h \
    qwt-6.1.3/src/qwt_plot_curve.h \
    qwt-6.1.3/src/qwt_plot_dict.h \
    qwt-6.1.3/src/qwt_plot_directpainter.h \
    qwt-6.1.3/src/qwt_plot_glcanvas.h \
    qwt-6.1.3/src/qwt_plot_grid.h \
    qwt-6.1.3/src/qwt_plot_histogram.h \
    qwt-6.1.3/src/qwt_plot_intervalcurve.h \
    qwt-6.1.3/src/qwt_plot_item.h \
    qwt-6.1.3/src/qwt_plot_layout.h \
    qwt-6.1.3/src/qwt_plot_legenditem.h \
    qwt-6.1.3/src/qwt_plot_magnifier.h \
    qwt-6.1.3/src/qwt_plot_marker.h \
    qwt-6.1.3/src/qwt_plot_multi_barchart.h \
    qwt-6.1.3/src/qwt_plot_panner.h \
    qwt-6.1.3/src/qwt_plot_picker.h \
    qwt-6.1.3/src/qwt_plot_rasteritem.h \
    qwt-6.1.3/src/qwt_plot_renderer.h \
    qwt-6.1.3/src/qwt_plot_rescaler.h \
    qwt-6.1.3/src/qwt_plot_scaleitem.h \
    qwt-6.1.3/src/qwt_plot_seriesitem.h \
    qwt-6.1.3/src/qwt_plot_shapeitem.h \
    qwt-6.1.3/src/qwt_plot_spectrocurve.h \
    qwt-6.1.3/src/qwt_plot_spectrogram.h \
    qwt-6.1.3/src/qwt_plot_svgitem.h \
    qwt-6.1.3/src/qwt_plot_textlabel.h \
    qwt-6.1.3/src/qwt_plot_tradingcurve.h \
    qwt-6.1.3/src/qwt_plot_zoneitem.h \
    qwt-6.1.3/src/qwt_plot_zoomer.h \
    qwt-6.1.3/src/qwt_point_3d.h \
    qwt-6.1.3/src/qwt_point_data.h \
    qwt-6.1.3/src/qwt_point_mapper.h \
    qwt-6.1.3/src/qwt_point_polar.h \
    qwt-6.1.3/src/qwt_raster_data.h \
    qwt-6.1.3/src/qwt_round_scale_draw.h \
    qwt-6.1.3/src/qwt_samples.h \
    qwt-6.1.3/src/qwt_sampling_thread.h \
    qwt-6.1.3/src/qwt_scale_div.h \
    qwt-6.1.3/src/qwt_scale_draw.h \
    qwt-6.1.3/src/qwt_scale_engine.h \
    qwt-6.1.3/src/qwt_scale_map.h \
    qwt-6.1.3/src/qwt_scale_widget.h \
    qwt-6.1.3/src/qwt_series_data.h \
    qwt-6.1.3/src/qwt_series_store.h \
    qwt-6.1.3/src/qwt_slider.h \
    qwt-6.1.3/src/qwt_spline.h \
    qwt-6.1.3/src/qwt_symbol.h \
    qwt-6.1.3/src/qwt_system_clock.h \
    qwt-6.1.3/src/qwt_text.h \
    qwt-6.1.3/src/qwt_text_engine.h \
    qwt-6.1.3/src/qwt_text_label.h \
    qwt-6.1.3/src/qwt_thermo.h \
    qwt-6.1.3/src/qwt_transform.h \
    qwt-6.1.3/src/qwt_wheel.h \
    qwt-6.1.3/src/qwt_widget_overlay.h \
    qwtpolar-1.1.1/src/qwt_polar.h \
    qwtpolar-1.1.1/src/qwt_polar_canvas.h \
    qwtpolar-1.1.1/src/qwt_polar_curve.h \
    qwtpolar-1.1.1/src/qwt_polar_fitter.h \
    qwtpolar-1.1.1/src/qwt_polar_global.h \
    qwtpolar-1.1.1/src/qwt_polar_grid.h \
    qwtpolar-1.1.1/src/qwt_polar_item.h \
    qwtpolar-1.1.1/src/qwt_polar_itemdict.h \
    qwtpolar-1.1.1/src/qwt_polar_layout.h \
    qwtpolar-1.1.1/src/qwt_polar_magnifier.h \
    qwtpolar-1.1.1/src/qwt_polar_marker.h \
    qwtpolar-1.1.1/src/qwt_polar_panner.h \
    qwtpolar-1.1.1/src/qwt_polar_picker.h \
    qwtpolar-1.1.1/src/qwt_polar_plot.h \
    qwtpolar-1.1.1/src/qwt_polar_renderer.h \
    qwtpolar-1.1.1/src/qwt_polar_spectrogram.h


INCLUDEPATH +=/usr/local/include
LIBS += -L/usr/local/lib -llcm


FORMS += \
    mainwindow.ui \

RESOURCES += \
    YDLIDAR_LCM_VIEW.qrc

RC_FILE = myapp.rc

