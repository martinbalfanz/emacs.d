(use-package web-mode
  :mode ("\\.html$" "\\.htm$")
  :init
  (add-hook 'web-mode-hook 'company-mode-on))

(provide 'setup-html)
