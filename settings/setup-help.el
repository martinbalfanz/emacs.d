(use-package helpful
  :init
  (when(file-directory-p "~/Code/emacs/src")
    (setq find-function-C-source-directory "~/Code/emacs/src"))
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h ." . helpful-at-point)))

(provide 'setup-help)
