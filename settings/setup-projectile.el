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
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :defer 5
  :config
  (counsel-projectile-mode t))

(use-package projectile-ripgrep
  :ensure-system-package rg
  :after projectile
  :bind (:map projectile-mode-map
              ("C-c p s r" . projectile-ripgrep))
  :config
  (add-hook 'ripgrep-search-mode-hook 'hl-line-mode))

(provide 'setup-projectile)
