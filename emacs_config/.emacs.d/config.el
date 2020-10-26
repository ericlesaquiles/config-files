(defalias 'yes-or-no-p 'y-or-n-p)

(global-prettify-symbols-mode t)
(add-hook 'racket-mode-hook
          (lambda ()
            (push '("lambda" . ?λ) prettify-symbols-alist)))

(add-hook 'text-mode-hook
          (turn-on-auto-fill))

(global-set-key (kbd "C-c q") 'auto-fill-mode)

(setq-default auto-fill-function 'do-auto-fill)

(global-subword-mode 1)

(defun kill-previous-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w p") 'kill-previous-word)

(menu-bar-mode -1)
(tool-bar-mode 0)
(scroll-bar-mode -1)

(setq backup-directory-alist
      `((".*" . "~/.emacs.d/.backup-files")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/.backup-files")))

(global-linum-mode t)

(global-set-key (kbd "C-c l k") 'kill-whole-line)

(defun daedreth/copy-whole-line ()
  "Copies a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c l c") 'daedreth/copy-whole-line)

(defun kill-forward-word ()
  (interactive)
  (kill-word 1))
(global-set-key (kbd "C-c w f") 'kill-forward-word)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(use-package transpose-frame
  :ensure t)

(setq powerline-default-separator nil)

(use-package multiple-cursors
  :ensure t)
(require 'multiple-cursors)

;; When you have an active region that spans multiple lines, the
;; following will add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous
;; lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package yasnippet
    :ensure t)
  (yas-global-mode 1)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(use-package yasnippet-snippets
  :ensure t)

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package sudo-edit
  :ensure t
  :bind
    ("s-e" . sudo-edit))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(use-package buffer-move
  :ensure t)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(define-key ctl-x-4-map (kbd "t") 'transpose-windows)

(use-package switch-window
  :ensure t
  :config
    (setq switch-window-input-style 'minibuffer)
    (setq switch-window-increase 4)
    (setq switch-window-threshold 2)
    (setq switch-window-shortcut-style 'qwerty)
    (setq switch-window-qwerty-shortcuts
        '("a" "s" "d" "f" "j" "k" "l" "i" "o"))
  :bind
    ([remap other-window] . switch-window))

;;  (use-package ivy
  ;;  :ensure t)

;; (use-package swiper
;;   :ensure t
;;   :bind ("C-s" . 'swiper))

;; (use-package helm
;;   :ensure t)

(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 30)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))

(add-to-list 'org-structure-template-alist
               '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
               '("sc" "#+BEGIN_SRC scheme\n?\n#+END_SRC"))

;; (setq geiser-default-implementation 'racket)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)
   (emacs-lisp . t)
   (ruby . t)
   (R . t)
   (python . t)
   (C . t)
   (shell . t)))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; (load (expand-file-name "~/.roswell/helper.el"))
;; (setq inferior-lisp-program "ros -Q run")
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(safe-local-variable-values
;;    (quote
;;     ((Package . Kernel)
;;      (Log . C\.Log)
;;      (Package . LISP)
;;      (Package . KERNEL)
;;      (Package . Lisp)
;;      (Log . code\.log)
;;      (Package . conditions)
;;      (Lowercase . T)
;;      (Base . 10)
;;      (Package . loop)
;;      (whitespace-style quote
;;                        (face trailing empty tabs))
;;      (whitespace-action)))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; (setq create-lockfiles nil)

;; (add-to-list 'load-path "~/Projetos/Programming/Lisp/JSK/euslime_dir/slime")
;; (add-to-list 'load-path "~/Projetos/Programming/Lisp/JSK/euslime_dir/euslime")
;; (add-to-list 'load-path "~/Projetos/Programming/Lisp/JSK/euslime_dir/slime-repl-ansi-color")
;; (require 'slime-autoloads)
;; (require 'euslime)
;; (setq inferior-lisp-program "sbcl")
;; (setq inferior-euslisp-program "roseus")
;; (slime-setup '(slime-fancy slime-repl-ansi-color slime-banner))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;; (setq slime-lisp-implementations
;;       '((sbcl ("sbcl" "--conre" "~/.emacs.d/sbcl.core-for-slime"))))

;; (use-package slime
;;   :ensure t)

(slime-setup)

(setq slime-startup-animation t)

;; (setq inferior-lisp-program "/usr/local/bin/ccl")
;; ;;(setq inferior-lisp "/usr/bin/sbcl")
;; ;;(setq slime-default-lisp "/usr/local/bin/ccl")
;; ;;(setq slime-lisp-implementations
;; ;;  '((ccl ("ccl" "-quiet"))
;; ;;    (sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(setq slime-contribs '(slime-fancy))

;; (global-set-key "\C-cs" 'slime-selector)  ;; Set key binding to slime-selector

(use-package racket-mode
  :ensure t)

(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
	       racket-mode-hook
	       racket-repl-mode-hook))
    (add-hook m #'paredit-mode))
  (bind-keys :map paredit-mode-map
	     ("{"   . paredit-open-curly)
	     ("}"   . paredit-close-curly))
  (unless terminal-frame
    (bind-keys :map paredit-mode-map
	       ("M-[" . paredit-wrap-square)
	       ("M-{" . paredit-wrap-curly))))

;; (use-package paredit
;; 	     :ensure t
;; 	     :config
;; (add-hook 'racket-mode-hook #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook #'enable-paredit-mode))

;; (use-package scheme-smart-complete
;;   :ensure t)

;; (setq scheme-program-name "racket")

;; (setq auto-mode-alist (cons '("\\.scm" . racket-mode) auto-mode-alist))

;; (use-package geiser
;;   :ensure t)

(defun mechanics ()
  (interactive)
  (run-scheme 
   "/usr/local/scmutils/mit-scheme/bin/scheme --library /usr/local/scmutils/mit-scheme/lib"
  ))

(use-package julia-mode
  :ensure t)

(autoload 'eclipse-mode "/home/ericles/.emacs.d/eclipse_emacs/eclipse.el" "ECLIPSE editing mode" t)
(setq auto-mode-alist (cons '("\\.pl" . eclipse-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ecl" . eclipse-mode) auto-mode-alist))

(use-package sml-mode
  :ensure t)

(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))
(add-hook 'octave-mode-hook
    (lambda () (progn (setq octave-comment-char ?%)
                      (setq comment-start "% ")
                      (setq comment-add 0))))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(setq elpy-rpc-python-command "python3")

(use-package seeing-is-believing
  :ensure t)
;(setq seeing-is-believing-prefix "C-.")
(add-hook 'ruby-mode-hook 'seeing-is-believing)

(use-package inf-ruby
  :ensure t)
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(use-package csharp-mode
  :ensure t)

;(use-package ess
;  :ensure t
;  :init (require 'ess-site))

;; (use-package tex-site
;;   :ensure auctex
;;   :mode ("\\.tex\\'" . latex-mode)
;;   :config
;;   (setq TeX-auto-save t)
;;   (setq TeX-parse-self t)
;;   (setq-default TeX-master nil)
;;   (add-hook 'LaTeX-mode-hook
;;               (lambda ()
;;                 (rainbow-delimiters-mode)
;;                 (company-mode)
;;                 (smartparens-mode)
;;                 (turn-on-reftex)
;;                 (setq reftex-plug-into-AUCTeX t)
;;                 (reftex-isearch-minor-mode)
;;                 (setq TeX-PDF-mode t)
;;                 (setq TeX-source-correlate-method 'synctex)
;;                 (setq TeX-source-correlate-start-server t)))

;; ;;   ;; Update PDF buffers after successful LaTeX runs
;; ;;   (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;; ;;               #'TeX-revert-document-buffer)

;; ;;   ;; to use pdfview with auctex
;; ;;   (add-hook 'LaTeX-mode-hook 'pdf-tools-install)

;; ;;   ;; to use pdfview with auctex
;; ;;   (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
;; ;;           TeX-source-correlate-start-server t)
;; ;;   (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))

;; (use-package auctex
;;   :ensure t)

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)
(require 'tex)
(TeX-global-PDF-mode t)

(use-package latex-preview-pane
  :ensure t)

(latex-preview-pane-enable)

(setq org-src-window-setup 'current-window)

(add-to-list 'load-path "~/.emacs.d/linum-off")
(require 'linum-off)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
         (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.              
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("M-t" . magit-status))

(global-set-key (kbd "C-x b") 'ibuffer)

(use-package haml-mode
  :ensure t)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package avy
             :ensure t
             :bind
             ("M-s" . avy-goto-char))
