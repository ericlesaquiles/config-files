(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq scroll-conservatively 100)
(setq make-backup-file nil)
(setq auto-save-default nil)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(when window-system (global-hl-line-mode t))

(show-paren-mode 1)

;; Want org-mode TODO to count its children
(setq org-hierarchical-todo-statistics nil)

;; (setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (transpose-frame haml-mode ess buffer-move rotate-window slime swiper ivy true magit which-key use-package switch-window sudo-edit smex racket-mode paredit org-bullets ido-vertical-mode hungry-delete geiser fancy-battery expand-region beacon avy auctex)))
 '(safe-local-variable-values
   (quote
    ((Syntax . Common-Lisp)
     (whitespace-style quote
		       (face trailing empty tabs))
     (whitespace-action)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
