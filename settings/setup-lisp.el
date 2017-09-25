(use-package paren-face)

(defun mb/lispy-mode-config ()
  (when (featurep 'smartparens)
    (smartparens-mode -1))
  (paredit-mode t)
  (paren-face-mode t))

(use-package paredit)

(use-package parinfer
  :disabled
  :bind ("C-," . parinfer-toggle-mode)
  :diminish parinfer-mode
  :init
  (setq parinfer-extensions
        '(defaults
           pretty-parens
           paredit
           smart-tab
           smart-yank)))

(dolist (hook '(clojure-mode-hook
                emacs-lisp-mode-hook
                common-lisp-mode-hook
                scheme-mode-hook
                lisp-mode-hook
                ;; json-mode-hook
                slime-mode-hook
                nrepl-mode-hook
                ielm-mode-hook))
  (add-hook hook 'mb/lispy-mode-config))

(provide 'setup-lisp)
