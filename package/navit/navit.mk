################################################################################
#
# navit
#
################################################################################

NAVIT_VERSION = 93d74f9b922da183beda900609ea6fd5df060b50
NAVIT_SITE = git://github.com/navit-gps/navit
NAVIT_LICENSE = GPL-2
NAVIT_INSTALL_TARGET = YES
NAVIT_DEPENDENCIES = host-pkgconf
NAVIT_MAKE = $(MAKE1)
NAVIT_CONF_OPTS = -DSVG2PNG=FALSE -DLIBDIR=/usr/lib -DSAMPLE_MAP=0 -Dsupport/espeak=false -DINTERNAL_ESPEAK_COMPLETE=false

ifeq ($(BR2_PACKAGE_NAVIT_GTK2),y)
NAVIT_DEPENDENCIES += libgtk2
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=1
else
NAVIT_CONF_OPTS += -Dgraphics/gtk_drawing_area=0
endif

ifeq ($(BR2_PACKAGE_NAVIT_QT5),y)
NAVIT_DEPENDENCIES += qt5svg qt5declarative qt5location qt5sensors
NAVIT_CONF_OPTS += -Dgraphics/qt5=1
else
NAVIT_CONF_OPTS += -DDISABLE_QT=1 -Dgraphics/qt5=0 -Dvehicle/qt5=0
endif

ifeq ($(BR2_PACKAGE_NAVIT_GPSD_VEHICLE),y)
NAVIT_DEPENDENCIES += gpsd
NAVIT_CONF_OPTS += -Dvehicle/gpsd=1
endif

ifeq ($(BR2_PACKAGE_NAVIT_J1850_PLUGIN),y)
NAVIT_CONF_OPTS += -Dplugin/j1850=1
endif

$(eval $(cmake-package))
