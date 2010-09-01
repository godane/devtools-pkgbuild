V=0.9.9

all:

install:
	# new chroot tools, only usable by root
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -m 755 absbb $(DESTDIR)/usr/sbin
	install -m 755 archbb.sh $(DESTDIR)/usr/sbin/archbb
	install -m 755 makechrootpkg $(DESTDIR)/usr/sbin
	# install default config
	install -d -m 755 $(DESTDIR)/usr/share/devtools
	install -m 644 makepkg-i686.conf $(DESTDIR)/usr/share/devtools
	install -m 644 makepkg-x86_64.conf $(DESTDIR)/usr/share/devtools
	install -m 644 pacman-extra.conf $(DESTDIR)/usr/share/devtools
	install -m 644 pacman-testing.conf $(DESTDIR)/usr/share/devtools
	install -m 644 pacman-staging.conf $(DESTDIR)/usr/share/devtools
	install -m 644 pacman-multilib.conf $(DESTDIR)/usr/share/devtools
	install -m 644 mirrorlist $(DESTDIR)/usr/share/devtools/mirrorlist
	install -m 644 absbb.conf $(DESTDIR)/etc
	# PKGBUILD.com specific scripts
	install -m 755 unlock $(DESTDIR)/usr/bin
	# PKGBUILD.com specific configs
	install -m 644 pacman.conf $(DESTDIR)/usr/share/devadd/pacman.conf
	install -m 644 pacman-testing.conf $(DESTDIR)/usr/share/devadd/pacman-testing.conf
	install -m 644 bashrc $(DESTDIR)/usr/share/devadd/bashrc
	# Please setup the mirrorlist file in /usr/share/devadd with your preferred mirrors.

uninstall:
	# remove all files we installed
	rm $(DESTDIR)/usr/bin/unlock
	rm $(DESTDIR)/usr/sbin/archbb
	rm $(DESTDIR)/usr/sbin/makechrootpkg
	rm $(DESTDIR)/usr/sbin/makerepo
	rm $(DESTDIR)/usr/share/devadd/pacman.conf
	rm $(DESTDIR)/usr/share/devadd/pacman-testing.conf
	rm $(DESTDIR)/usr/share/devadd/bashrc
	rm $(DESTDIR)/usr/share/devtools/makepkg-i686.conf
	rm $(DESTDIR)/usr/share/devtools/makepkg-x86_64.conf
	rm $(DESTDIR)/usr/share/devtools/pacman-extra.conf
	rm $(DESTDIR)/usr/share/devtools/pacman-testing.conf
	rm $(DESTDIR)/usr/share/devtools/pacman-staging.conf
	rm $(DESTDIR)/usr/share/devtools/pacman-multilib.conf
	rm $(DESTDIR)/usr/share/devtools/mirrorlist
	
dist:
	git archive --format=tar --prefix=devtools-pkgbuild-$(V)/ $(V) | gzip -9 > devtools-pkgbuild-$(V).tar.gz
