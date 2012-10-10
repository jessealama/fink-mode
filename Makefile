.PHONY: all clean install

elisp-files = fink-mode
els = $(addsuffix .el,$(elisp-files))
elcs = $(addsuffix .elc,$(elisp-files))
editable-files = $(els) Makefile README.md
emacs-backups = $(addsuffix ~,$(editable-files))

# change accordingly
emacs = /Applications/Emacs.app/Contents/MacOS/Emacs
empty :=
install-root = $(if $(HOME),$(HOME),$(empty))
install-dir = $(install-root)/share/emacs/site-lisp/fink

# functions

all: $(elcs)

%.elc: %.el
	$(emacs) --no-window-system \
                 --no-site-file \
                 --no-init-file \
                 --batch \
                 --directory '.' \
                 --funcall batch-byte-compile $*.el

clean:
	rm -f $(emacs-backups)
	rm -f $(elcs)

install: $(elcs)
	mkdir -p $(install-dir)
	for el in $(els); do cp $$el $(install-dir); done
	for elc in $(elcs); do cp $$elc $(install-dir); done
