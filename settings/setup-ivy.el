(use-package ivy
  :disabled
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package counsel
  :disabled
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)))

(use-package swiper
  :disabled
  :bind (("C-s" . swiper)))

(provide 'setup-ivy)
