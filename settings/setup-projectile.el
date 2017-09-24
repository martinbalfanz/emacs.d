(use-package projectile
  :delight '(:eval (concat " P[" (projectile-project-name) "]"))
  :init
  (add-hook 'after-init-hook 'projectile-mode))


(provide 'setup-projectile)
