
(defalias 'yes-or-no-p 'y-or-n-p)

(global-prettify-symbols-mode t)

(add-hook 'text-mode-hook
          (turn-on-auto-fill))

(global-set-key (kbd "C-c q") 'auto-fill-mode)

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
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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

(setq powerline-default-separator nil)

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

;(setq slime-lisp-implementations
      ;'((sbcl ("sbcl" "--core" "~/.emacs.d/sbcl.core-for-slime"))))

(global-set-key "\C-cs" 'slime-selector)  ;; Set key binding to slime-selector

(use-package racket-mode
  :ensure t)

(use-package paredit
             :ensure t
             :config
(add-hook 'racket-mode-hook #'enable-paredit-mode))

;; (use-package scheme-smart-complete
;;   :ensure t)

(setq scheme-program-name "racket")

(setq auto-mode-alist (cons '("\\.scm" . racket-mode) auto-mode-alist))

(use-package geiser
  :ensure t)

(defun mechanics ()
  (interactive)
  (run-scheme 
   "/usr/local/scmutils/mit-scheme/bin/scheme --library /usr/local/scmutils/mit-scheme/lib"
  ))

(autoload 'eclipse-mode "/home/ericles/.emacs.d/eclipse_emacs/eclipse.el" "ECLIPSE editing mode" t)
(setq auto-mode-alist (cons '("\\.pl" . eclipse-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ecl" . eclipse-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
              (lambda ()
                (rainbow-delimiters-mode)
                (company-mode)
                (smartparens-mode)
                (turn-on-reftex)
                (setq reftex-plug-into-AUCTeX t)
                (reftex-isearch-minor-mode)
                (setq TeX-PDF-mode t)
                (setq TeX-source-correlate-method 'synctex)
                (setq TeX-source-correlate-start-server t))
      )

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
              #'TeX-revert-document-buffer)

  ;; to use pdfview with auctex
  (add-hook 'LaTeX-mode-hook 'pdf-tools-install)

  ;; to use pdfview with auctex
  (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
          TeX-source-correlate-start-server t)
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
 )

;; (use-package auctex
;;   :ensure t)

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

(setq ido-enable-flex-matching nil)
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
  ("M-g" . magit-status))

(global-set-key (kbd "C-x b") 'ibuffer)

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
