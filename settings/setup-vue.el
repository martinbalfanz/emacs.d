(use-package web-mode
  :commands (web-mode)
  :mode (("\\.htm$" . web-mode)
         ("\\.html$" . web-mode)
         ("\\.php$" . web-mode)))

(define-derived-mode vue-mode
  web-mode "Vue"
  "Major mode for vue-js files"
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-style-padding 0
        web-mode-script-padding 0))

(add-to-list 'auto-mode-alist '("\\.vue$" . vue-mode))

(use-package vue-mode
  :disabled)

(provide 'setup-vue)
