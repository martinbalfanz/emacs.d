;(package-initialize)

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
(require 'setup-completion)

(require 'setup-emacs-lisp)
(require 'setup-lisp)
(require 'setup-vue)
