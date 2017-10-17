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
  (when (featurep 'fullframe)
    (fullframe magit-status magit-mode-quit-window)))

(use-package git-commit
  :init
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(use-package diff-hl
  :bind (:map diff-hl-mode-map
              ("<left-fringe> <mouse-1>" . diff-hl-goto-hunk))
  :init
  (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

;; ------------------------------------------------------------
;; Github

(use-package yagist)
(use-package bug-reference-github
  :init
  (add-hook 'prog-mode-hook 'bug-reference-prog-mode))

(use-package github-clone)
(use-package github-issues)
(use-package magit-gh-pulls)

(provide 'setup-git)
