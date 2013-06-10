(deftheme songuo-python
  "My self-defined python faces.")

(custom-theme-set-faces
 'songuo-python
 '(py-builtins-face ((t (:inherit font-lock-builtin-face :foreground "chartreuse1"))))
 '(py-decorators-face ((t (:inherit font-lock-keyword-face :foreground "white"))))
 '(py-variable-name-face ((t (:inherit default :foreground "white"))))
)

(provide-theme 'songuo-python)
