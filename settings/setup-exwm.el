(use-package exwm
  :config
  (require 'exwm)
  (require 'exwm-config)

  (add-hook 'exwm-manage-finish-hook
            (lambda ()
              (when (and exwm-class-name
                         (string= exwm-class-name "Firefox"))
                (exwm-input-set-local-simulation-keys nil))))

  (exwm-config-default))

(provide 'setup-exwm)
