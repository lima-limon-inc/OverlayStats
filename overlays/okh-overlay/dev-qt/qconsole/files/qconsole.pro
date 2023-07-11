
HEADERS += \
        $$PWD/qconsole.h

SOURCES += \
        $$PWD/qconsole.cpp

TEMPLATE = lib
CONFIG += staticlib

VER_MAJ=1
VER_MIN=3
VER_PAT=1

QT -= gui

INCLUDEPATH += $$PWD

target.path = /usr/lib

eheaders.path = "/usr/include/qconsole"
eheaders.files = $$HEADERS

INSTALLS += target eheaders