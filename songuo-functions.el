;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My self-defined elisp functions and their keymap
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-line()
  "Insert a new blank line blow the current line."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent)
  )
(global-set-key "\C-co" 'insert-line)
(global-set-key "\C-c\C-o" 'insert-line)

; Copy lines
(defun copy-lines(N)
  "Copy N lines below current line(including the current line), 
   copy -N lines above current if N is negtive(excluding the current line)."
  (interactive "p")
  (push-mark (point)) ; Push current point to stack
  (let ((beg (point)) (end (point))) ;; Init variables
    (if (>= N 1)
	(progn
	  (move-beginning-of-line 1)
	  (setq beg (point))
	  (next-line (- N 1))
	  (move-end-of-line 1)
	  (setq end (point))
	  );progn
      (if (< N 0)
	  (progn
	    (previous-line 1)
	    (move-end-of-line 1)
	    (setq end (point))
	    (previous-line (- -1 N))
	    (move-beginning-of-line 1)
	    (setq beg (point))
	    );progn
	); if
      ); if
    (kill-ring-save beg end) ; M-w
    (exchange-point-and-mark); Restore point
    ))
(global-set-key "\C-c\C-c" 'copy-lines)
(global-set-key "\C-cc" 'copy-lines)

;; narrow-to-previous
(defun narrow-to-previous()
  "Narrow region.
   Regions from start of the buffer to current point remain invisible."
  (interactive)
  (narrow-to-region (point) (point-max)))
(define-key ctl-x-map "nm" 'narrow-to-previous)

;; Comment
(defun comment-or-uncomment-currentline-or-region()
  "comment or uncomment current line"
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    ))
(global-set-key (kbd "C-/") 'comment-or-uncomment-currentline-or-region)

;; fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

(defun fullscreen (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
