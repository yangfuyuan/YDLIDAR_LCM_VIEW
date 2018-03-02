# -*- mode: sh -*- ##############################################
# QwtPolar Widget Library
# Copyright (C) 2008   Uwe Rathmann
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the Qwt License, Version 1.0
#################################################################

# qmake project file for building the qwtpolar libraries

HEADERS += \
    qwt_polar_global.h \
    qwt_polar.h \
    qwt_polar_fitter.h \
    qwt_polar_item.h \
    qwt_polar_picker.h \
    qwt_polar_panner.h \
    qwt_polar_magnifier.h \
    qwt_polar_grid.h \
    qwt_polar_curve.h \
    qwt_polar_spectrogram.h \
    qwt_polar_marker.h \
    qwt_polar_itemdict.h \
    qwt_polar_canvas.h \
    qwt_polar_layout.h \
    qwt_polar_renderer.h \
    qwt_polar_plot.h \
    $$PWD/qwt_polar.h \
    $$PWD/qwt_polar_canvas.h \
    $$PWD/qwt_polar_curve.h \
    $$PWD/qwt_polar_fitter.h \
    $$PWD/qwt_polar_global.h \
    $$PWD/qwt_polar_grid.h \
    $$PWD/qwt_polar_item.h \
    $$PWD/qwt_polar_itemdict.h \
    $$PWD/qwt_polar_layout.h \
    $$PWD/qwt_polar_magnifier.h \
    $$PWD/qwt_polar_marker.h \
    $$PWD/qwt_polar_panner.h \
    $$PWD/qwt_polar_picker.h \
    $$PWD/qwt_polar_plot.h \
    $$PWD/qwt_polar_renderer.h \
    $$PWD/qwt_polar_spectrogram.h

SOURCES += \
    qwt_polar_fitter.cpp \
    qwt_polar_item.cpp \
    qwt_polar_picker.cpp \
    qwt_polar_panner.cpp \
    qwt_polar_magnifier.cpp \
    qwt_polar_grid.cpp \
    qwt_polar_curve.cpp \
    qwt_polar_spectrogram.cpp \
    qwt_polar_marker.cpp \
    qwt_polar_itemdict.cpp \
    qwt_polar_canvas.cpp \
    qwt_polar_layout.cpp \
    qwt_polar_renderer.cpp \
    qwt_polar_plot.cpp \
    $$PWD/qwt_polar_canvas.cpp \
    $$PWD/qwt_polar_curve.cpp \
    $$PWD/qwt_polar_fitter.cpp \
    $$PWD/qwt_polar_grid.cpp \
    $$PWD/qwt_polar_item.cpp \
    $$PWD/qwt_polar_itemdict.cpp \
    $$PWD/qwt_polar_layout.cpp \
    $$PWD/qwt_polar_magnifier.cpp \
    $$PWD/qwt_polar_marker.cpp \
    $$PWD/qwt_polar_panner.cpp \
    $$PWD/qwt_polar_picker.cpp \
    $$PWD/qwt_polar_plot.cpp \
    $$PWD/qwt_polar_renderer.cpp \
    $$PWD/qwt_polar_spectrogram.cpp

greaterThan(QT_MAJOR_VERSION, 4) {

    QT += printsupport
    QT += concurrent
}

contains(QWT_CONFIG, QwtPolarSvg) {

    QT += svg
}
else {

    DEFINES += QWT_POLAR_NO_SVG
}

