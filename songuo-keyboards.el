;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Keyboard Behaviour
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Keyboard Shortcuts
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; pager
(global-set-key "\C-v"	   'pager-page-down)
(global-set-key [next] 	   'pager-page-down)
(global-set-key "\ev"	   'pager-page-up)
(global-set-key [prior]	   'pager-page-up)
(global-set-key '[M-up]    'pager-row-up)
(global-set-key (kbd "M-p")  'pager-row-up)
(global-set-key '[M-down]  'pager-row-down)
(global-set-key (kbd "M-n")  'pager-row-down)


; Self-defined keymap
(global-set-key [f8] 'kill-whole-line)
(define-key global-map "\C-x\C-u" 'undo) ;; C-x u == C-x C-u 
(define-key global-map "\C-x\C-o" 'other-window) ;; C-x o == C-x C-o
(global-set-key "\C-xl" 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other keymap defined examples
;; (global-set-key "\C-x\C-u" 'undo)   ;; The same as the above
;; (define-key ctl-x-map "\C-u" 'undo) ;; The same as the above
;; (define-key global-map "\C-xl" 'goto-line) ;; The same as the above
;; (define-key ctl-x-map "l" 'goto-line) ;; The same as the above 

;; Binding Special Keys
;; (global-set-key [f5] 'goto-line)    ;; F5
;; (global-set-key [C-A-f5] 'goto-line ;; Ctrl-Alt-F5
;; Unsetting Key Bindings
;; (global-unset-key [f5])
;; (define-key ctl-x-map "l" nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



