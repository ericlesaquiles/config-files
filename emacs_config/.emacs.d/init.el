(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((Lowercase . T)
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

(autoload 'eclipse-mode "/home/ericles/Projetos/third-party-programs/eclipse/clp/lib_public/eclipse.el" "ECLIPSE editing mode" t)
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
