;; company

(use-package company
  :diminish company-mode
  :bind ("C-c /" . company-complete)
  :config
  (setq company-idle-delay 0.2
        company-dabbrev-downcase nil
        company-dabbrev-other-buffers t
        company-tooltip-align-annotations t)
  (global-company-mode 1))

;; (use-package pos-tip)
(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-statistics
  :after company
  :init
  (add-hook 'company-mode-hook 'company-statistics-mode))

(use-package yasnippet
  :bind (("C-c y" . company-yasnippet)
         ("M-m y y" . company-yasnippet)
         ("M-m y v" . yas-visit-snippet-file)
         ("M-m y n" . yas-new-snippet)
         ("M-m y r" . yas-reload-all)
         ("M-m y TAB" . yas-expand))
  :defer 10
  :init
  (which-key-replace "M-m y" "yasnippet")
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'setup-completion)
