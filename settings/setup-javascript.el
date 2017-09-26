(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :init
  (when (featurep 'company)
    (add-hook 'js2-mode-hook 'company-mode-on)
    (add-hook 'js2-mode-hook 'subword-mode)))

(use-package tern
  :if (executable-find "tern")
  :after js2-mode
  :init
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package js-doc)

(use-package js2-refactor
  :diminish js2-refactor-mode
  :after js2-mode
  :init
  (add-hook 'js2-mode-hook 'js2-refactor-mode))

(use-package company-tern
  :if (executable-find "tern")
  :requires company
  :init
  (add-to-list 'company-backends 'company-tern))

(provide 'setup-javascript)
