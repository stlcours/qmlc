TEMPLATE = lib
CONFIG += plugin
QT += qml quick

DESTDIR = ../Charts
TARGET = $$qtLibraryTarget(chartsplugin)

HEADERS += piechart.h \
           pieslice.h \
           chartsplugin.h

SOURCES += piechart.cpp \
           pieslice.cpp \
           chartsplugin.cpp

DESTPATH=$$[QT_INSTALL_TESTS]/qmlc/tests/manual/plugins/Charts

target.path=$$DESTPATH
qmldir.files=$$PWD/qmldir
qmldir.path=$$DESTPATH
compiled_files.files=$$PWD/QmlInPlugin.qmc
compiled_files.path=$$DESTPATH

INSTALLS += target compiled_files qmldir

OTHER_FILES += qmldir QmlInPlugin.qmc

RESOURCES += res.qrc

# Copy the qmldir file and compiled files to the same folder as the plugin binary
QMAKE_POST_LINK += $$QMAKE_COPY $$replace($$list($$quote($$PWD/qmldir) $$DESTDIR), /, $$QMAKE_DIR_SEP)
QMAKE_POST_LINK += ;
QMAKE_POST_LINK += $$QMAKE_COPY $$replace($$list($$quote($$PWD/*.qmc) $$DESTDIR), /, $$QMAKE_DIR_SEP)