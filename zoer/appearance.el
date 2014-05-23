;; Set custom theme path
(setq custom-theme-directory (concat config-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; Default theme
(defun use-presentation4-theme ()
  (interactive)
  (disable-theme 'default-black)
  (load-theme 'prez t))

(defun use-default-theme ()
  (interactive)
  (disable-theme 'prez)
  (load-theme 'default-black t))

(defun use-sublime-theme ()
  (interactive)
  (disable-theme 'default-black)
  (disable-theme 'prez)
  (load-theme 'spolsky t)
  (set-face-attribute 'default nil :height 130)
  (custom-theme-set-faces
   'spolsky
   '(font-lock-comment-face ((t (:foreground "orange")))))
  (custom-theme-set-variables
   'spolsky
   '(linum-format " %3i ")))

(use-sublime-theme)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Set defualt font size
(set-face-attribute 'default nil :height 130)

(require 'diminish)
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))

(provide 'appearance)
