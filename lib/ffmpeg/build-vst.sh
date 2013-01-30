#!/bin/bash
 ################################################################
 # $ID: build.sh       Thu, 30 Oct 2008 17:14:22 +0800  mhfan $ #
 #                                                              #
 # Description:                                                 #
 #                                                              #
 # Maintainer:  ������(MeiHui FAN)  <mhfan@ustc.edu>            #
 #                                                              #
 # CopyLeft (c)  2008~2009  M.H.Fan                             #
 #   All rights reserved.                                       #
 #                                                              #
 # This file is free software;                                  #
 #   you are free to modify and/or redistribute it  	        #
 #   under the terms of the GNU General Public Licence (GPL).   #
 ################################################################

SRCDIR=$(dirname $0)

ARCH=$(uname -m); PREFIX=/usr; CROSS_COMPILE=; #CPU=core2;
#source $SRCDIR/../scripts/hhtech_config.sh || \
#source $SRCDIR/../../scripts/hhtech_config.sh

CPPFLAGS="$CPPFLAGS -DFF_API_MAX_STREAMS=0"

#make distclean

$SRCDIR/configure \
  --prefix=$PREFIX \
  \
    --enable-shared \
  --enable-gpl \
  --enable-version2 \
  --enable-version3 \
  --enable-nonfree \
  \
  --enable-avfilter \
  \
  --disable-x11grab \
  \
    --disable-gray \
  \
  --disable-avisynth \
  \
    --disable-libcelt \
  --disable-frei0r \
  --disable-libaacplus \
  --disable-libopencore-amrnb \
  --disable-libopencore-amrwb \
  --disable-libcdio \
    --disable-libdc1394 \
  --disable-libdirac \
  --disable-libfaac \
  --disable-libfreetype \
  --disable-libgsm \
  --disable-libmodplug \
  --disable-libmp3lame \
    --disable-libnut \
  --disable-libopenjpeg \
  --disable-librtmp \
  --disable-libschroedinger \
  --disable-libspeex \
  --disable-libtheora \
  --disable-libstagefright-h264 \
    --disable-libvo-aacenc \
    --disable-libvo-amrwbenc \
  --disable-libvorbis \
  --disable-libvpx \
  --disable-libx264 \
    --disable-libxavs \
  --disable-libxvid \
  --disable-openal \
  \
  --cross-prefix="" \
  \
  --extra-cflags="" \
  --extra-cxxflags="" \
    --extra-ldflags="" \
  --extra-libs="" \
  \
  --build-suffix="" \
  ${ARCH:+--arch=$ARCH} \
  ${CPU:+--cpu=$CPU} \
  \
  --optflags="-ffast-math -pipe" \
  --disable-debug \
  \
  --enable-extra-warnings \
  \
  $* \
  \
&& touch configure-stamp \
&& make -j && make ffvst \
#&& make #&& if [[ $1 = "install" ]]; then make install; fi
#&& sed -i -e 's,/usr/include,\${prefix}/include,' config.mak \
#&& sed -i -e 's,/usr/bin,\${prefix}/bin,' config.mak \

# -static -lgnutls -ltasn1 -lgpg-error -lxcb -lXau -lXdmcp -ldl -lrt

################################################################################
#Usage: configure [options]
#Options: [defaults in brackets after descriptions]
#
#Standard options:
#  --help                   print this message
#  --logfile=FILE           log tests and output to FILE [config.log]
#  --disable-logging        do not log configure debug information
#  --prefix=PREFIX          install in PREFIX []
#  --bindir=DIR             install binaries in DIR [PREFIX/bin]
#  --datadir=DIR            install data files in DIR [PREFIX/share/ffmpeg]
#  --libdir=DIR             install libs in DIR [PREFIX/lib]
#  --shlibdir=DIR           install shared libs in DIR [PREFIX/lib]
#  --incdir=DIR             install includes in DIR [PREFIX/include]
#  --mandir=DIR             install man page in DIR [PREFIX/share/man]
#
#Configuration options:
#  --disable-static         do not build static libraries [no]
#  --enable-shared          build shared libraries [no]
#  --enable-gpl             allow use of GPL code, the resulting libs
#                           and binaries will be under GPL [no]
#  --enable-version2        force GPL version 2 [no]
#  --enable-version3        upgrade (L)GPL to version 3 [no]
#  --enable-nonfree         allow use of nonfree code, the resulting libs
#                           and binaries will be unredistributable [no]
#  --disable-doc            do not build documentation
#  --disable-ffmpeg         disable ffmpeg build
#  --disable-avconv         disable avconv build
#  --disable-ffplay         disable ffplay build
#  --disable-ffprobe        disable ffprobe build
#  --disable-ffserver       disable ffserver build
#  --disable-avdevice       disable libavdevice build
#  --disable-avcodec        disable libavcodec build
#  --disable-avformat       disable libavformat build
#  --disable-swresample     disable libswresample build
#  --disable-swscale        disable libswscale build
#  --disable-postproc       disable libpostproc build
#  --disable-avfilter       disable video filter support [no]
#  --disable-pthreads       disable pthreads [auto]
#  --enable-w32threads      use Win32 threads [no]
#  --enable-x11grab         enable X11 grabbing [no]
#  --disable-network        disable network support [no]
#  --enable-gray            enable full grayscale support (slower color)
#  --disable-swscale-alpha  disable alpha channel support in swscale
#  --disable-fastdiv        disable table-based division
#  --enable-small           optimize for size instead of speed
#  --disable-aandct         disable AAN DCT code
#  --disable-dct            disable DCT code
#  --disable-fft            disable FFT code
#  --disable-golomb         disable Golomb code
#  --disable-huffman        disable Huffman code
#  --disable-lpc            disable LPC code
#  --disable-mdct           disable MDCT code
#  --disable-rdft           disable RDFT code
#  --enable-vaapi           enable VAAPI code [autodetect]
#  --enable-vdpau           enable VDPAU code [autodetect]
#  --disable-dxva2          disable DXVA2 code
#  --enable-runtime-cpudetect detect cpu capabilities at runtime (bigger binary)
#  --enable-hardcoded-tables use hardcoded tables instead of runtime generation
#  --enable-memalign-hack   emulate memalign, interferes with memory debuggers
#  --disable-everything     disable all components listed below
#  --disable-encoder=NAME   disable encoder NAME
#  --enable-encoder=NAME    enable encoder NAME
#  --disable-encoders       disable all encoders
#  --disable-decoder=NAME   disable decoder NAME
#  --enable-decoder=NAME    enable decoder NAME
#  --disable-decoders       disable all decoders
#  --disable-hwaccel=NAME   disable hwaccel NAME
#  --enable-hwaccel=NAME    enable hwaccel NAME
#  --disable-hwaccels       disable all hwaccels
#  --disable-muxer=NAME     disable muxer NAME
#  --enable-muxer=NAME      enable muxer NAME
#  --disable-muxers         disable all muxers
#  --disable-demuxer=NAME   disable demuxer NAME
#  --enable-demuxer=NAME    enable demuxer NAME
#  --disable-demuxers       disable all demuxers
#  --enable-parser=NAME     enable parser NAME
#  --disable-parser=NAME    disable parser NAME
#  --disable-parsers        disable all parsers
#  --enable-bsf=NAME        enable bitstream filter NAME
#  --disable-bsf=NAME       disable bitstream filter NAME
#  --disable-bsfs           disable all bitstream filters
#  --enable-protocol=NAME   enable protocol NAME
#  --disable-protocol=NAME  disable protocol NAME
#  --disable-protocols      disable all protocols
#  --disable-indev=NAME     disable input device NAME
#  --disable-outdev=NAME    disable output device NAME
#  --disable-indevs         disable input devices
#  --disable-outdevs        disable output devices
#  --disable-devices        disable all devices
#  --enable-filter=NAME     enable filter NAME
#  --disable-filter=NAME    disable filter NAME
#  --disable-filters        disable all filters
#  --list-decoders          show all available decoders
#  --list-encoders          show all available encoders
#  --list-hwaccels          show all available hardware accelerators
#  --list-muxers            show all available muxers
#  --list-demuxers          show all available demuxers
#  --list-parsers           show all available parsers
#  --list-protocols         show all available protocols
#  --list-bsfs              show all available bitstream filters
#  --list-indevs            show all available input devices
#  --list-outdevs           show all available output devices
#  --list-filters           show all available filters
#
#External library support:
#  --enable-avisynth        enable reading of AVISynth script files [no]
#  --enable-bzlib           enable bzlib [autodetect]
#  --enable-libcelt         enable CELT/Opus decoding via libcelt [no]
#  --enable-frei0r          enable frei0r video filtering
#  --enable-libaacplus      enable AAC+ encoding via libaacplus [no]
#  --enable-libopencore-amrnb enable AMR-NB de/encoding via libopencore-amrnb [no]
#  --enable-libopencore-amrwb enable AMR-WB decoding via libopencore-amrwb [no]
#  --enable-libopencv       enable video filtering via libopencv [no]
#  --enable-libcdio         enable audio CD grabbing with libcdio
#  --enable-libdc1394       enable IIDC-1394 grabbing using libdc1394
#                           and libraw1394 [no]
#  --enable-libdirac        enable Dirac support via libdirac [no]
#  --enable-libfaac         enable FAAC support via libfaac [no]
#  --enable-libfreetype     enable libfreetype [no]
#  --enable-libgsm          enable GSM support via libgsm [no]
#  --enable-libmodplug      enable ModPlug via libmodplug [no]
#  --enable-libmp3lame      enable MP3 encoding via libmp3lame [no]
#  --enable-libnut          enable NUT (de)muxing via libnut,
#                           native (de)muxer exists [no]
#  --enable-libopenjpeg     enable JPEG 2000 decoding via OpenJPEG [no]
#  --enable-librtmp         enable RTMP[E] support via librtmp [no]
#  --enable-libschroedinger enable Dirac support via libschroedinger [no]
#  --enable-libspeex        enable Speex encoding and decoding via libspeex [no]
#  --enable-libstagefright-h264  enable H.264 decoding via libstagefright [no]
#  --enable-libtheora       enable Theora encoding via libtheora [no]
#  --enable-libvo-aacenc    enable AAC encoding via libvo-aacenc [no]
#  --enable-libvo-amrwbenc  enable AMR-WB encoding via libvo-amrwbenc [no]
#  --enable-libvorbis       enable Vorbis encoding via libvorbis,
#                           native implementation exists [no]
#  --enable-libvpx          enable VP8 support via libvpx [no]
#  --enable-libx264         enable H.264 encoding via x264 [no]
#  --enable-libxavs         enable AVS encoding via xavs [no]
#  --enable-libxvid         enable Xvid encoding via xvidcore,
#                           native MPEG-4/Xvid encoder exists [no]
#  --enable-openal          enable OpenAL 1.1 capture support [no]
#  --enable-mlib            enable Sun medialib [no]
#  --enable-zlib            enable zlib [autodetect]
#
#Advanced options (experts only):
#  --cross-prefix=PREFIX    use PREFIX for compilation tools []
#  --enable-cross-compile   assume a cross-compiler is used
#  --sysroot=PATH           root of cross-build tree
#  --sysinclude=PATH        location of cross-build system headers
#  --target-os=OS           compiler targets OS []
#  --target-exec=CMD        command to run executables on target
#  --target-path=DIR        path to view of build directory on target
#  --nm=NM                  use nm tool
#  --ar=AR                  use archive tool AR [ar]
#  --as=AS                  use assembler AS []
#  --cc=CC                  use C compiler CC [gcc]
#  --cxx=CXX                use C compiler CXX [g++]
#  --ld=LD                  use linker LD
#  --host-cc=HOSTCC         use host C compiler HOSTCC
#  --host-cflags=HCFLAGS    use HCFLAGS when compiling for host
#  --host-ldflags=HLDFLAGS  use HLDFLAGS when linking for host
#  --host-libs=HLIBS        use libs HLIBS when linking for host
#  --extra-cflags=ECFLAGS   add ECFLAGS to CFLAGS []
#  --extra-cxxflags=ECFLAGS add ECFLAGS to CXXFLAGS []
#  --extra-ldflags=ELDFLAGS add ELDFLAGS to LDFLAGS []
#  --extra-libs=ELIBS       add ELIBS []
#  --extra-version=STRING   version string suffix []
#  --build-suffix=SUFFIX    library name suffix []
#  --progs-suffix=SUFFIX    program name suffix []
#  --arch=ARCH              select architecture []
#  --cpu=CPU                select the minimum required CPU (affects
#                           instruction selection, may crash on older CPUs)
#  --disable-asm            disable all assembler optimizations
#  --disable-altivec        disable AltiVec optimizations
#  --disable-amd3dnow       disable 3DNow! optimizations
#  --disable-amd3dnowext    disable 3DNow! extended optimizations
#  --disable-mmx            disable MMX optimizations
#  --disable-mmx2           disable MMX2 optimizations
#  --disable-sse            disable SSE optimizations
#  --disable-ssse3          disable SSSE3 optimizations
#  --disable-avx            disable AVX optimizations
#  --disable-armv5te        disable armv5te optimizations
#  --disable-armv6          disable armv6 optimizations
#  --disable-armv6t2        disable armv6t2 optimizations
#  --disable-armvfp         disable ARM VFP optimizations
#  --disable-iwmmxt         disable iwmmxt optimizations
#  --disable-mmi            disable MMI optimizations
#  --disable-neon           disable neon optimizations
#  --disable-vis            disable VIS optimizations
#  --disable-yasm           disable use of yasm assembler
#  --enable-pic             build position-independent code
#  --malloc-prefix=PFX      prefix malloc and related names with PFX
#  --enable-sram            allow use of on-chip SRAM
#  --disable-symver         disable symbol versioning
#  --optflags               override optimization-related compiler flags
#
#Developer options (useful when working on FFmpeg itself):
#  --disable-debug          disable debugging symbols
#  --enable-debug=LEVEL     set the debug level []
#  --disable-optimizations  disable compiler optimizations
#  --enable-extra-warnings  enable more compiler warnings
#  --disable-stripping      disable stripping of executables and shared libraries
#  --samples=PATH           location of test samples for FATE, if not set use
#                           $FATE_SAMPLES at make invocation time.
#
#NOTE: Object files are built at the place where configure is launched.
# vim:sts=4:ts=8:
