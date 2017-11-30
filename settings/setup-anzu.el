(use-package anzu
  :ensure t
  :diminish anzu-mode
  :commands (anzu-mode
             global-anzu-mode)
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp)
         :map isearch-mode-map
         ("M-%" . anzu-isearch-query-replace)
         ("C-M-%" . anzu-isearch-query-replace-regexp))
  :config
  (setq anzu-replace-to-string-separator " => "))

(global-anzu-mode +1)

(provide 'setup-anzu)
