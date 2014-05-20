(defun kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

;; Autoindent on yank
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          ruby-mode-hook
          yaml-mode-hook
          markdown-mode)
  (add-hook it '(lambda ()
    (local-set-key(kbd "RET") 'newline-and-indent))))
;; (add-hook 're) (local-set-key(kbd "RET") 'newline-and-indent)

;; (global-set-key (kbd "RET") 'newline-and-indent)
