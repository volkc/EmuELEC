################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="imame4all"
PKG_VERSION="4793742b457945afb74053c8a895e6ff0b36b033"
PKG_SHA256="2d59e1083535c8a32f30afdfff9202b394c35d2c52123050730d7b6f3f339866"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/imame4all-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A port of iMAME4all to libretro"
PKG_LONGDESC="A port of iMAME4all to libretro"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"

make_target() {
  make -f makefile.libretro ARM=1
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro.so $INSTALL/usr/lib/libretro/imame4all_libretro.so
}
