(use-package color-theme-sanityinc-solarized
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(load-theme 'sanityinc-tomorrow-night t)

(use-package spaceline
  :ensure t
  :defer 5
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  (spaceline-toggle-anzu-off)
  (spaceline-spacemacs-theme))

(use-package spaceline-all-the-icons
  :ensure t
  :disabled
  :after spaceline
  :config
  (setq spaceline-all-the-icons-separator-type 'arrow)
  (spaceline-all-the-icons-theme))

(setq-default line-spacing 2)

(provide 'setup-themes)
