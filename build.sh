#!/bin/bash
 ################################################################
 # $ID: build.sh       Wed, 24 Oct 2012 13:25:41 +0800  mhfan $ #
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

rm -rf system/{,players/{paplayer,dvdplayer}}/*.so \
    tools/android/staging/armeabi-v7a/{lib,share}/xbmc \
    tools/android/packaging/xbmc/{assets,lib*} \

LIBS=${ANDROID_ROOT:+-lft2} \
./configure \
  \
  --enable-shared-lib \
  --disable-debug \
  --enable-neon \
  \
  --enable-gles \
  --disable-sdl \
  \
    --disable-openmax \
  \
  --disable-joystick \
  --disable-xrandr \
    --disable-goom \
  --disable-rsxs \
  \
  --disable-x11 \
  \
  --disable-alsa \
  \
    --disable-ssh \
  \
    --disable-samba \
    --disable-nfs \
    --disable-afpclient \
  \
  --disable-dvdread \
  --disable-dvdcss \
  \
  --disable-mysql \
    --enable-webserver \
  --disable-optical-drive \
  --disable-libbluray \
  \
  --disable-udev \
    --disable-libusb \
    --disable-libcec \
  --disable-libmp3lame \
  --disable-libvorbisenc \
  \
    --disable-external-libraries \
  \
  --disable-static \
  \
    --with-arch=arm \
  \
    --with-cpu=cortex-a9 \
  \
  $@ \
  \
#    --enable-player=omxplayer \

################################################################################
#`configure' configures xbmc 11.9.7 to adapt to many kinds of systems.
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
#  --docdir=DIR            documentation root [DATAROOTDIR/doc/xbmc]
#  --htmldir=DIR           html documentation [DOCDIR]
#  --dvidir=DIR            dvi documentation [DOCDIR]
#  --pdfdir=DIR            pdf documentation [DOCDIR]
#  --psdir=DIR             ps documentation [DOCDIR]
#
#Program names:
#  --program-prefix=PREFIX            prepend PREFIX to installed program names
#  --program-suffix=SUFFIX            append SUFFIX to installed program names
#  --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
#
#System types:
#  --build=BUILD     configure for building on BUILD [guessed]
#  --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#
#Optional Features:
#  --disable-option-checking  ignore unrecognized --enable/--with options
#  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#  --enable-shared-lib     build libxbmc. helpful for tests (default is no)
#  --enable-debug          enable debugging information (default is yes)
#  --enable-neon           enable neon passing to ffmpeg (default is no)
#  --enable-optimizations  enable optimization (default is yes)
#  --enable-gl             enable OpenGL rendering (default is yes)
#  --enable-gles           enable OpenGLES rendering (default is no)
#  --enable-sdl            enable SDL (default is auto)
#  --enable-vdpau          enable VDPAU decoding (default is auto)
#  --enable-vaapi          enable VAAPI decoding (default is auto)
#  --enable-crystalhd      enable CrystalHD decoding (default is auto)
#  --enable-vdadecoder     enable VDADecoder decoding (default is auto)
#  --enable-vtbdecoder     enable VTBDecoder decoding (default is auto)
#  --enable-openmax        enable OpenMax decoding (default is auto, requires
#                          OpenGLES)
#  --enable-tegra          enable Tegra2 arm (default is no)
#  --enable-profiling      enable gprof profiling (default is no)
#  --enable-joystick       enable SDL joystick support (default is yes)
#  --enable-xrandr         enable XRandR support (default is yes)
#  --enable-goom           enable GOOM visualisation (default is no)
#  --enable-rsxs           enable really slick X screensavers (default is yes)
#  --enable-projectm       enable ProjectM visualisation (default is yes)
#  --enable-x11            enable x11 (default is yes) 'Linux Only'
#  --enable-ccache         enable building with ccache feature (default is
#                          auto)
#  --disable-alsa          disable ALSA support (only for linux/freebsd)
#  --enable-pulse          enable PulseAudio support (default is no)
#  --disable-ssh           disable SSH SFTP support (default is enabled)
#  --enable-rtmp           enable RTMP support via librtmp (default is auto)
#  --disable-samba         disable SAMBA support (default is enabled)
#  --enable-nfs            enable NFS support via libnfs (default is auto)
#  --enable-afpclient      enable AFP support via libafpclient (default is
#                          auto)
#  --enable-airplay        enable AirPlay support(default is auto)
#  --enable-airtunes       enable AirTunes support(default is auto)
#  --disable-upnp          disable UPnP support (default is enabled)
#  --enable-ffmpeg-libvorbis
#                          enable FFmpeg vorbis encoding (default is no)
#  --enable-dvdread        enable dvd image playback (default is yes)
#  --enable-dvdcss         enable DVDCSS support (default is yes)
#  --enable-mid            enable MID support (default is no)
#  --disable-hal           disable HAL support (default is enabled if hal and
#                          hal-storage is found)
#  --disable-avahi         disable Avahi support (default is enabled if
#                          libavahi-common and libavahi-client is found)
#  --disable-non-free      disable componentents with non-compliant licenses
#  --enable-asap-codec     enable ASAP ADPCM support
#  --disable-mysql         disable mysql
#  --disable-webserver     disable webserver
#  --disable-optical-drive disable optical drive
#  --enable-libbluray      enable libbluray support
#  --enable-texturepacker  enable texturepacker support (default is yes)
#  --enable-udev           enable udev support (default is auto)
#  --enable-libusb         enable libusb support (default is auto)
#  --enable-libcec         enable libcec support (default is auto)
#  --enable-libmp3lame     enable lame mp3 encoder support (default is auto)
#  --enable-libvorbisenc   enable vorbis encoder support (default is auto)
#  --enable-libcap         enable libcap support (default is auto)
#  --enable-player         enable additional players from a list of comma
#                          separated names, (default is none, choices are
#                          amlplayer, omxplayer)
#  --enable-gtest          configure Google Test Framework (default is no)
#  --enable-external-libraries
#                          enable use of all supported external libraries
#                          (default is no) 'Linux only'
#  --enable-external-ffmpeg
#                          enable use of external ffmpeg libraries (default is
#                          no) 'Linux only'
#  --disable-dependency-tracking  speeds up one-time build
#  --enable-dependency-tracking   do not reject slow dependency extractors
#  --enable-shared[=PKGS]  build shared libraries [default=yes]
#  --enable-static[=PKGS]  build static libraries [default=yes]
#  --enable-fast-install[=PKGS]
#                          optimize for fast installation [default=yes]
#  --disable-libtool-lock  avoid locking (might break parallel builds)
#
#Optional Packages:
#  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#  --with-arch             build with given arch passing to internal ffmpeg
#                          (default is no, needed for crosscompiling)
#  --with-platform         use a pre-configured config for common arm boards
#  --with-cpu              build with given cpu passing to ffmpeg (default is
#                          no)
#  --with-lirc-device=file specify the default LIRC device (default is
#                          /dev/lircd)
#  --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
#                          both]
#  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#  --with-sysroot=DIR Search for dependent libraries within DIR
#                        (or the compiler's sysroot if not specified).
#
#Some influential environment variables:
#  CXX         C++ compiler command
#  CXXFLAGS    C++ compiler flags
#  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#              nonstandard directory <lib dir>
#  LIBS        libraries to pass to the linker, e.g. -l<library>
#  CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#              you have headers in a nonstandard directory <include dir>
#  CC          C compiler command
#  CFLAGS      C compiler flags
#  CPP         C preprocessor
#  CXXCPP      C++ preprocessor
#  PYTHON_VERSION
#              The installed Python version to use, for example '2.3'. This
#              string will be appended to the Python interpreter canonical
#              name.
#  PKG_CONFIG  path to pkg-config utility
#  PKG_CONFIG_PATH
#              directories to add to pkg-config's search path
#  PKG_CONFIG_LIBDIR
#              path overriding pkg-config's built-in search path
#  FRIBIDI_CFLAGS
#              C compiler flags for FRIBIDI, overriding pkg-config
#  FRIBIDI_LIBS
#              linker flags for FRIBIDI, overriding pkg-config
#  SQLITE3_CFLAGS
#              C compiler flags for SQLITE3, overriding pkg-config
#  SQLITE3_LIBS
#              linker flags for SQLITE3, overriding pkg-config
#  PNG_CFLAGS  C compiler flags for PNG, overriding pkg-config
#  PNG_LIBS    linker flags for PNG, overriding pkg-config
#  PCRECPP_CFLAGS
#              C compiler flags for PCRECPP, overriding pkg-config
#  PCRECPP_LIBS
#              linker flags for PCRECPP, overriding pkg-config
#  PCRE_CFLAGS C compiler flags for PCRE, overriding pkg-config
#  PCRE_LIBS   linker flags for PCRE, overriding pkg-config
#  CDIO_CFLAGS C compiler flags for CDIO, overriding pkg-config
#  CDIO_LIBS   linker flags for CDIO, overriding pkg-config
#  SAMPLERATE_CFLAGS
#              C compiler flags for SAMPLERATE, overriding pkg-config
#  SAMPLERATE_LIBS
#              linker flags for SAMPLERATE, overriding pkg-config
#  FREETYPE2_CFLAGS
#              C compiler flags for FREETYPE2, overriding pkg-config
#  FREETYPE2_LIBS
#              linker flags for FREETYPE2, overriding pkg-config
#  TAGLIB_CFLAGS
#              C compiler flags for TAGLIB, overriding pkg-config
#  TAGLIB_LIBS linker flags for TAGLIB, overriding pkg-config
#  ZIP_CFLAGS  C compiler flags for ZIP, overriding pkg-config
#  ZIP_LIBS    linker flags for ZIP, overriding pkg-config
#  LIBBLURAY_CFLAGS
#              C compiler flags for LIBBLURAY, overriding pkg-config
#  LIBBLURAY_LIBS
#              linker flags for LIBBLURAY, overriding pkg-config
#  ALSA_CFLAGS C compiler flags for ALSA, overriding pkg-config
#  ALSA_LIBS   linker flags for ALSA, overriding pkg-config
#  DBUS_CFLAGS C compiler flags for DBUS, overriding pkg-config
#  DBUS_LIBS   linker flags for DBUS, overriding pkg-config
#  SDL_CFLAGS  C compiler flags for SDL, overriding pkg-config
#  SDL_LIBS    linker flags for SDL, overriding pkg-config
#  HAL_CFLAGS  C compiler flags for HAL, overriding pkg-config
#  HAL_LIBS    linker flags for HAL, overriding pkg-config
#  HAL_STORAGE_CFLAGS
#              C compiler flags for HAL_STORAGE, overriding pkg-config
#  HAL_STORAGE_LIBS
#              linker flags for HAL_STORAGE, overriding pkg-config
#  X11_CFLAGS  C compiler flags for X11, overriding pkg-config
#  X11_LIBS    linker flags for X11, overriding pkg-config
#  XEXT_CFLAGS C compiler flags for XEXT, overriding pkg-config
#  XEXT_LIBS   linker flags for XEXT, overriding pkg-config
#  XT_CFLAGS   C compiler flags for XT, overriding pkg-config
#  XT_LIBS     linker flags for XT, overriding pkg-config
#  XMU_CFLAGS  C compiler flags for XMU, overriding pkg-config
#  XMU_LIBS    linker flags for XMU, overriding pkg-config
#  UDEV_CFLAGS C compiler flags for UDEV, overriding pkg-config
#  UDEV_LIBS   linker flags for UDEV, overriding pkg-config
#  USB_CFLAGS  C compiler flags for USB, overriding pkg-config
#  USB_LIBS    linker flags for USB, overriding pkg-config
#  CEC_CFLAGS  C compiler flags for CEC, overriding pkg-config
#  CEC_LIBS    linker flags for CEC, overriding pkg-config
#  FFMPEG_CFLAGS
#              C compiler flags for FFMPEG, overriding pkg-config
#  FFMPEG_LIBS linker flags for FFMPEG, overriding pkg-config
#  OPENMAX_CFLAGS
#              C compiler flags for OPENMAX, overriding pkg-config
#  OPENMAX_LIBS
#              linker flags for OPENMAX, overriding pkg-config
#
#Use these variables to override the choices made by `configure' or to help
#it to find libraries and programs with nonstandard names/locations.
#
#Report bugs to <http://trac.xbmc.org>.
# vim:sts=4:ts=8:
