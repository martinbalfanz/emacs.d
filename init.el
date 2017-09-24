;(package-initialize)

(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

(require 'setup-use-package)

;; (require 'setup-utils)
;; (require 'setup-site-lisp)
;; (require 'setup-elpa)
(require 'setup-exec-path)
(require 'setup-mac)
(require 'setup-fonts)
(require 'setup-themes)
(require 'setup-gui-frames)

(require 'setup-recentf)
(require 'setup-editing-utils)
(require 'setup-helm)
(require 'setup-whitespace)
(require 'setup-windows)

(require 'setup-git)

(require 'setup-emacs-lisp)
(require 'setup-lisp)
(require 'setup-vue)

(provide 'my-setup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode parinfer elisp-slime-nav magit-gh-pulls github-issues github-clone bug-reference-github yagist diff-hl magit fullframe git-timemachine gitconfig-mode git-blamed switch-window whitespace-cleanup-mode helm-company helm-gitignore helm-ls-git helm-swoop helm-tramp helm-descbinds helm-ag helm-projectile helm-mu helm-clojuredocs helm-dash helm move-dup page-break-lines multiple-cursors avy expand-region symbol-overlay rainbow-delimiters browse-kill-ring undo-tree list-unicode-display unfill color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
