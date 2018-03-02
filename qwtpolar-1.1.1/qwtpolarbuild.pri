# -*- mode: sh -*- ##############################################
# QwtPolar Widget Library
# Copyright (C) 2008   Uwe Rathmann
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the Qwt License, Version 1.0
#################################################################

######################################################################
# qmake internal options
######################################################################

CONFIG           += qt
CONFIG           += warn_on
CONFIG           += no_keywords
CONFIG           += silent

CONFIG           += qwt

######################################################################
# release/debug mode
######################################################################

win32 {
    # On Windows you can't mix release and debug libraries.
    # The designer is built in release mode. If you like to use it
    # you need a release version. For your own application development you
    # might need a debug version. 
    # Enable debug_and_release + build_all if you want to build both.

    CONFIG           += debug_and_release
    CONFIG           += build_all
}
else {

    CONFIG           += release

    VER_MAJ           = $${QWT_POLAR_VER_MAJ}
    VER_MIN           = $${QWT_POLAR_VER_MIN}
    VER_PAT           = $${QWT_POLAR_VER_PAT}
    VERSION           = $${QWT_POLAR_VERSION}
}

linux-g++ {
    # CONFIG           += separate_debug_info
}

######################################################################
# paths for building qwt
######################################################################

MOC_DIR      = moc
RCC_DIR      = resources
!debug_and_release {
    OBJECTS_DIR       = obj
}
