(use-package rainbow-mode
  :diminish rainbow-mode
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook scss-mode-hook))
    (add-hook hook 'rainbow-mode)))

(use-package sass-mode
  :mode "\\.sass$")
(use-package scss-mode)

(use-package css-eldoc
  :init
  (add-hook 'css-mode-hook 'turn-on-css-eldoc))

(use-package rainbow-mode
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
    (add-hook hook 'rainbow-mode)))

(dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
  (when (featurep 'company)
    (add-hook hook 'company-mode-on)))

(provide 'setup-css)
