(use-package rust-mode
  :init
  ;; install rustfmt using `cargo install rustfmt'
  (when (executable-find "rustfmt")
    (add-hook 'rust-mode-hook
              (lambda ()
                (add-hook 'before-save-hook
                          (lambda ()
                            (rust-format-buffer)) nil t)))))

(use-package cargo
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  ;; install racer using `rustup component add rust-src' and `cargo install racer'
  :after rust-mode
  :if (executable-find "racer")
  :diminish racer-mode
  :bind (:map rust-mode-map
              ("C-c C-t" . racer-describe))
  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  :config
  (when (featurep 'company)
    (add-hook 'racer-mode-hook 'company-mode)
    (define-key rust-mode-map (kbd "TAB") 'company-indent-or-complete-common))
  (add-hook 'racer-mode-hook 'eldoc-mode))

(use-package rust-playground)

(use-package flycheck-rust
  :if (featurep 'flycheck)
  :after flycheck
  :init
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup))

(provide 'setup-rust)
