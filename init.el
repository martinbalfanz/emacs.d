;(package-initialize)

;; Temporarily reduce garbage collection during startup
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;; ------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'setup-benchmarking)

(require 'setup-use-package)

;; (require 'setup-utils)
;; (require 'setup-site-lisp)
;; (require 'setup-elpa)
(require 'setup-exec-path)
(require 'setup-mac)
(require 'setup-fonts)
(require 'setup-themes)
(require 'setup-gui-frames)
(require 'setup-misc) ;; TODO cleanup
(require 'setup-backup)

(require 'setup-recentf)
(require 'setup-editing-utils)
(require 'setup-helm)
(require 'setup-whitespace)
(require 'setup-windows)
(require 'setup-deprecate)
(require 'setup-dired)
(require 'setup-ibuffer)

(require 'setup-shell)
(use-package dash)
(use-package ranger)
(use-package command-log-mode)
(use-package paradox
  :commands (paradox-upgrade-packages
             paradox-list-packages))

;; ------------------------------------------------------------
;; programming utilities

(require 'setup-git)
(require 'setup-projectile)
(require 'setup-editorconfig)
(require 'setup-completion)
(require 'setup-paredit)
(use-package aggressive-indent :diminish aggressive-indent-mode)
(use-package scratch)

(require 'setup-org)
(require 'setup-deft)

;; ------------------------------------------------------------
;; programming languages & other file types

(require 'setup-emacs-lisp)
(require 'setup-lisp)
(require 'setup-clojure)
(require 'setup-html)
(require 'setup-css)
(require 'setup-javascript)
(require 'setup-vue)
(require 'setup-rust)
(use-package toml-mode)
(use-package yaml-mode)
(use-package nginx-mode)
(use-package systemd
  :init
  (when (featurep 'company)
    (add-hook 'systemd-mode-hook 'company-mode-on)))

(require 'setup-twitter)
