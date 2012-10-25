include ../Makefile.include
DEPS= ../Makefile.include Makefile

# lib name, version
LIBNAME=libiconv
VERSION=1.13.1
SOURCE=$(LIBNAME)-$(VERSION)
ARCHIVE=$(SOURCE).tar.gz

# configuration settings
CONFIGURE=cp -f $(CONFIG_SUB) $(CONFIG_GUESS) build-aux/; \
          cp -f $(CONFIG_SUB) $(CONFIG_GUESS) libcharset/build-aux/; \
          ./configure --prefix=$(PREFIX) --host=$(HOST) gl_cv_header_working_stdint_h=yes --disable-shared

LIBDYLIB=$(PLATFORM)/lib/.libs/$(LIBNAME).a

CLEAN_FILES=$(ARCHIVE) $(PLATFORM)

all: .installed-$(PLATFORM)

$(TARBALLS_LOCATION)/$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(ARCHIVE) $(DEPS)
	rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(TARBALLS_LOCATION)/$(ARCHIVE)
	cd $(PLATFORM); $(CONFIGURE)

$(LIBDYLIB): $(PLATFORM)
	$(MAKE) -C $(PLATFORM)

.installed-$(PLATFORM): $(LIBDYLIB)
	$(MAKE) -C $(PLATFORM) install
	#rm -f $(PREFIX)/lib/libiconv.la $(PREFIX)/lib/libiconv.so $(PREFIX)/lib/libiconv.so.2
	#mv -f $(PREFIX)/lib/libiconv.so.2.5.0 $(PREFIX)/lib/libiconv.so
	#$(RPL) -e "libiconv.so.2" "libiconv.so\x00\x00" $(PREFIX)/lib/libiconv.so
	#-$(READELF) --dynamic $(PREFIX)/lib/libiconv.so | grep ibrary
	touch $@

clean:
	$(MAKE) -C $(PLATFORM) clean
	rm -f .installed-$(PLATFORM)

distclean::
	rm -rf $(PLATFORM) .installed-$(PLATFORM)

