(add-to-list 'load-path (expand-file-name "~/.spacemacs.d/settings"))
(setq use-package-always-ensure t)

;; (require 'setup-utils)
;; (require 'setup-site-lisp)
;; (require 'setup-elpa)
(require 'setup-exec-path)
(require 'setup-mac)
(require 'setup-fonts)
(require 'setup-themes)

(require 'setup-recentf)
(require 'setup-editing-utils)
(require 'setup-helm)
(require 'setup-whitespace)

(require 'setup-git)

(require 'setup-emacs-lisp) ;; TODO, might be complete lisp mode required
(require 'setup-vue)

(provide 'my-setup)
