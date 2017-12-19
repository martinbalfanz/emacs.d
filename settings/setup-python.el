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
(provide 'setup-python)
