(use-package dired
  :ensure nil
  :config
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil
        ls-lisp-dirs-first t))

(use-package all-the-icons-dired
  :disabled
  :commands (all-the-icons-dired-mode)
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package dired-k
  :disabled
  :commands (dired-k
             dired-k-no-revert)
  :init
  (add-hook 'dired-initial-position-hook #'dired-k)
  (add-hook 'dired-after-readin-hook #'dired-k-no-revert)
  :config
  (setq dired-k-style nil
        dired-k-human-readable t
        dired-k-padding 1)

  (defun mb/dired-k--highlight (orig-fn &rest args)
    "Don't use if directory is remote."
    (unless (file-remote-p default-directory)
      (apply orig-fn args)))
  (advice-add #'dired-k--highlight :around #'mb/dired-k--highlight)

  (custom-set-faces
   '(dired-k-modified ((t (:inherit 'error :weight bold))))
   '(dired-k-untracked ((t (:inherit 'warning))))
   '(dired-k-commited ((t (:inherit 'font-lock-keyword-face))))
   '(dired-k-directory ((t (:inherit 'font-lock-function-name-face))))
   '(dired-k-ignored ((t (:inherit 'font-lock-type-face))))))

(use-package stripe-buffer
  :commands stripe-buffer-mode
  :custom-face
  (stripe-highlight ((t (:background "#191919"))))
  :init
  (add-hook 'dired-mode-hook #'stripe-buffer-mode))

(provide 'setup-dired)
