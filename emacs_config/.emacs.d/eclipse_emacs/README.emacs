This is the version of the eclipse mode for GNU emacs (Mar 2016),
contributed by Thorsten Winterer.

------------------
Emacs ECLiPSe mode
------------------

If you use the GNU emacs editor, an ECLiPSe mode is now provided for it.
It is not part of the ECLiPSe distribution, and you need to download it
separately. **Version 20 (or later) of GNU emacs is required.** This mode
is based on the prolog mode by Umeda, with contributions by D.Dreisigmeyer
and provides extensive syntax colouring for ECLiPSe-specific features.
See http://www.gnu.org/ if you need more information on GNU and its software.

In order to use this mode, add the following line to your .emacs file:

(autoload 'eclipse-mode "<eclipsedir>/lib_public/eclipse.el" "ECLIPSE editing mode" t)

where <eclipsedir> is the path to your ECLiPSe installation directory.

You may also need to add these lines so that the .pl and .ecl extensions
are recognised to be ECLiPSe programs:

(setq auto-mode-alist (cons '("\\.pl" . eclipse-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ecl" . eclipse-mode) auto-mode-alist))

The eclipse.el file needs to be placed somewhere where your emacs can find
it.

See the start of the eclipse.el file for some instructions on using this mode.

-
