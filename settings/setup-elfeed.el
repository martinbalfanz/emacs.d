(use-package elfeed
  :ensure-system-package curl
  :bind (:map elfeed-search-mode-map
              ("v" . elfeed-show-visit)
              :map elfeed-show-mode-map
              ("v" . elfeed-show-visit)))

(use-package elfeed-goodies
  :after elfeed
  :bind (:map elfeed-search-mode-map
              ("RET" . mb/elfeed-search-show-entry))
  :config
  (elfeed-goodies/setup)

  (defun mb/elfeed-search-show-entry (entry)
    "Display the currently selected item in a buffer, but don't skip a line forward."
    (interactive (list (elfeed-search-selected :ignore-region)))
    (require 'elfeed-show)
    (when (elfeed-entry-p entry)
      (elfeed-untag entry 'unread)
      (elfeed-search-update-entry entry)
      (elfeed-show-entry entry))))

(use-package elfeed-org
  :after elfeed
  :config
  (elfeed-org))

(provide 'setup-elfeed)
