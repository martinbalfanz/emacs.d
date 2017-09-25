(use-package color-theme-sanityinc-solarized)
(use-package color-theme-sanityinc-tomorrow)

(load-theme 'sanityinc-tomorrow-night t)

(use-package spaceline
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  (spaceline-spacemacs-theme))

(setq-default line-spacing 2)

(provide 'setup-themes)
