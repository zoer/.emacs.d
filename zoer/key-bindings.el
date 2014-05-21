(windmove-default-keybindings)

(global-set-key (kbd "C-S-<return>") 'open-line-above)
(global-set-key (kbd "C-<return>") 'open-line-below)

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(setq shift-select-mode nil)

;; Experimental multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
;; (global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "C-'") 'er/expand-region)


;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
;; (global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
;; (global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
;; (global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'smart-forward)
(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<backward>") 'smart-backward)
(global-set-key (kbd "M-<forward>") 'smart-forward)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])

(global-set-key (kbd "M-h") 'kill-region-or-backward-word)

;; Webjump let's you quickly search google, wikipedia, emacs wiki
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-x M-g") 'browse-url-at-point)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; Goto last change
(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-,") 'goto-last-change-reverse)


;; Change word separators !!! broken
(global-unset-key (kbd "C-x +")) ;; used to be balance-windows
(global-set-key (kbd "C-x + -") (lambda (replace-region-by 's-dashed-words)))
(global-set-key (kbd "C-x + _") (lambda (replace-region-by 's-snake-case)))
(global-set-key (kbd "C-x + c") (lambda (replace-region-by 's-lower-camel-case)))
(global-set-key (kbd "C-x + C") (lambda (replace-region-by 's-upper-camel-case)))

;; Line movement
(global-set-key (kbd "<C-S-up>") 'move-text-up)
(global-set-key (kbd "<C-S-down>") 'move-text-down)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)
(global-set-key (kbd "M-t w") 'transpose-words)

;; Override key bindings
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; Comments
(define-key my-keys-minor-mode-map (kbd "M-;") 'comment-or-uncomment-region-or-line)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my settings override key bindings"
  t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)

(provide 'key-bindings)
