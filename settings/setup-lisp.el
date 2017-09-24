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
	   smart-yank))
  (add-hook 'clojure-mode-hook 'mb/lispy-mode-config)
  (add-hook 'emacs-lisp-mode-hook 'mb/lispy-mode-config)
  (add-hook 'common-lisp-mode-hook 'mb/lispy-mode-config)
  (add-hook 'scheme-mode-hook 'mb/lispy-mode-config)
  (add-hook 'lisp-mode-hook 'mb/lispy-mode-config)
  (add-hook 'json-mode-hook 'mb/lispy-mode-config))

(provide 'setup-lisp)
