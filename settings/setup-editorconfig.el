(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (setq editorconfig-exclude-modes '(vue-mode))
  (editorconfig-mode 1))

(provide 'setup-editorconfig)
