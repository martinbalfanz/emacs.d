(use-package color-theme-sanityinc-solarized)
(use-package color-theme-sanityinc-tomorrow)

(load-theme 'sanityinc-tomorrow-night t)

(use-package spaceline
  :defer 5
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  (spaceline-spacemacs-theme))

(use-package spaceline-all-the-icons
  :disabled
  :after spaceline
  :config
  (setq spaceline-all-the-icons-separator-type 'arrow)
  (spaceline-all-the-icons-theme))

(setq-default line-spacing 2)

(provide 'setup-themes)
