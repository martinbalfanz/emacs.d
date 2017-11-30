(use-package git-blamed
  :ensure t
  :commands (git-blamed-mode))

(use-package gitignore-mode
  :ensure t
  :mode ("^\\.gitignore$"))

(use-package gitconfig-mode
  :ensure t
  :mode ("^\\.gitconfig"))

(use-package git-timemachine
  :ensure t
  :commands (git-timemachine))

(use-package fullframe
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         :map magit-status-mode-map
         ("C-M-<up>" . magit-section-up))
  :config
  (when (featurep 'fullframe)
    (fullframe magit-status magit-mode-quit-window))

  (setq magit-status-sections-hook (remove 'magit-insert-unpushed-to-upstream-or-recent magit-status-sections-hook)))

(use-package git-commit
  :ensure t
  :after magit
  :config
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(use-package diff-hl
  :ensure t
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
