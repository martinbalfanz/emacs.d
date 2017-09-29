(use-package web-mode
  :mode ("\\.html$" "\\.htm$")
  :init
  (when (featurep 'company)
    (add-hook 'web-mode-hook 'company-mode-on))
  (add-hook 'web-mode-hook 'subword-mode)
  :config
  (setq web-mode-enable-current-column-highlight t
        web-mode-enable-current-element-highlight t
        web-mode-enable-element-tag-fontification nil
        web-mode-enable-html-entities-fontification t
        web-mode-enable-element-content-fontification t))

(provide 'setup-html)
