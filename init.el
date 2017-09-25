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

(require 'setup-use-package)

;; (require 'setup-utils)
;; (require 'setup-site-lisp)
;; (require 'setup-elpa)
(require 'setup-exec-path)
(require 'setup-mac)
(require 'setup-fonts)
(require 'setup-themes)
(require 'setup-gui-frames)
(require 'setup-misc)

(require 'setup-recentf)
(require 'setup-editing-utils)
(require 'setup-helm)
(require 'setup-whitespace)
(require 'setup-windows)

(require 'setup-git)

(require 'setup-projectile)
(require 'setup-editorconfig)
(require 'setup-completion)

(require 'setup-org)

(require 'setup-emacs-lisp)
(require 'setup-lisp)
(require 'setup-html)
(require 'setup-css)
(require 'setup-vue)
