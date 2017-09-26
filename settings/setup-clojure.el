(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'subword-mode))

(use-package elein)

(use-package cider
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode))

(provide 'setup-clojure)
