(use-package paredit
  :ensure t
  :diminish paredit-mode
  :config
  (defadvice paredit-kill (around mb/paredit-kill () activate)
    (if (eolp)
        (delete-indentation t)
      ad-do-it)))

(provide 'setup-paredit)
