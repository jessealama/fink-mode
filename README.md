fink-info: Edit Fink package description files in Emacs
==========

This package provides a simple Emacs mode for editing [Fink](http://www.finkproject.org) package
description files.

Installation
----------

A Makefile is included in the distribution.  Just do `make` to compile
everything, and `make install` to install.  You may need to edit the
path where Emacs is installed; look in the Makefile and edit the value
of the `emacs` variable.  A reasonable default is assumed for the
installation location; if you want to change it, edit the value of the
`install-dir` variable in the Makefile.

Finally, modify your Emacs initialization file (usually `.emacs` in
your home directory) so that `fink-mode` is used whenever you're
working with Fink package description files.  In my `.emacs` I have:

    (push "~/share/emacs/site-lisp/fink" load-path)
    (autoload 'fink-mode "fink-mode.el"
       "Major mode for working with Fink package descriptions files" t)
    (add-to-list 'auto-mode-alist
    	     (cons "\\.info" 'fink-mode))


Thanks
----------

This work was initially cloned from Sebastian Maret's `fink-mode.el`.
