(deftheme songuo-jde
  "My self-defined jde faces.")

(custom-theme-set-faces
 'songuo-jde
 '(jde-java-font-lock-constant-face ((((class color) (background dark)) (:foreground "Dodgerblue3" :italic t))) t)
 '(jde-java-font-lock-constructor-face ((t (:foreground "white"))) t)
 '(jde-java-font-lock-modifier-face ((t (:foreground "chartreuse1"))) t)
 '(jde-java-font-lock-number-face ((((class color) (background dark)) (:foreground "firebrick2"))) t)
 '(jde-java-font-lock-package-face ((t (:foreground "cyan"))) t)
 '(jde-java-font-lock-private-face ((((class color) (background dark)) (:foreground "chartreuse1"))) t)
 '(jde-java-font-lock-protected-face ((((class color) (background dark)) (:foreground "chartreuse1"))) t)
 '(jde-java-font-lock-public-face ((((class color) (background dark)) (:foreground "chartreuse1"))) t))

(provide-theme 'songuo-jde)
