;;yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/third-party/yasnippet-0.7")
(require 'yasnippet)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Autocomplete Stumbles on Yasnippet. They are conflicted 
;; with some key bindings.
;; When M-x auto-complete, the error occurrs:
;; ac-yasnippet-candidates: Symbol's function definition is void: yas/current-snippet-table
;; Now, check: C-h v ac-sources
;; To solve the problem (see below):
;; (setq ac-source-yasnippet nil);;
;; and modify: 
;; ~/.emacs.d/yasnippet-0.7/snippet.el
;; modify yasnippet.el yas-expand key binding: line 639, 640, 641
(define-key yas-minor-mode-map (kbd "C-c <SPC>") 'yas-expand)

(yas/global-mode 1)
;(yas--initialize)
;(yas/initialize)

;; It should be loaded based on mode at best
;(yas-load-directory "~/.emacs.d/third-party/yasnippet-0.7/snippets")

(add-hook 'jde-mode-hook
	  (lambda ()
	    (yas-load-directory "~/.emacs.d/snippets/java")
))
(add-hook 'python-mode-hook
	  (lambda ()
	    (yas-load-directory "~/.emacs.d/snippets/python")
))

(add-hook 'c-mode-hook
	  (lambda ()
	    (yas-load-directory "~/.emacs.d/snippets/c")
))
(add-hook 'html-helper-mode-hook
	  (lambda ()
	    (yas-load-directory "~/.emacs.d/snippets/web")
))


(setq ac-source-yasnippet nil);; must

(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
			     yas-ido-prompt
			     yas-completing-prompt))
