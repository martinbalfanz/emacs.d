(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :init
  (dolist (hook '(css-mode-hook
                  html-mode-hook
                  web-mode-hook
                  sass-mode-hook
                  scss-mode-hook))
    (add-hook hook 'rainbow-mode)))

(use-package sass-mode
  :ensure t
  :mode "\\.sass$")
(use-package scss-mode
  :ensure t)

(use-package css-eldoc
  :ensure t
  :init
  (add-hook 'css-mode-hook 'turn-on-css-eldoc))

(use-package rainbow-mode
  :ensure t
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
    (add-hook hook 'rainbow-mode)))

(dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
  (when (featurep 'company)
    (add-hook hook 'company-mode-on)))

(provide 'setup-css)
