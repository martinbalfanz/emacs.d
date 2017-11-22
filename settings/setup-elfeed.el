(use-package elfeed
  :ensure-system-package curl)

(use-package elfeed-goodies
  :after elfeed
  :config
  (elfeed-goodies/setup))

(use-package elfeed-org
  :after elfeed
  :config
  (elfeed-org))

(provide 'setup-elfeed)
