(add-hook 'python-mode-hook 'subword-mode)

(use-package elpy
  :defer 10
  :config
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (when (featurep 'flycheck)
    (add-hook 'elpy-mode-hook
              (lambda ()
                (flycheck-mode 1)
                (setq-local flycheck-check-syntax-automatically '(mode-enabled save))))))

(use-package py-autopep8
  :ensure-system-package (autopep8 . "pip install autopep8")
  :after elpy
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;; (use-package ein)
;; (use-package company-jedi)

(provide 'setup-python)
