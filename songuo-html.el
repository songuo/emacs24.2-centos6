
(setq html-helper-do-write-file-hooks t)
(setq html-helper-build-new-buffer t)
(setq html-helper-address-string "<a href=\"mailto:songguo.hit@gmail.com \">Guo Song</a>")

(add-to-list 'load-path
	     "~/.emacs.d/third-party/html-helper-mode-3.0")
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist
      (cons '("\\.html$" . html-helper-mode)
	    auto-mode-alist))

