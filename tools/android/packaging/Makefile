include ../depends/Makefile.include

OBJS = libcurl.so \
  librtmp.so  libmad.so \
  libshairport.so libplist.so \
  libxbogg.so libxbvorbis.so libxbvorbisfile.so libxbFLAC.so \
  libass.so #libafpclient.so #libnfs.so #libiconv.so \
  #libxbmpeg2.so libxbmpeg2convert.so \

PLATFORM_OBJS =
EXCLUDED_ADDONS = screensaver.rsxs.euphoria visualization.dxspectrum visualization.milkdrop visualization.projectm

XBMCROOT = $(shell cd $(CURDIR)/../../..; pwd)
COPYDIRS = system addons language media
AAPT = $(SDKROOT)/platform-tools/aapt
DX = $(SDKROOT)/platform-tools/dx
GCC_VERSION=$(shell $(CC) -dumpversion)

X86OVERRIDES=XBMC_OVERRIDE_HOST=i686-android-linux XBMC_OVERRIDE_TOOLCHAIN=$(XBMC_X86_TOOLCHAIN)
ARMOVERRIDES=XBMC_OVERRIDE_HOST=arm-linux-androideabi XBMC_OVERRIDE_TOOLCHAIN=$(XBMC_ARM_TOOLCHAIN)

#this fixes a android ndk fuckup where the pathes to 
#prebuilt stuff follow different name shemes for
#arm and x86
ifeq ($(findstring x86,$(PLATFORM)),x86)
GDBPATH=$(NDKROOT)/toolchains/$(PLATFORM)-$(GCC_VERSION)/prebuilt/gdbserver
else
GDBPATH=$(NDKROOT)/toolchains/$(HOST)-$(GCC_VERSION)/prebuilt/gdbserver
endif

all: package
SRCLIBS = $(addprefix $(PREFIX)/lib/,$(OBJS)) $(addprefix $(PREFIX)/lib/$(SDK_PLATFORM)/,$(PLATFORM_OBJS))
DSTLIBS = $(PLATFORM)/lib/libxbmc.so $(addprefix $(PLATFORM)/lib/,$(OBJS)) $(addprefix $(PLATFORM)/lib/,$(PLATFORM_OBJS))
libs= $(DSTLIBS)

multi: x86 arm
	@cp images/xbmcapp-release-skeleton.apk images/xbmcapp-release-multi-unaligned.apk
	@cd xbmc; zip -r -q ../images/xbmcapp-release-multi-unaligned.apk lib/ assets
	@jarsigner -sigalg MD5withRSA -digestalg SHA1 -keystore ../smartq-xbmc.keystore -storepass android images/xbmcapp-release-multi-unaligned.apk androidxbmckey
	@$(SDKROOT)/tools/zipalign -f 4 images/xbmcapp-release-multi-unaligned.apk $(XBMCROOT)/xbmcapp-multi-release.apk
	@rm images/xbmcapp-release-multi-unaligned.apk
	@echo "$(XBMCROOT)/xbmcapp-multi-release.apk created"

package: extras
	@cp images/xbmcapp-release-skeleton.apk images/xbmcapp-release-$(PLATFORM)-unaligned.apk
	@javac -classpath $(SDKROOT)/platforms/$(SDK_PLATFORM)/android.jar:xbmc/obj -d xbmc/obj -sourcepath xbmc/src xbmc/src/*.java
	@javac -classpath $(SDKROOT)/platforms/$(SDK_PLATFORM)/android.jar:xbmc/obj -d xbmc/obj -sourcepath xbmc/src xbmc/src/org/xbmc/xbmc/*.java
	@$(DX) --dex --output=xbmc/classes.dex xbmc/obj
	@cd xbmc; zip -r -q ../images/xbmcapp-release-$(PLATFORM)-unaligned.apk lib/$(PLATFORM) assets classes.dex
	@jarsigner -sigalg MD5withRSA -digestalg SHA1 -keystore ../smartq-xbmc.keystore -storepass android images/xbmcapp-release-$(PLATFORM)-unaligned.apk androidxbmckey
	@$(SDKROOT)/tools/zipalign -f 4 images/xbmcapp-release-$(PLATFORM)-unaligned.apk $(XBMCROOT)/xbmcapp-$(PLATFORM)-release.apk
	@rm images/xbmcapp-release-$(PLATFORM)-unaligned.apk
	@echo "$(XBMCROOT)/xbmcapp-$(PLATFORM)-release.apk created"

extras: libs
	rm -rf xbmc/assets/python2.6/lib/
	rm -f xbmc/assets/media/Fonts/arial.ttf
	mkdir -p xbmc/assets xbmc/res xbmc/assets/python2.6/lib/
	cp -rfp $(PREFIX)/share/xbmc/* ./xbmc/assets
	find `pwd`/xbmc/assets/ -depth -name ".git" -exec rm -rf {} \;
	find `pwd`/xbmc/assets/system/ -name "*.so" -exec rm {} \;
	find `pwd`/xbmc/assets/addons/skin.*/media/* -depth -not -iname "Textures.xbt" -exec rm -rf {} \;
	cd xbmc/assets/addons; rm -rf $(EXCLUDED_ADDONS)
	cp -rfp $(PREFIX)/lib/python2.6 xbmc/assets/python2.6/lib/
	cp -rfp $(XBMCROOT)/media/Splash.png xbmc/res/drawable/splash.png
	cd xbmc/assets/python2.6/lib/python2.6/; rm -rf test config lib-dynload
	ln -sf /system/fonts/DroidSansFallback.ttf xbmc/assets/media/Fonts/arial.ttf
	cd xbmc/assets/python2.6/lib/python2.6/; rm -rf xbwebbrowser.pyo wsgiref* xdrlib.pyo telnetlib.pyo audiodev.pyo sunau* pydoc* doctest.pyo smtp* mac* nt* os2* mail* imaplib.pyo email *Server* LICENSE.txt distutils curses lib-tk lib-old idlelib bsddb compile* nntplib.pyo pdb.* unittest.pyo hotspot mhlib.pyo pickle* ctypes/test lib2to3/tests json/tests
	-cd xbmc/assets/addons/skin.confluence/language && mkdir .tmp && mv Chinese* English .tmp && rm -rf * && mv .tmp/* . && rm -rf .tmp
	cd xbmc/assets/addons && cp -af skin.confluence/sounds skin.touched/ && rm -rf skin.confluence library.xbmc.pvr *.last.fm *.themoviedb.org metadata.common.amazon.de metadata.common.fanart.tv metadata.common.hdtrailers.net metadata.common.htbackdrops.com metadata.common.musicbrainz.org visualization.dxspectrum visualization.milkdrop visualization.itunes library.xbmc.* webinterface.default
	cd xbmc/assets && rm -rf system/players/dvdplayer/etc/fonts/conf.avail sounds media/icon*.png media/xbmc.icns media/AppIcon.png
	cd xbmc/assets/addons/skin.touched/language && mkdir .tmp && mv Chinese* English .tmp && rm -rf * && mv .tmp/* . && rm -rf .tmp
	cd xbmc/assets/language && mkdir .tmp && mv Chinese* English .tmp && rm -rf * && mv .tmp/* . && rm -rf .tmp
	cd xbmc/lib/armeabi-v7a && rm libhdhomerun-arm.so libtimidity-arm.so libvgmstream-arm.so libsidplay2-arm.so libstsoundlibrary-arm.so libnosefart-arm.so
	mkdir -p tmp/res; $(AAPT) c -S xbmc/res -C tmp/res; cp -r -n xbmc/res tmp/ || true
	$(AAPT) p -f -I $(SDKROOT)/platforms/$(SDK_PLATFORM)/android.jar -S tmp/res/ -M xbmc/AndroidManifest.xml -F images/xbmcapp-release-skeleton.apk -J xbmc/src
	@rm -rf tmp/

libs: $(PREFIX)/lib/xbmc/libxbmc.so
	rm -rf xbmc/lib/$(PLATFORM) xbmc/libs/$(PLATFORM) xbmc/obj/local/$(PLATFORM)
	mkdir -p xbmc/lib/$(PLATFORM) images xbmc/assets/python2.6/lib/ xbmc/libs/$(PLATFORM) xbmc/obj/local/$(PLATFORM)
	cp -fp $(SRCLIBS) xbmc/obj/local/$(PLATFORM)/
	cp -fp $(PREFIX)/lib/xbmc/libxbmc.so xbmc/obj/local/$(PLATFORM)/
	find $(PREFIX)/lib/xbmc/addons -name "*.so" -exec cp -fp {} xbmc/obj/local/$(PLATFORM)/ \;
	find $(PREFIX)/lib/xbmc/system -name "*.so" -exec cp -fp {} xbmc/obj/local/$(PLATFORM)/ \;
	cd xbmc/obj/local/$(PLATFORM)/; find . -name "*.so" -not -name "lib*.so" | sed "s/\.\///" | xargs -I@ mv @ lib@
	cp -fp xbmc/obj/local/$(PLATFORM)/*.so xbmc/lib/$(PLATFORM)/
	$(STRIP) -s -R .comment -R .note xbmc/lib/$(PLATFORM)/*.so
	#install -p $(GDBPATH) ./xbmc/libs/$(PLATFORM)/gdbserver
	#echo "set solib-search-path ./obj/local/$(PLATFORM)" > ./xbmc/libs/$(PLATFORM)/gdb.setup
	#echo "directory $(TOOLCHAIN)/sysroot/usr/include $(NDKROOT)/sources/android/native_app_glue" \
	#     "$(NDKROOT)/sources/cxx-stl/gnu-libstdc++/include/$(GCC_VERSION) $(XBMCROOT)  $(PREFIX)/include jni" >> ./xbmc/libs/$(PLATFORM)/gdb.setup
	-cp -fp xbmc/libs/$(PLATFORM)/* xbmc/lib/$(PLATFORM) 	# XXX:

$(PREFIX)/lib/xbmc/libxbmc.so: $(SRCLIBS)
	$(MAKE) -C ../depends/xbmc

$(SRCLIBS):

arm: armeabi-v7a

armeabi-v7a: $(XBMC_ARM_TOOLCHAIN) force
	XBMC_OVERRIDE_PLATFORM=$@ $(ARMOVERRIDES) $(MAKE) package

x86: $(XBMC_X86_TOOLCHAIN) force
	XBMC_OVERRIDE_PLATFORM=$@ $(X86OVERRIDES) $(MAKE) package

.PHONY: arm armeabi-v7a x86 force extras libs
