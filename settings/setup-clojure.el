(use-package clojure-mode
  :ensure t
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
  :ensure t
  :after clojure-mode)

(use-package cider
  :ensure t
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
  :ensure t
  :if (featurep 'helm)
  :after cider)

(use-package clj-refactor
  :ensure t
  :commands (clj-refactor-mode)
  :init
  (add-hook 'clojure-mode-hook 'clj-refactor-mode)
  (add-hook 'clojurescript-mode-hook 'clj-refactor-mode))

(use-package cljr-helm
  :ensure t
  :if (featurep 'helm)
  :bind (:map clojure-mode-map
              ("C-c C-r" . cljr-helm)
              :map clojurescript-mode-map
              ("C-c C-r" . cljr-helm)))

(use-package flycheck-clojure
  :ensure t
  :if (featurep 'flycheck)
  :after clojure-mode
  :config
  (flycheck-clojure-setup))

(provide 'setup-clojure)
