(use-package js2-mode
  :mode ("\\.js$" . js2-mode)
  :config
  (when (featurep 'company)
    (add-hook 'js2-mode-hook 'company-mode-on)
    (add-hook 'js2-mode-hook 'subword-mode))

  (setq-default js2-basic-offset 2)

  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  ;; (when (featurep 'flycheck)
  ;;   (add-hook 'js2-mode-hook 'flycheck-mode))
  )

(use-package rjsx-mode
  :mode ("\\.jsx$" . rjsx-mode))

(use-package tern
  :ensure-system-package (tern . "npm install -g tern")
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
  :ensure-system-package (tern . "npm install -g tern")
  :requires company
  :init
  (add-to-list 'company-backends 'company-tern))

(use-package json-mode
  :mode ("\\.json$" . json-mode))

(provide 'setup-javascript)
