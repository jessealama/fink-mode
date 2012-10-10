.PHONY: all clean

elisp-files = fink-mode
els = $(addsuffix .el,$(elisp-files))
elcs = $(addsuffix .elc,$(elisp-files))
editable-files = $(els) Makefile README.md
emacs-backups = $(addsuffix ~,$(editable-files))

# change accordingly
emacs = /Applications/Emacs.app/Contents/MacOS/Emacs

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
