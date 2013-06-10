;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuring Emacs as a Python IDE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'songuo-python t)

(setenv "PYMACS_PYTHON" "python2.6")
(setq py-install-directory "~/.emacs.d/third-party/python-mode.el-6.1.1")
(add-to-list 'load-path py-install-directory)
(require 'python)
(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Preinstall pymacs, ropemacs, rope. They are all python libraries.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Pymacs
(add-to-list 'load-path "~/.emacs.d/third-party/pymacs-0.25")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; Rope
;; Initialize Rope 
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;Add autocomplete rope integration
(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources 'ac-source-ropemacs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto-completion               
;;;  Integrates:                  
;;;   1) Rope           
;;;   2) Yasnippet   
;;;   all with AutoComplete.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'python-mode-hook
	  (lambda ()
	    (defun prefix-list-elements (list prefix)
	      (let (value)
		(nreverse
		 (dolist (element list value)
		   (setq value (cons (format "%s%s" prefix element) value))))))
	    
	    (defvar ac-source-rope
	      '((candidates
		 . (lambda ()
		     (prefix-list-elements (rope-completions) ac-target))))
	      "Source for Rope")
	    (defun ac-python-find ()
	      "Python `ac-find-function'."
	      (require 'thingatpt)
	      (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
		(if (null symbol)
		    (if (string= "." (buffer-substring (- (point) 1) (point)))
			(point)
		      nil)
		  symbol)))

	    (defun ac-python-candidate ()
	      "Python `ac-candidates-function'"
	      (let (candidates)
		(dolist (source ac-sources)
		  (if (symbolp source)
		      (setq source (symbol-value source)))
		  (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
			 (requires (cdr-safe (assq 'requires source)))
			 cand)
		    (if (or (null requires)
			    (>= (length ac-target) requires))
			(setq cand
			      (delq nil
				    (mapcar (lambda (candidate)
					      (propertize candidate 'source source))
					    (funcall (cdr (assq 'candidates source)))))))
		    (if (and (> ac-limit 1)
			     (> (length cand) ac-limit))
			(setcdr (nthcdr (1- ac-limit) cand) nil))
		    (setq candidates (append candidates cand))))
		(delete-dups candidates)))
	   ; (add-hook 'python-mode-hook
             ; (lambda ()
	    (auto-complete-mode 1)
	    (set (make-local-variable 'ac-sources)
		 (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
	    (set (make-local-variable 'ac-find-function) 'ac-python-find)
	    (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
	    (set (make-local-variable 'ac-auto-start) nil) ;;))

	    ;;My python specific tab completion         
	    (defun songuo-python-tab ()
  ; Try the following:
  ; 1) Do a yasnippet expansion 
  ; 2) Do a Rope code completion                                
  ; 3) Do an indent
	      (interactive)
	      (if (eql (ac-start) 0)
		  (indent-for-tab-command)))
	    (defadvice ac-start (before advice-turn-on-auto-start activate)
	      (set (make-local-variable 'ac-auto-start) t))
	    (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
	      (set (make-local-variable 'ac-auto-start) nil))
	    (define-key python-mode-map (kbd "<tab>") 'songuo-python-tab)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;; End Auto Completion  
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; for django htmls
;(load "~/.emacs.d/third-party/nxhtml/autostart.el")
;(setq mumamo-background-colors nil)
;(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq-default py-buffer-name "ipython") ;; for emacs24
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=qt" "--pylab=qt" "--colors=Linux"))
(setq py-force-py-shell-name-p t)

;swith to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p t)
; try to automatically figure out indentation
(setq py-smart-indentation t)

