# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="box86"
PKG_VERSION="a1aac43a4e7ab3aaa4ee6f2547372a2a384f57ba"
PKG_SHA256="eababcc6abaa876ca5487a7129c37a2b079361dafdb409fb8875a36c07ddae3c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/ptitSeb/box86"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain gl4es"
PKG_LONGDESC="Box86 - Linux Userspace x86 Emulator with a twist, targeted at ARM Linux devices"
PKG_TOOLCHAIN="cmake"

if [[ "${DEVICE}" == "Amlogic"* ]]; then
	PKG_CMAKE_OPTS_TARGET=" -DRK3399=ON -DCMAKE_BUILD_TYPE=Release"
else
	PKG_CMAKE_OPTS_TARGET=" -DGOA_CLONE=ON -DCMAKE_BUILD_TYPE=Release"
fi

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/emuelec/bin/box86/lib
  cp $PKG_BUILD/x86lib/* $INSTALL/usr/config/emuelec/bin/box86/lib
  cp $PKG_BUILD/.${TARGET_NAME}/box86 $INSTALL/usr/config/emuelec/bin/box86/
  
  mkdir -p $INSTALL/etc/binfmt.d
  ln -sf /emuelec/configs/box86.conf $INSTALL/etc/binfmt.d/box86.conf
 
}
