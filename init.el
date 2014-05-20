(setq config-directory
      (file-name-as-directory
       (concat user-emacs-directory "zoer")))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" config-directory))

;; Set up load path
(add-to-list 'load-path config-directory)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat config-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" config-directory))

;; Set up appearance early
(require 'appearance)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(magit
     paredit
     move-text
     gist
     htmlize
     visual-regexp
     flycheck
     flx
     flx-ido
     css-eldoc
     goto-chg
     yasnippet
     smartparens
     shell-command
     bash-completion
     ido-vertical-mode
     ido-at-point
     ido-ubiquitous
     guide-key
     restclient
     highlight-escape-sequences
     company
     company-inf-ruby
     whitespace-cleanup-mode
     elisp-slime-nav
     autopair
     textmate
     move-text
     yaml-mode
     rspec-mode
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     projectile
     smex
     smooth-scrolling
     undo-tree
     robe
     multiple-cursors
     expand-region
     smart-forward
     browse-kill-ring
     css-mode
     scss-mode
     prodigy)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(require 'defaults)

;; Setup key bindings
(require 'key-bindings)

;; Macros
(require 'setup-macros)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" config-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))

;; Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; Smart M-x is smart
(require 'smex)

(require `browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Company
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; Autopair
(autopair-global-mode)

;; YAML
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Setup extensions
(require 'setup-ruby)
(require 'setup-paredit)
(require 'setup-yasnippet)
(eval-after-load 'shell '(require 'setup-shell))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          ruby-mode
          markdown-mode)
  (add-hook it 'turn-on-smartparens-mode))

(smex-initialize)

