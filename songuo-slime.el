
;; For SLIME
;; (tool-bar-mode -1) ;; Close Emacs tool bar
;; (menue-bar-mode -1) ;; Close Emacs menu bar
;;(add-to-list 'load-path' "/path/to/yout/slime/directory")
;(setq inferior-lisp-program "/usr/bin/sbcl") ;; SBCL or Clisp
;(require 'slime)
;(slime-setup '(slime-fancy))
;; (slime) ;; M-x slime

;(defun lisp-indent-or-complete (&optional arg)
;  (interactive "p")
;  (if (or (looking-back "^\\s-*") (bolp))
;      (call-interactively 'lisp-indent-line)
;      (call-interactively 'slime-indent-and-complete-symbol)))
	;(eval-after-load "lisp-mode"
	;  '(progn
;     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))

