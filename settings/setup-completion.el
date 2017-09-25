;; company

(use-package company
  :diminish company-mode
  :config
  (setq company-idle-delay 0.2
	company-dabbrev-downcase nil
	company-dabbrev-other-buffers t))

(use-package pos-tip)
(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-statistics
  :init
  (add-hook 'company-mode-hook 'company-statistics-mode))

(provide 'setup-completion)
