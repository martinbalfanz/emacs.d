(use-package web-mode
  :mode ("\\.html$" "\\.htm$")
  :init
  (when (featurep 'company)
    (add-hook 'web-mode-hook 'company-mode-on))

(provide 'setup-html)
