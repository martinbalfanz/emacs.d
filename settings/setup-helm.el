(global-unset-key (kbd "C-x c"))

(use-package helm
  :commands (helm-mode
             helm-mini
             helm-M-x
             helm-command-prefix
             helm-show-kill-ring
             helm-find-files
             helm-register)
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ;; ("C-c h o" . helm-occur)
         ;; ("C-c h g" . helm-google-suggest)
         ;; ("C-c h M-:" . helm-eval-expression-with-eldoc)
         ("C-x r i" . helm-register)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :config
  (require 'helm-config)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
  (setq helm-M-x-fuzzy-match t
        helm-ff-fuzzy-matching t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-mode-fuzzy-match t
        helm-split-window-in-side-p nil)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (helm-mode 1))

(use-package helm-flx
  :if (featurep 'flx)
  :after helm
  :config
  (setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate t)
  (helm-flx-mode 1))

(diminish 'helm-mode)

(use-package helm-dash
  :after helm)

(use-package helm-clojuredocs
  :after helm
  :config
  (setq helm-dash-browser-func 'eww))

(use-package helm-mu
  :after (helm mu4e))

;; (use-package helm-org-refile
;;   :after (helm org))

(use-package helm-projectile
  :after (helm projectile)
  :init
  (setq projectile-completion-system 'helm)
  :config
  (helm-projectile-on))

(use-package helm-ag
  :after (helm ag))

(use-package helm-descbinds
  :after helm
  :config
  (helm-descbinds-mode 1))

(use-package helm-tramp
  :after helm)

(use-package helm-themes
  :after helm)

(use-package helm-swoop
  :after helm
  :commands (helm-swoop
             helm-swoop-from-isearch
             helm-multi-swoop-all-from-helm-swoop)
  :bind (:map isearch-mode-map
              ("M-i" . helm-swoop-from-isearch)
              :map helm-swoop-map
              ("M-i" . helm-multi-swoop-all-from-helm-swoop)))

(use-package helm-ls-git
  :after helm)

(use-package helm-gitignore
  :after helm)

(use-package helm-company
  :after (helm company))

;; (use-package helm-cider
;;   :after (helm cider))

(use-package helm-css-scss
  :after helm)

(provide 'setup-helm)
