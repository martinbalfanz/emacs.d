;; occur

(add-hook 'occur-mode-hook
          (lambda ()
            (next-error-follow-minor-mode 1)
            (hl-line-mode 1)
            (local-set-key (kbd "n") 'next-line)
            (local-set-key (kbd "p") 'previous-line)))

(add-hook 'occur-edit-mode-hook
          (lambda ()
            (local-unset-key (kbd "n"))
            (local-unset-key (kbd "p"))))

(bind-key "C-o" 'isearch-occur isearch-mode-map)

(defadvice occur
    (after mb-switch-to-occur last () activate)
  "Switch to occur window automatically."
  (other-window 1))

(defadvice ibuffer-do-occur
    (after mb-ibuffer-switch-to-occur last () activate)
  "Switch to occur window automatically."
  (other-window 1))

(provide 'setup-deprecate)
