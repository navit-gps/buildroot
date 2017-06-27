#!/bin/bash

sed -i -e 's/"gtk_drawing_area"/"qt5"/' ${TARGET_DIR}/usr/share/navit/navit.xml
sed -i -e 's/zoom="256"/zoom="32"/' ${TARGET_DIR}/usr/share/navit/navit.xml

sed -i -e 's/gui type="gtk" enabled="no"/gui type="qt5_qml" enabled="yes"/' ${TARGET_DIR}/usr/share/navit/navit.xml
sed -i -e 's/gui type="internal" enabled="yes"/gui type="internal" enabled="no"/' ${TARGET_DIR}/usr/share/navit/navit.xml

sed -i -e 's/eth0/eth1/' ${TARGET_DIR}/etc/network/interfaces
