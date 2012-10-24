include ../Makefile.include
DEPS= ../Makefile.include Makefile

# lib name, version
LIBNAME=avahi
VERSION=0.6.31
SOURCE=$(LIBNAME)-$(VERSION)
ARCHIVE=$(SOURCE).tar.gz

BASE_URL=http://avahi.org/download

# configuration settings
CONFIGURE=cp -f $(CONFIG_SUB) $(CONFIG_GUESS) .; \
  ./configure --prefix=$(PREFIX) --host=$(HOST) \
  --localstatedir=/data/misc \
    \
  --disable-stack-protector \
  --disable-shared \
    \
  --disable-nls \
  --disable-glib \
  --disable-gobject \
    \
  --disable-qt3 \
  --disable-qt4 \
  --disable-gtk \
  --disable-gtk3 \
    \
  --disable-gdbm \
    \
  --disable-python \
  --disable-pygtk \
  --disable-python-dbus \
  --disable-mono \
  --disable-monodoc \
  --disable-autoipd \
    \
  --disable-manpages \
  --disable-xmltoman \
    \
  --with-distro=none \
    \
  --with-avahi-user=root \
  --with-avahi-group=root \
  --with-avahi-priv-access-group=inet \
  --with-autoipd-user=default \
  --with-autoipd-group=default \
    \

LIBDYLIB=$(PLATFORM)/$(LIBNAME)/avahi-client/.libs/libavahi-client.a

CLEAN_FILES=$(ARCHIVE) $(PLATFORM)

all: $(LIBDYLIB) .installed-$(PLATFORM)

$(TARBALLS_LOCATION)/$(ARCHIVE):
	$(RETRIEVE_TOOL) $(RETRIEVE_TOOL_FLAGS) $(BASE_URL)/$(ARCHIVE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(ARCHIVE) $(DEPS)
	rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	$(ARCHIVE_TOOL) $(ARCHIVE_TOOL_FLAGS) $(TARBALLS_LOCATION)/$(ARCHIVE)
	cd $(PLATFORM); patch -p1 < ../0001-Add-Android-support.patch
	cd $(PLATFORM); patch -p1 < ../glob.patch
	cd $(PLATFORM); sed -i -e 's,\t\(test.*/run"\),\t-\1,' \
		avahi-daemon/Makefile.am
	cd $(PLATFORM); $(CONFIGURE)

$(LIBDYLIB): $(PLATFORM)
	$(MAKE) -C $(PLATFORM)

.installed-$(PLATFORM): $(LIBDYLIB)
	$(MAKE) -C $(PLATFORM) install
	touch $@

clean:
	$(MAKE) -C $(PLATFORM) clean
	rm -f .installed-$(PLATFORM)

distclean::
	rm -rf $(PLATFORM) .installed-$(PLATFORM)
