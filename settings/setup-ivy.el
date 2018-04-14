(use-package ivy
  :diminish ivy-mode
  :commands (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable))
  :config
  (ivy-mode 1))

(use-package swiper
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

(provide 'setup-ivy)
