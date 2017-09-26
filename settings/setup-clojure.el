(use-package clojure-mode
  :mode (("\\.clj$" . clojure-mode)
         ("\\.cljs$" . clojure-mode))
  :config
  (add-hook 'clojure-mode-hook 'subword-mode))

(use-package elein)

(use-package cider
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'eldoc-mode)
  (add-hook 'cider-clojure-interaction-mode-hook 'eldoc-mode)
  (add-hook 'cider-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode))

(use-package clj-refactor
  :init
  (add-hook 'clojure-mode-hook 'clj-refactor-mode))

(provide 'setup-clojure)
