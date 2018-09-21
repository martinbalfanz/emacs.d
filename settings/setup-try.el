(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package outshine
  :commands (outshine-hook-function)
  :init
  (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
  (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode))

(el-get-bundle escherdragon/sunrise-commander)

(provide 'setup-try)
