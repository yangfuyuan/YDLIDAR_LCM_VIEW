# -*- mode: sh -*- ##############################################
# QwtPolar Widget Library
# Copyright (C) 2008   Uwe Rathmann
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the Qwt License, Version 1.0
#################################################################

include( qwtpolarconfig.pri )

TEMPLATE = subdirs
CONFIG   += ordered

SUBDIRS = src

contains(QWT_POLAR_CONFIG, QwtPolarDesigner ) {
    SUBDIRS += designer
}

contains(QWT_POLAR_CONFIG, QwtPolarExamples ) {
    SUBDIRS += examples
}

qwtpolarspec.files  = qwtpolarconfig.pri qwtpolarfunctions.pri qwtpolar.prf
qwtpolarspec.path  = $${QWT_POLAR_INSTALL_FEATURES}

INSTALLS += qwtpolarspec

