#!/bin/bash
 ################################################################
 # $ID: build.sh       Wed, 24 Oct 2012 14:12:08 +0800  mhfan $ #
 #                                                              #
 # Description:                                                 #
 #                                                              #
 # Maintainer:  ∑∂√¿ª‘(MeiHui FAN)  <mhfan@ustc.edu>            #
 #                                                              #
 # CopyLeft (c)  2012  M.H.Fan                                  #
 #   All rights reserved.                                       #
 #                                                              #
 # This file is free software;                                  #
 #   you are free to modify and/or redistribute it  	        #
 #   under the terms of the GNU General Public Licence (GPL).   #
 ################################################################

# XXX:
ANDROID_ROOT=/home/mhfan/devel/mhdroid
ANDROID_SDK=$ANDROID_ROOT/sdk/linux-x86
XBMC_ANDROID=$ANDROID_ROOT/external/xbmc/tools/android
CRYSTAX=android-ndk-r7-crystax-5.beta3
TOOLCHAIN=arm-linux-androideabi-4.6.3
TARGET_PLAT=android-9

cd $(dirname $0)/../../..

false &&
keytool -genkey -keystore tools/android/smartq-xbmc.keystore \
    -alias androidxbmckey -dname \
    "CN=Android SmartQ-XBMC,O=SmartDevices,C=CN,ST=AnHui,L=HeFei" \
    -v -validity 36500 -keyalg RSA -keysize 2048 \
    -keypass android -storepass android \

[ ! -e addons/skin.touched/addon.xml ] &&
git submodule update --init addons/skin.touched &&
cd addons/skin.touched && { git co origin/master -b master -t; cd -; }

[ ! -d $XBMC_ANDROID/$TOOLCHAIN ] &&
cd tools/android && {
F=android-ndk-r7-crystax-5.beta3-linux-x86.tar.bz2 &&
curl -C - -O http://www.crystax.net/en/download/$F &&
tar jxf $F && cd $CRYSTAX && {
patch -sf -p1 < ../android-ndk-r7-crystax-5_silent.patch;
build/tools/make-standalone-toolchain.sh --install-dir=../$TOOLCHAIN \
    --ndk-dir=. --platform=$TARGET_PLAT; cd -; }; cd ../..; }

./bootstrap
cd tools/android/depends
./bootstrap

./configure \
  --with-toolchain=$XBMC_ANDROID/$TOOLCHAIN \
  --with-sdk=$ANDROID_SDK \
  --with-ndk=$XBMC_ANDROID/$CRYSTAX \
  --with-tarballs=$XBMC_ANDROID/tarballs \
  --with-staging=$XBMC_ANDROID/staging \
  --with-android-source=$ANDROID_ROOT \
  --with-sdk-platform=$TARGET_PLAT \
  --with-cpu=armeabi-v7a \
&& make -j2 && make -j2 -C xbmc

cd - && make -j2 && make apk

if false; then # XXX:
    make -C tools/android/depends
    make -C tools/android/depends/D
fi

# TODO: python, addons, pvr, ...

################################################################################
#`configure' configures android-depends 2.00 to adapt to many kinds of systems.
#
#Usage: ./configure [OPTION]... [VAR=VALUE]...
#
#To assign environment variables (e.g., CC, CFLAGS...), specify them as
#VAR=VALUE.  See below for descriptions of some of the useful variables.
#
#Defaults for the options are specified in brackets.
#
#Configuration:
#  -h, --help              display this help and exit
#      --help=short        display options specific to this package
#      --help=recursive    display the short help of all the included packages
#  -V, --version           display version information and exit
#  -q, --quiet, --silent   do not print `checking ...' messages
#      --cache-file=FILE   cache test results in FILE [disabled]
#  -C, --config-cache      alias for `--cache-file=config.cache'
#  -n, --no-create         do not create output files
#      --srcdir=DIR        find the sources in DIR [configure dir or `..']
#
#Installation directories:
#  --prefix=PREFIX         install architecture-independent files in PREFIX
#                          [/usr/local]
#  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#                          [PREFIX]
#
#By default, `make install' will install all the files in
#`/usr/local/bin', `/usr/local/lib' etc.  You can specify
#an installation prefix other than `/usr/local' using `--prefix',
#for instance `--prefix=$HOME'.
#
#For better control, use the options below.
#
#Fine tuning of the installation directories:
#  --bindir=DIR            user executables [EPREFIX/bin]
#  --sbindir=DIR           system admin executables [EPREFIX/sbin]
#  --libexecdir=DIR        program executables [EPREFIX/libexec]
#  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#  --libdir=DIR            object code libraries [EPREFIX/lib]
#  --includedir=DIR        C header files [PREFIX/include]
#  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#  --infodir=DIR           info documentation [DATAROOTDIR/info]
#  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#  --mandir=DIR            man documentation [DATAROOTDIR/man]
#  --docdir=DIR            documentation root [DATAROOTDIR/doc/android-depends]
#  --htmldir=DIR           html documentation [DOCDIR]
#  --dvidir=DIR            dvi documentation [DOCDIR]
#  --pdfdir=DIR            pdf documentation [DOCDIR]
#  --psdir=DIR             ps documentation [DOCDIR]
#
#Optional Packages:
#  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#  --with-toolchain        specify path to android toolchain
#  --with-sdk              specify path to android sdk
#  --with-ndk              specify path to android ndk
#  --with-tarballs         path where tarballs will be saved
#  --with-staging          optional. path for staging sysroot. defaults to
#                          $toolchain/staging
#  --with-android-source   optional. path for android source.
#  --with-cpu              optional. specify target cpu. guessed if not
#                          specified
#  --with-sdk-platform     optional. spcify sdk platform version (for android
#                          headers). default is android-10
#
#Some influential environment variables:
#  XBMC_ANDROID_NDK
#              path to android ndk
#  XBMC_ANDROID_SDK
#              path to android sdk
#  XBMC_ANDROID_TARBALLS
#              path where tarballs will be saved
#  CXX         C++ compiler command
#  CXXFLAGS    C++ compiler flags
#  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#              nonstandard directory <lib dir>
#  LIBS        libraries to pass to the linker, e.g. -l<library>
#  CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#              you have headers in a nonstandard directory <include dir>
#  CC          C compiler command
#  CFLAGS      C compiler flags
#
#Use these variables to override the choices made by `configure' or to help
#it to find libraries and programs with nonstandard names/locations.
#
#Report bugs to <http://trac.xbmc.org>.
# vim:sts=4:ts=8:
