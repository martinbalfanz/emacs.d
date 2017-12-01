(use-package ag
  :if (executable-find "ag"))

(use-package projectile
  :delight '(:eval (concat " P[" (projectile-project-name) "]"))
  :init
  (add-hook 'after-init-hook 'projectile-mode))

(use-package projectile-ripgrep
  :if (executable-find "rg")
  :after projectile
  :bind (:map projectile-mode-map
              ("C-c p s r" . projectile-ripgrep))
  :config
  (add-hook 'ripgrep-search-mode-hook 'hl-line-mode))

(provide 'setup-projectile)
