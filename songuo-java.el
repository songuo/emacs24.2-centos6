;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JDEE and CEDET configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq 
 jde-jdk-registry 
      (quote (("1.6.0_37" . "/usr/local/java/jdk1.6.0_37")))
 ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)
)

(load-theme 'songuo-jde t)


; Load CEDETc
; Please unpack the cedet tar.gz or zip file to corresponding 
; direcory.
;(add-to-list 'load-path "~/.emacs.d/third-party/cedet-1.1/eieio")
(load-file "~/.emacs.d/third-party/cedet-1.1/common/cedet.elc")

; Turn on CEDET's fun parts
;(setq semantic-load-turn-useful-things-on t)

; Set the debug option to enable a backtrace when a problem occurs.
(setq debug-on-error t)

;; Update the Emacs load-path to include the path to the JDEE and its require
; package. This code assumes that you have installed the packages in the
; /usr/local/share/emacs/site-lisp directory. Adjust appropriately.
; (1) (add-to-list 'load-path "~/.emacs.d/...")
; (2) (setq load-path (append (list "~/.emacs.d/...") load-path))
; (3)

(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/third-party/jdee-2.4.0.1/lisp"))
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/third-party/cedet-1.1/common"))
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/third-party/elib-1.0"))
(add-to-list 'load-path "~/.emacs.d/third-party/ecb-2.40")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load ecb
; If you want to load the complete ECB at (X)Emacs-loadtime 
;; (Advantage: All ECB-options available after loading ECB. 
;; Disadvantage: Increasing loadtime2):
;; (require 'ecb)
;; If you want to load the ECB first after starting it by ecb-activate 
;; (Advantage: Fast loading3. 
;; Disadvantage: ECB- and semantic-options first available after starting ECB):
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ecb-autoloads)  ; M-x ecb-activate
(setq ecb-tip-of-the-day nil)

;;you’ll need some Elisp to prevent fatal errors:
(setq jde-check-version-flag nil)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")
(unless (fboundp 'semantic-format-prototype-tag-java-mode)
  (defalias 'semantic-format-prototype-tag-java-mode 'semantic-format-tag-prototype-java-mode))
(require 'hippie-exp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; If you want Emacs to defer loading the JDEE until you open a
;; Java file, edit the following line
;; (setq defer-loading-jde nil) to read:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (locate-library "jde")
  (setq defer-loading-jde t)
  (if defer-loading-jde
      (progn
	(autoload 'jde-mode "jde" "JDE mode." t)
	(setq auto-mode-alist
	      (append '(("\\.java\\'" . jde-mode))
		      auto-mode-alist)))
    (require 'jde))
  (add-hook 'jde-mode-hook 
	    (lambda ()
	      (setq jde-enable-abbrev-mode t)
	      ;(jde-abbrev-mode)
	      (define-key jde-mode-map (kbd "RET") 'newline-and-indent)))
  );; when locate-library end

