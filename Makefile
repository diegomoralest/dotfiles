all: clean
	mkdir -p out
	find . -type d \( ! -ipath './.*' ! -iname '.*' ! -ipath './out/*' ! -iname 'out' \) -exec cp -r {} out \;

install:
	mkdir -p $(DESTDIR)$(sysconfdir)/dotfiles
	find . -type d \( ! -ipath './.*' ! -iname '.*' ! -ipath './out/*' ! -iname 'out' \) -exec cp -r {} $(DESTDIR)$(sysconfdir)/dotfiles \;

clean:
	[[ -f out ]] && rm -r out || :
