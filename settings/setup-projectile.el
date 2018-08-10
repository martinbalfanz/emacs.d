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
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel-projectile
  :defer 5
  :config
  (counsel-projectile-mode t))

(use-package projectile-ripgrep
  :ensure-system-package rg
  :after projectile
  :config
  (add-hook 'ripgrep-search-mode-hook 'hl-line-mode))

(provide 'setup-projectile)
