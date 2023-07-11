HEADERS += $$PWD/src/QCtrlSignals \
        $$PWD/src/qctrlsignalhandler.h \
        $$PWD/src/qctrlsignalhandler_p.h

SOURCES += \
        $$PWD/src/qctrlsignalhandler.cpp

unix {
        HEADERS += $$PWD/src/qctrlsignalhandler_unix.h
        SOURCES += $$PWD/src/qctrlsignalhandler_unix.cpp
}

TEMPLATE = lib
CONFIG += staticlib

VER_MAJ=1
VER_MIN=2
VER_PAT=0

QT -= gui

INCLUDEPATH += $$PWD

target.path = /usr/lib

eheaders.path = /usr/include/qctrlsignals
eheaders.files = $$PWD/src/QCtrlSignals \
		 $$PWD/src/qctrlsignalhandler.h

INSTALLS += target eheaders
