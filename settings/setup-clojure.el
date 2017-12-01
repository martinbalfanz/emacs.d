(use-package clojure-mode
  :commands (clojure-mode)
  :mode (("\\.clj$" . clojure-mode)
         ("\\.cljs$" . clojurescript-mode))
  :config
  (dolist (hook '(clojure-mode-hook
                  clojurescript-mode-hook
                  nrepl-mode-hook))
    (add-hook hook (lambda ()
                     (mb/lispy-mode-config)
                     (eldoc-mode 1)))))

(use-package elein
  :after clojure-mode)

(use-package cider
  :after clojure-mode
  :config
  (dolist (hook '(cider-mode-hook
                  cider-repl-mode-hook
                  cider-clojure-interaction-mode-hook))
    (add-hook hook (lambda ()
                     (mb/lispy-mode-config)
                     (eldoc-mode 1)
                     (sanityinc/no-trailing-whitespace)))))

(use-package helm-cider
  :if (featurep 'helm)
  :after cider)

(use-package clj-refactor
  :commands (clj-refactor-mode)
  :init
  (add-hook 'clojure-mode-hook 'clj-refactor-mode)
  (add-hook 'clojurescript-mode-hook 'clj-refactor-mode))

(use-package cljr-helm
  :if (featurep 'helm)
  :bind (:map clojure-mode-map
              ("C-c C-r" . cljr-helm)
              :map clojurescript-mode-map
              ("C-c C-r" . cljr-helm)))

(use-package flycheck-clojure
  :if (featurep 'flycheck)
  :after clojure-mode
  :config
  (flycheck-clojure-setup))

(provide 'setup-clojure)
