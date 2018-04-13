(use-package rainbow-mode
  :diminish rainbow-mode
  :commands (rainbow-mode)
  :init
  (dolist (hook '(css-mode-hook
                  html-mode-hook
                  web-mode-hook
                  sass-mode-hook
                  scss-mode-hook))
    (add-hook hook 'rainbow-mode)))

(use-package sass-mode
  :mode "\\.sass$")

(use-package scss-mode
  :mode "\\.scss$")

(use-package css-eldoc
  :commands (turn-on-css-eldoc)
  :init
  (add-hook 'css-mode-hook 'turn-on-css-eldoc))

(dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
  (when (featurep 'company)
    (add-hook hook 'company-mode-on)))

(provide 'setup-css)
