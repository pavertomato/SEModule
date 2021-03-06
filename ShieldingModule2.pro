QT += quick
QT += 3dcore 3drender 3dinput 3dlogic 3dextras qml quick 3dquick 3danimation 3dquickextras printsupport
QMAKE_CXXFLAGS+= -openmp
QMAKE_LFLAGS += -openmp

target.path = $$[QT_INSTALL_EXAMPLES]/canvas3d/threejs/$$TARGET
INSTALLS += target

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    surfacemodel.cpp \
    surfacemodellist.cpp \
    robcalculation.cpp \
    calculationthread.cpp \
    qmltranslator.cpp \
    hzformatter.cpp \
    qcustomplot.cpp \
    customplotitem.cpp

RC_ICONS = appicon.ico
RESOURCES += \
    qml.qrc
QT += datavisualization
QT += widgets
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =
TRANSLATIONS += QtLanguage_en.ts \
                QtLanguage_fr.ts
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    surfacemodel.h \
    surfacemodellist.h \
    robcalculation.h \
    calculationthread.h \
    qmltranslator.h \
    hzformatter.h \
    qcustomplot.h \
    customplotitem.h

lupdate_only{
SOURCES = customplotitem.cpp \
          *.qml \
          *.js \
}

DISTFILES += \
    ../../../Downloads/white.png \
    ImageCube.qml \
    three.js \
    ImageCube.qml \
    csg.js \
    ThreeCSG.js \
    selectionpage.qml \
