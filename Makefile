.POSIX:

PREFIX = /usr
MANPREFIX = $(PREFIX)/share/man

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	mkdir -p $(DESTDIR)$(PREFIX)/share/mutt-wizard
	cp -f mailcap $(DESTDIR)$(PREFIX)/share/mutt-wizard
	cp -f mutt-wizard.muttrc $(DESTDIR)$(PREFIX)/share/mutt-wizard
	cp -f domains.csv $(DESTDIR)$(PREFIX)/share/mutt-wizard
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f mw.1 $(DESTDIR)$(MANPREFIX)/man1/mw.1

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/bin/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/mutt-wizard

.PHONY: install uninstall
