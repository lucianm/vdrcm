PACKAGE  = vdrcm
VERSION  = $(shell grep script_ver= ${PACKAGE} | cut -d'=' -f2)
ARCHIVE  = $(PACKAGE)-$(VERSION)
prefix  ?= /usr/local
TMPDIR   = /tmp
DOCDIR   = $(DESTDIR)$(prefix)/share/doc/$(ARCHIVE)
DOCS     = HISTORY README.md
ifeq ($(NO_LICENSE_INST), "1")
DOCS     += LICENSE
endif

all:
	@echo Nothing to build

install:
	mkdir -p $(DESTDIR)$(prefix)/bin
	install -m 755 -o root -g root $(PACKAGE) $(DESTDIR)$(prefix)/bin
	mkdir -p $(DOCDIR)
	cp --recursive --remove-destination --archive $(DOCS) -t $(DOCDIR)

uninstall:
	rm -f $(DESTDIR)$(prefix)/bin/$(PACKAGE)
	rm -fR $(DOCDIR)

dist:
	@-rm -rf $(TMPDIR)/$(ARCHIVE)
	@mkdir $(TMPDIR)/$(ARCHIVE)
	@cp -a * $(TMPDIR)/$(ARCHIVE)
	@tar cJf ../$(ARCHIVE).tar.xz -C $(TMPDIR) $(ARCHIVE)
	@-rm -rf $(TMPDIR)/$(ARCHIVE)
	@echo Distribution package created as ../$(ARCHIVE).tar.xz

.PHONY: install
