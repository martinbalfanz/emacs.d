(package-initialize)
(setq package-enable-at-startup nil)

;; Temporarily reduce garbage collection during startup
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))

(defconst mb/initial-file-name-handler-alist file-name-handler-alist
  "Initial value of `file-name-handler-alist' at start-up time")
(setq file-name-handler-alist nil)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold
                  file-name-handler-alist mb/initial-file-name-handler-alist)))

;; ------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defvar mb/use-package-allow-ensure-system-package t
  "Set if use-package is allowed to install system packages.")

(require 'setup-benchmarking)

(require 'setup-package)

(unbind-key "M-m")

(require 'setup-utils)
;; (require 'setup-site-lisp)
;; (require 'setup-elpa)
(require 'setup-exec-path)
(require 'setup-mac)
(when (eq system-type 'darwin)
  (require 'setup-fonts))

(when (eq system-type 'gnu/linux)
  (require 'setup-linux))

(require 'setup-themes)
(require 'setup-gui-frames)
(require 'setup-misc) ;; TODO cleanup
(require 'setup-backup)

(require 'setup-recentf)
(require 'setup-editing-utils)
(require 'setup-smartparens)
(require 'setup-flx)
;; (require 'setup-helm)
(require 'setup-ivy)
(require 'setup-uniquify)
(require 'setup-whitespace)
(require 'setup-windows)
(require 'setup-deprecate)
(require 'setup-dired)
(require 'setup-ibuffer)
(require 'setup-anzu)
(require 'setup-elfeed)
(require 'setup-folding)
(require 'setup-help)

(require 'setup-shell)
(use-package dash)
(use-package tldr
  :commands (tldr
             tldr-update-docs))

(use-package dumb-jump
  :commands (dumb-jump-go
             dumb-jump-back
             dumb-jump-quick-look
             dumb-jump-go-other-window))

(use-package ranger
  :commands (ranger))
(use-package command-log-mode
  :commands (command-log-mode))
(use-package writeroom-mode
  :commands (writeroom-mode global-writeroom-mode)
  :config
  (setq writeroom-mode-line t))
(use-package powerthesaurus
  :bind ("M-m p p" . powerthesaurus-lookup-word))
(use-package synosaurus
  :commands synosaurus-mode)
(use-package olivetti
  :commands olivetti-mode)
(use-package imenu-list
  :commands imenu-list-smart-toggle
  :bind ("M-m i" . imenu-list-smart-toggle))
(use-package focus
  :commands (focus-mode))

;; ------------------------------------------------------------
;; programming utilities

(require 'setup-git)
(require 'setup-mercurial)
(require 'setup-projectile)
(require 'setup-editorconfig)
(require 'setup-completion)
(require 'setup-flycheck)
(require 'setup-paredit)
(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :commands (aggressive-indent-mode))
(use-package scratch
  :commands (scratch))

(require 'setup-org)

(require 'setup-deft)
;; (require 'setup-mu4e)
(use-package markdown-mode
  :mode ("\\.md$" "\\.markdown$" "\\.txt$"))

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
(require 'setup-python)
(require 'setup-go)
(require 'setup-docker)
(use-package toml-mode
  :mode (("\\.toml$" . toml-mode)))
(use-package yaml-mode
  :mode (("\\.yml$" . yaml-mode)
         ("\\.yaml$" . yaml-mode)))
(use-package nginx-mode
  :defer 5)
(use-package coffee-mode
  :mode (("\\.coffee$" . coffee-mode)))
(use-package systemd
  :commands (systemd-mode
             systemd-doc-open)
  :init
  (when (featurep 'company)
    (add-hook 'systemd-mode-hook 'company-mode-on)))

(require 'setup-twitter)

(use-package pdf-tools
  :disabled)

(use-package nov
  :mode (("\\.epub$" . nov-mode)))

(require 'setup-hydra)

(use-package system-packages
  :disabled)
(use-package homebrew-mode
  :if (eq system-type 'darwin)
  :commands (homebrew-mode
             homebrew-brew-install
             homebrew-brew-uninstall
             homebrew-brew-fetch))

(when (eq system-type 'gnu/linux)
  (require 'setup-exwm))

(server-start)
