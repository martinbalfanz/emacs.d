(use-package color-theme-sanityinc-solarized)
(use-package color-theme-sanityinc-tomorrow)
(use-package nord-theme
  :config
  (setq nord-comment-brightness 10)

  (let ((nord0 (if (display-graphic-p) "#2E3440" nil))
        (nord1 (if (display-graphic-p) "#3B4252" "black")))
    (custom-set-faces
     '(button ((t (:box nil :underline t))))
     `(custom-button ((t (:box (:line-width 1 :style released-button :color ,nord0) :background ,nord1))))
     '(helm-match ((t (:inherit nil :background nil))))
     `(scroll-bar ((t (:background ,nord0)))))))

(load-theme 'nord t)

(use-package spaceline
  :defer 5
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  (spaceline-toggle-anzu-off)
  (spaceline-spacemacs-theme))

(use-package spaceline-all-the-icons
  :disabled
  :after spaceline
  :config
  (setq spaceline-all-the-icons-separator-type 'arrow)
  (spaceline-all-the-icons-theme))

(setq-default line-spacing 2)

(provide 'setup-themes)
