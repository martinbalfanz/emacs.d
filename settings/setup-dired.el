(use-package all-the-icons-dired
  :commands (all-the-icons-dired-mode)
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  :config
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil
        ls-lisp-dirs-first t))

(use-package stripe-buffer
  :commands stripe-buffer-mode
  :custom-face
  (stripe-highlight ((t (:background "#191919"))))
  :init
  (add-hook 'dired-mode-hook #'stripe-buffer-mode))

(provide 'setup-dired)
