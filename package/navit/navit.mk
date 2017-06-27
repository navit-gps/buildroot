################################################################################
#
# navit
#
################################################################################

NAVIT_VERSION = trunk
NAVIT_SITE = git://github.com/navit-gps/navit 
NAVIT_LICENSE = GPL-2
NAVIT_INSTALL_TARGET = YES
NAVIT_DEPENDENCIES = host-pkgconf libgtk2

NAVIT_CONF_OPTS = -DSVG2PNG=FALSE -DLIBDIR=/usr/lib

$(eval $(cmake-package))
