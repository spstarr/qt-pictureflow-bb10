TARGET = pictureflow
TEMPLATE = app
HEADERS = pictureflow.h
SOURCES = pictureflow.cpp main.cpp
CONFIG += qt debug_and_release

QMAKE_CXXFLAGS += "-fstack-protector-strong -fpie -D_FORTIFY_SOURCE=2 -Wtrampolines -Wall -Wextra -Wformat=2"

device {
        CONFIG(release, debug|release) {
                DESTDIR = o.le-v7
        }
        CONFIG(debug, debug|release) {
                DESTDIR = o.le-v7-g
        }
}

simulator {
        CONFIG(release, debug|release) {
                DESTDIR = o
        }
        CONFIG(debug, debug|release) {
                DESTDIR = o-g
        }
}

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
LIBS += -lbbdevice
