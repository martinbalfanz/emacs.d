(use-package git-blamed)
(use-package gitignore-mode)
(use-package gitconfig-mode)
(use-package git-timemachine)
(use-package fullframe)

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         :map magit-status-mode-map
         ("C-M-<up>" . magit-section-up))
  :config
  (fullframe magit-status magit-mode-quit-window))

(use-package git-commit
  :init
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(provide 'setup-git)
