
;; ===== Function to delete a line =====
;; First define a variable which will store the previous column position
(defvar previous-column nil "Save the column position")
;; Define the nuke-line function. The line is killed, then the newline
;; character is deleted. The column which the cursor was positioned at is then
;; restored. Because the kill-line function is used, the contents deleted can
;; be later restored by usibackward-delete-char-untabifyng the yank commands.
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)
  ;; Store the current column position, so it can later be restored for a more
  ;; natural feel to the deletion
  (setq previous-column (current-column))
  ;; Now move to the end of the current line
  (end-of-line)
  ;; Test the length of the line. If it is 0, there is no need for a
  ;; kill-line. All that happens in this case is that the new-line character
  ;; is deleted.
  (if (= (current-column) 0)
    (delete-char 1)
    ;; This is the 'else' clause. The current line being deleted is not zero
    ;; in length. First remove the line by moving to its start and then
    ;; killing, followed by deletion of the newline character, and then
    ;; finally restoration of the column position.
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))
;; Now bind the delete line function to the F8 key
(global-set-key [f8] 'nuke-line)


(defu insert-line()
   "Insert a new blank line blow the current line."
   (interactive)
   (move-end-of-line 1)
   (newline-and-indent)
)
(global-set-key "\C-co" 'insert-line)
(global-set-key "\C-c\C-o" 'insert-line)


;;
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
	      (next-line (- N 1)) ; change to forward-line
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
    )
)
(copy-lines 3)
(point)
111 333
(copy-lines 3)

(defun test()
 (let ((beg (point)))
     (message "%d" beg)
     (= beg (point))
     (message "%d" beg)
 )
)
(test)


;; narrow-to-previous
(defun narrow-to-previous()
    "Narrow region from start of the buffer to current point."
    (interactive)
    (narrow-to-region (point) (point-max))
)
(narrow-to-previous)


(custom-set-variables '(jde-enable-abbrev-mode t)) ;;; Turn on
jde-abbrev-mode

(defun my-jde-mode-hook () 
;Turn off abbrev mode - use manual C-x ' to expand
(if jde-enable-abbrev-mode (jde-abbrev-mode)) 
)

(add-hook 'jde-mode-hook 'my-jde-mode-hook)


