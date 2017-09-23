(message "setup-lisp")

(defun mb/remove-smartparens-and-add-parinfer ()
	"If smartparens mode is enabled, disable it and enable parinfer instead."
	(when (featurep 'smartparens)
		(smartparens-mode -1))
	(parinfer-mode t))

(use-package parinfer
	:bind ("C-," . parinfer-toggle-mode)
	:init
	(setq parinfer-extensions
				'(defaults
					 pretty-parens
					 paredit
					 smart-tab
					 smart-yank))
	(add-hook 'clojure-mode-hook 'mb/remove-smartparens-and-add-parinfer)
	(add-hook 'emacs-lisp-mode-hook 'mb/remove-smartparens-and-add-parinfer)
	(add-hook 'common-lisp-mode-hook 'mb/remove-smartparens-and-add-parinfer)
	(add-hook 'scheme-mode-hook 'mb/remove-smartparens-and-add-parinfer)
	(add-hook 'lisp-mode-hook 'mb/remove-smartparens-and-add-parinfer))

(provide 'setup-lisp)
