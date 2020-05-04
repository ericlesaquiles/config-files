(TeX-add-style-hook
 "config"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "fixltx2e"
    "graphicx"
    "longtable"
    "float"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "marvosym"
    "wasysym"
    "amssymb"
    "hyperref")
   (LaTeX-add-labels
    "sec-1"
    "sec-1-1"
    "sec-1-1-1"
    "sec-1-1-2"
    "sec-1-1-3"
    "sec-1-1-4"
    "sec-1-1-5"
    "sec-1-1-6"
    "sec-1-1-7"
    "sec-1-1-8"
    "sec-1-1-9"
    "sec-1-1-10"
    "sec-1-1-11"
    "sec-1-1-12"
    "sec-1-1-13"
    "sec-1-2"
    "sec-1-2-0-1"
    "sec-1-2-0-2"
    "sec-1-2-0-3"
    "sec-1-2-0-4"
    "sec-1-2-0-5"
    "sec-1-2-0-6"
    "sec-1-2-0-7"
    "sec-1-2-0-7-1"
    "sec-1-2-0-7-2"
    "sec-1-2-0-7-3"
    "sec-1-3"
    "sec-1-4"
    "sec-2"
    "sec-2-1"
    "sec-2-2"
    "sec-2-3"
    "sec-2-4"
    "sec-2-5"
    "sec-2-6"
    "sec-2-7"
    "sec-2-8"
    "sec-2-9"
    "sec-3"
    "sec-3-1"
    "sec-4"
    "sec-4-1"
    "sec-5"
    "sec-5-1"
    "sec-6"
    "sec-6-1"
    "sec-6-2"
    "sec-7"
    "sec-8"
    "sec-8-1"
    "sec-8-2"
    "sec-8-3"
    "sec-8-4"
    "sec-9"
    "sec-9-1"
    "sec-10"
    "sec-10-1"
    "sec-11"
    "sec-11-1"
    "sec-11-2"
    "sec-12"))
 :latex)

