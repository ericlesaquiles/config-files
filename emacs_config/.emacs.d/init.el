(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;; (use-package tex-site
;;   :ensure auctex
;;   :mode ("\\.tex\\'" . latex-mode)
;;   :config
;;   (setq TeX-auto-save t)
;;   (setq TeX-parse-self t)
;;   (setq-default TeX-master nil)
;;   ;; (add-hook 'LaTeX-mode-hook
;;   ;; 	    (lambda ()
;;   ;; 	      (rainbow-delimiters-mode)
;;   ;; 	      (company-mode)
;;   ;; 	      (smartparens-mode)
;;   ;; 	      (turn-on-reftex)
;;   ;; 	      (setq reftex-plug-into-AUCTeX t)
;;   ;; 	      (reftex-isearch-minor-mode)
;;   ;; 	      (setq TeX-PDF-mode t)
;;   ;; 	      (setq TeX-source-correlate-method 'synctex)
;;   ;; 	      (setq TeX-source-correlate-start-server t))
;;   ;;	    )

;;   ;; ;; Update PDF buffers after successful LaTeX runs
;;   ;; (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;;   ;; 	    #'TeX-revert-document-buffer)

;;   ;; ;; to use pdfview with auctex
;;   ;; (add-hook 'LaTeX-mode-hook 'pdf-tools-install)

;;   ;; ;; to use pdfview with auctex
;;   ;; (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
;;   ;; 	TeX-source-correlate-start-server t)
;;   ;; (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
;;   )

;; (use-package auctex
;;   :ensure t)













(defalias 'yes-or-no-p 'y-or-n-p)

;; (global-set-key (kod "<s-return>") 'ansi-term)

(setq scroll-conservatively 100)
(setq make-backup-file nil)
(setq auto-save-default nil)

(add-to-list 'load-path "~/.emacs.d/linum-off")

;; (when window-system (global-hl-line-mode t))

(global-prettify-symbols-mode t)

(show-paren-mode 1)

(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((Log . C\.Log)
     (Package . LISP)
     (Package . KERNEL)
     (Package . Lisp)
     (Log . code\.log)
     (Package . conditions)
     (Lowercase . T)
     (Base . 10)
     (Package . loop)
     (whitespace-style quote
		       (face trailing empty tabs))
     (whitespace-action)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq create-lockfiles nil)


;;;
;;; Eclipse editing facilities
;;;

(autoload 'eclipse-mode "/home/ericles/.emacs.d/eclipse_emacs/eclipse.el" "ECLIPSE editing mode" t)
(setq auto-mode-alist (cons '("\\.pl" . eclipse-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ecl" . eclipse-mode) auto-mode-alist))


;;
;; Show line numbers
;;

(global-linum-mode t)			

;;
;; Slime configs
;;

;(setq slime-lisp-implementations
      ;'((sbcl ("sbcl" "--core" "~/.emacs.d/sbcl.core-for-slime"))))

(global-set-key "\C-cs" 'slime-selector)  ;; Set key binding to slime-selector


;;
;; org-mode configs
;;

;; Disables linum on org-mode due to efficiency reasons
(require 'linum-off)
;; Want TODO to count its children
(setq org-hierarchical-todo-statistics nil)

;;
;; Make Octave-mode recognize .m
;;

(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

;;
;; Take menu-bar out
;;

(menu-bar-mode -1)

;;
;; Save backup files in tmp
;;

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; 
;; Auto-fill mode (insert line breaks)
;;
;; (add-hook 'text-mode-hook
;; 	  (lambda ()
;; 	    (when (y-or-n-p "Auto Fill mode? ")
;; 	      (turn-on-auto-fill))))
(add-hook 'text-mode-hook
	  (turn-on-auto-fill))

(global-set-key (kbd "C-c q") 'auto-fill-mode)

;;
;; Ctags config
;;

;; (setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here

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

;;;

;; (use-package switch-window
;;   :ensure t
;;   :config
;;   (setq switch-window-input-style 'minibuffer)
;;   (setq switch-window-increase 4)
;;   (setq switch-window-threshold 2)
;;   (setq switch-window-shortcut-style 'qwerty)
;;   (setq switch-window-qwerty-shortcuts
;; 	'("a" "s" "d" "f" "j" "k" "l"))
;;   :bind
;;   ([remap other-window] . switch-window))
