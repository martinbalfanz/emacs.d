(use-package git-blamed
  :commands (git-blamed-mode))

(use-package gitignore-mode
  :mode ("^\\.gitignore$"))

(use-package gitconfig-mode
  :mode ("^\\.gitconfig"))

(use-package git-timemachine
  :commands (git-timemachine))

(use-package fullframe
  :commands (fullframe))

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         :map magit-status-mode-map
         ("C-M-<up>" . magit-section-up))
  :config
  (when (featurep 'fullframe)
    (fullframe magit-status magit-mode-quit-window))

  (setq magit-status-sections-hook (remove 'magit-insert-unpushed-to-upstream-or-recent magit-status-sections-hook)))

(use-package magit-org-todos
  :after magit
  :config
  (magit-org-todos-autoinsert))

(use-package git-commit
  :after magit
  :config
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

;; (use-package yagist)
;; (use-package bug-reference-github
;;   :init
;;   (add-hook 'prog-mode-hook 'bug-reference-prog-mode))

;; (use-package github-clone)
;; (use-package github-issues)
;; (use-package magit-gh-pulls)

(provide 'setup-git)
