V=0.9.7

all:

install:
	# commitpkg/checkpkg and friends
	mkdir -p $(DESTDIR)/usr/bin
	install -m 755 checkpkg $(DESTDIR)/usr/bin
	install -m 755 commitpkg $(DESTDIR)/usr/bin
	ln -sf commitpkg $(DESTDIR)/usr/bin/extrapkg
	ln -sf commitpkg $(DESTDIR)/usr/bin/corepkg
	ln -sf commitpkg $(DESTDIR)/usr/bin/testingpkg
	ln -sf commitpkg $(DESTDIR)/usr/bin/communitypkg
	ln -sf commitpkg $(DESTDIR)/usr/bin/community-testingpkg
	# arch{co,release,rm}
	install -m 755 archco $(DESTDIR)/usr/bin
	install -m 755 communityco $(DESTDIR)/usr/bin
	install -m 755 archrelease $(DESTDIR)/usr/bin
	install -m 755 archrm $(DESTDIR)/usr/bin
	# new chroot tools, only usable by root
	mkdir -p $(DESTDIR)/usr/sbin
	install -m 755 mkarchroot $(DESTDIR)/usr/sbin
	install -m 755 makechrootpkg $(DESTDIR)/usr/sbin
	# Additional packaging helper scripts
	install -m 755 lddd $(DESTDIR)/usr/bin
	install -m 755 finddeps $(DESTDIR)/usr/bin
	install -m 755 rebuildpkgs $(DESTDIR)/usr/bin
	# PKGBUILD.com specific scripts
	install -m 755 chrootupdate $(DESTDIR)/usr/bin
	install -m 755 chrootstatus $(DESTDIR)/usr/bin
	install -m 755 unlock $(DESTDIR)/usr/bin
	install -m 755 devadd $(DESTDIR)/usr/bin
	# PKGBUILD.com specific configs
	install -m 644 pacman.conf $(DESTDIR)/usr/share/devadd/pacman.conf
	install -m 644 pacman-testing.conf $(DESTDIR)/usr/share/devadd/pacman-testing.conf
	install -m 644 mirrorlist $(DESTDIR)/usr/share/devadd/mirrorlist
	install -m 644 bashrc $(DESTDIR)/usr/share/devadd/bashrc
	# Please setup the mirrorlist file in /usr/share/devadd with your preferred mirrors.

uninstall:
	# remove all files we installed
	rm $(DESTDIR)/usr/bin/checkpkg
	rm $(DESTDIR)/usr/bin/commitpkg
	rm $(DESTDIR)/usr/bin/extrapkg
	rm $(DESTDIR)/usr/bin/corepkg
	rm $(DESTDIR)/usr/bin/testingpkg
	rm $(DESTDIR)/usr/bin/communitypkg
	rm $(DESTDIR)/usr/bin/community-testingpkg
	rm $(DESTDIR)/usr/sbin/mkarchroot
	rm $(DESTDIR)/usr/sbin/makechrootpkg
	rm $(DESTDIR)/usr/bin/lddd
	rm $(DESTDIR)/usr/bin/finddeps
	rm $(DESTDIR)/usr/bin/archco
	rm $(DESTDIR)/usr/bin/archrelease
	rm $(DESTDIR)/usr/bin/archrm
	rm $(DESTDIR)/usr/bin/communityco
	rm $(DESTDIR)/usr/bin/rebuildpkgs
	rm $(DESTDIR)/usr/bin/chrootupdate
	rm $(DESTDIR)/usr/bin/chrootstatus
	rm $(DESTDIR)/usr/bin/unlock
	rm $(DESTDIR)/usr/bin/devadd
	rm $(DESTDIR)/usr/share/devadd/pacman.conf
	rm $(DESTDIR)/usr/share/devadd/pacman-testing.conf
	rm $(DESTDIR)/usr/share/devadd/mirrorlist
	rm $(DESTDIR)/usr/share/devadd/bashrc

dist:
	git archive --format=tar --prefix=devtools-pkgbuild-$(V)/ $(V) | gzip -9 > devtools-pkgbuild-$(V).tar.gz
