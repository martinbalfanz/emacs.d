(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'subword-mode))

(use-package elein)

(provide 'setup-clojure)
