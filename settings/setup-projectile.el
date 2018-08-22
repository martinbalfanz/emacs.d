(use-package ag
  :commands (ag)
  :ensure-system-package ag)

(use-package projectile
  :commands (projectile-ag
             projectile-find-file)
  :delight '(:eval (concat " P[" (projectile-project-name) "]"))
  :init
  (add-hook 'after-init-hook 'projectile-mode)
  :config
  (setq projectile-completion-system 'default)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel-projectile
  :defer 5
  :init
  (defvar counsel-projectile-mode-map
    (let ((map (make-sparse-keymap))
          (projectile-command-keymap (where-is-internal 'projectile-command-map nil t)))
      (when projectile-command-keymap
        (define-key map projectile-command-keymap 'counsel-projectile-command-map))
      (define-key map [remap projectile-find-file] 'counsel-projectile-find-file)
      (define-key map [remap projectile-find-dir] 'counsel-projectile-find-dir)
      (define-key map [remap projectile-switch-to-buffer] 'counsel-projectile-switch-to-buffer)
      (define-key map [remap projectile-grep] 'counsel-projectile-grep)
      (define-key map [remap projectile-ag] 'counsel-projectile-ag)
      (define-key map [remap projectile-switch-project] 'counsel-projectile-switch-project)
      map)
    "Keymap for Counsel-Projectile mode.")
  :config
  (counsel-projectile-mode t))

(use-package projectile-ripgrep
  :ensure-system-package rg
  :after projectile
  :config
  (add-hook 'ripgrep-search-mode-hook 'hl-line-mode))

(provide 'setup-projectile)
