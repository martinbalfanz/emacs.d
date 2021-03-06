(use-package color-theme-sanityinc-solarized
  :commands (color-theme-sanityinc-solarized-dark
             color-theme-sanityinc-solarized-light))

(use-package color-theme-sanityinc-tomorrow
  :commands (color-theme-sanityinc-tomorrow-day
             color-theme-sanityinc-tomorrow-night
             color-theme-sanityinc-tomorrow-blue
             color-theme-sanityinc-tomorrow-bright
             color-theme-sanityinc-tomorrow-eighties
	     color-theme-sanityinc-tomorrow--theme-name))

(use-package dracula-theme
  :disabled)

(use-package doom-themes
  :commands (doom-lighten
             doom-darken)
  :config
  (doom-themes-org-config)
  (setq doom-enable-bold t
        doom-enable-italic t
        doom-org-special-tags t
        doom-themes-padded-modeline nil
        doom-one-brighter-modeline nil
        doom-one-padded-modeline nil
        doom-one-brighter-comments nil
        doom-one-comment-bg nil))

(use-package doom-modeline
  :defer t
  :hook (after-init . doom-modeline-init))

(use-package nord-theme
  :disabled
  :config
  (setq nord-comment-brightness 10)

  (let ((class '((class color) (min-colors 89)))
        (nord0 (if (display-graphic-p) "#2E3440" nil))
        (nord1 (if (display-graphic-p) "#3B4252" "black"))
        (nord2 (if (display-graphic-p) "#434C5E" "#434C5E"))
        (nord3 (if (display-graphic-p) "#4C566A" "brightblack"))
        (nord4 (if (display-graphic-p) "#D8DEE9" "#D8DEE9"))
        (nord5 (if (display-graphic-p) "#E5E9F0" "white"))
        (nord6 (if (display-graphic-p) "#ECEFF4" "brightwhite"))
        (nord7 (if (display-graphic-p) "#8FBCBB" "cyan"))
        (nord8 (if (display-graphic-p) "#88C0D0" "brightcyan"))
        (nord9 (if (display-graphic-p) "#81A1C1" "blue"))
        (nord10 (if (display-graphic-p) "#5E81AC" "brightblue"))
        (nord11 (if (display-graphic-p) "#BF616A" "red"))
        (nord12 (if (display-graphic-p) "#D08770" "brightyellow"))
        (nord13 (if (display-graphic-p) "#EBCB8B" "yellow"))
        (nord14 (if (display-graphic-p) "#A3BE8C" "green"))
        (nord15 (if (display-graphic-p) "#B48EAD" "magenta")))
    (custom-set-faces
     `(button ((,class (:box nil :underline t))))
     `(custom-button ((,class (:box (:line-width 1 :style released-button :color ,nord0) :background ,nord1))))
     `(dired-k-commited ((,class (:inherit 'font-lock-keyword-face))))
     `(dired-k-directory ((,class (:inherit 'font-lock-function-name-face))))
     `(dired-k-ignored ((,class (:inherit 'font-lock-type-face))))
     `(dired-k-modified ((,class (:inherit 'error :weight bold))))
     `(dired-k-untracked ((,class (:inherit 'warning))))
     `(font-lock-constant-face ((,class (:foreground ,nord14))))
     `(helm-match ((,class (:inherit nil :background nil))))
     `(org-document-title ((,class (:height 1.44))))
     `(org-level-2 ((,class (:foreground ,nord9))))
     `(org-level-3 ((,class (:foreground ,nord10))))
     `(org-level-4 ((,class (:foreground ,nord7))))
     `(org-level-5 ((,class (:foreground ,nord8))))
     `(org-level-7 ((,class (:foreground ,nord10 :weight normal))))
     `(org-level-8 ((,class (:foreground ,nord7 :weight normal))))
     `(org-priority ((,class (:foreground ,nord14))))
     `(org-agenda-dimmed-todo-face ((,class (:background nil :foreground ,nord3))))
     `(org-agenda-date-today ((,class (:height 1.44 :weight normal))))
     `(org-agenda-structure ((,class (:italic t :height 1.2))))
     `(scroll-bar ((,class (:background ,nord0))))
     `(stripe-highlight ((,class (:background ,(doom-darken nord1 0.3)))))
     `(which-key-key-face ((,class (:foreground ,nord13)))))

    (setq org-todo-keyword-faces
          `(("TODO" :foreground ,nord11 :weight bold)
            ("NEXT" :foreground ,nord13 :weight bold)
            ("DOING" :foreground ,nord13 :weight bold)
            ("DONE" :foreground ,nord14 :weight bold)
            ("WAITING" :foreground ,nord12 :weight bold)
            ("HOLD" :foreground ,nord12 :weight bold)
            ("CANCELLED" :foreground ,nord14 :weight bold)
            ("MEETING" :foreground ,nord14 :weight bold))))

  (defun color-theme-nord ()
    (interactive)
    (if (boundp 'custom-enabled-themes)
        (custom-set-variables '(custom-enabled-themes '(nord)))
      (load-theme 'nord t))))

(load-theme 'doom-one t)

(use-package spaceline
  :disabled
  :if (display-graphic-p)
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


;; custom adjustments
(custom-set-faces
 '(default ((t (:background "#000" :height 140)))))
;; (custom-theme-set-faces
;;  'doom-one)
(setq org-todo-keyword-faces '(("TODO" :foreground "#BF616A" :weight bold)
                               ("NEXT" :foreground "#EBCB8B" :weight bold)
                               ("DOING" :foreground "#EBCB8B" :weight bold)
                               ("DONE" :foreground "#A3BE8C" :weight bold)
                               ("WAITING" :foreground "#D08770" :weight bold)
                               ("HOLD" :foreground "#D08770" :weight bold)
                               ("CANCELLED" :foreground "#A3BE8C" :weight bold)
                               ("MEETING" :foreground "#A3BE8C" :weight bold))
      org-priority-faces `((?A . (:foreground ,(doom-lighten "#BF616A" 0.8) :background ,(doom-darken "#BF616A" 0.4) :weight bold))
                           (?B . (:foreground ,(doom-lighten "#EBCB8B" 0.6) :background ,(doom-darken "#EBCB8B" 0.4) :weight bold))
                           (?C . (:foreground ,(doom-lighten "#A3BE8C" 0.6) :background ,(doom-darken "#A3BE8C" 0.4) :weight bold))))

(provide 'setup-themes)
