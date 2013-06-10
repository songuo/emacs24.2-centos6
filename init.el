;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Songuo's Emacs Environment
;; http://songuo.sinaapp.com  http://songuooo.appspot.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Personal Information
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Guo Song")
(setq user-mail-address "songguo.hit@gmail.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic system customization
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-theme-load-path (quote (custom-theme-directory t "~/.emacs.d/songuo-themes/")))
 '(ecb-options-version "2.40") ; For compatible
 '(inhibit-startup-screen t)
'(menu-bar-mode nil)
 '(same-window-buffer-names (quote ("*mail*" "*inferior-lisp*" "*ielm*" "*scheme*")))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote sendmail-send-it))
 '(tool-bar-mode nil nil (tool-bar))
 '(global-linum-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-type-face ((t (:foreground "cyan"))))
 '(linum ((t (:inherit shadow :background "black"))) t))


;; Set initial frame 
(setq 
 default-frame-alist  
     '((wait-for-wm . nil)
       (top . 45) (left . 500)
       (width . 80) (height . 40)
       (border-color . "red"))
 initial-frame-alist
     '((top . 0) (left . 580)
       (width . 80) (height . 45)))

; Set font type and font size
;(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)
(set-face-attribute 'default nil :height 120)

;; (put 'scroll-left 'disabled nil)
(display-time) ;; Display time in status bar of Emacs

; highlight the current line
(global-hl-line-mode 1)

;; show parens matching
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Place backup files in specific directory
;; Enable backup files
(setq make-backup-files t)

;; Enable version control  with default values(keep last five versions?)
(setq version-control t)

;; Save all backups in this directory
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups"))))

;; Enable line and column numbering
(line-number-mode 1)
(column-number-mode 1)
;;(linum-mode 1)

;; Set fill column 
;;(setq-default fill-column 72)

; Abbrev
;;(setq-default abbrev-mode t) ;; Abbrev mode when emacs starts up.
(read-abbrev-file "~/.emacs.d/abbrev_defs") ;; Read abbrev defination files.
(setq save-abbrevs t)
;(setq save-abbrevs silently) ; Do not ask before saving

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End basic system customization
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Now these are my basic configuration for using Emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Library Paths
;; Note: I like to keep every emacs library underneath
;;   ~/.emacs.d and I shun loading them from system paths.
;; This makes it easier to use this config on multiple systems.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d")
; Add all top-level subdirectories of .emacs.d to the load path
; This can cause cedet finding eieio semantic error
;(progn (cd "~/.emacs.d")
 ;    (normal-top-level-add-subdirs-to-load-path))


; I like to keep third party libraries seaperate in ~/.emacs.d/third-party
(add-to-list 'load-path "~/.emacs.d/third-party")
;; I think this third-parth path should load optionally
;(progn (cd "~/.emacs.d/third-party")
;       (normal-top-level-add-subdirs-to-load-path))

(require 'pager)

(load-library "songuo-auto-complete")
(load-library "songuo-java")
(load-library "songuo-python")
(load-library "songuo-html")
(load-library "songuo-yasnippet")
(load-library "songuo-fci")
(load-library "songuo-shell")
(load-library "songuo-functions")
(load-library "songuo-keyboards")


;; theme must be in custom-theme-load-path, which is a variable
(load-theme 'songuo-emacs24 t)

