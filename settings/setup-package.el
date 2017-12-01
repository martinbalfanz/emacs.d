(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(defconst sanityinc/no-ssl (and (memq system-type '(windows-nt ms-dos))
                                (not (gnutls-available-p))))

(add-to-list 'package-archives
             `("melpa" . ,(if sanityinc/no-ssl
                              "http://melpa.org/packages/"
                            "https://melpa.org/packages/")))
(unless sanityinc/no-ssl
  ;; Force SSL for GNU ELPA
  (setcdr (assoc "gnu" package-archives) "https://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(require 'bind-key)

(use-package diminish)
(use-package delight)
(use-package use-package-ensure-system-package)

(use-package paradox
  :disabled
  :commands (paradox-upgrade-packages
             paradox-list-packages))

(use-package package-utils
  :commands (package-utils-upgrade-all
             package-utils-upgrade-by-name
             package-utils-remove-by-name
             package-utils-list-upgrades))

(use-package try
  :commands try)

(add-hook 'package-menu-mode-hook 'hl-line-mode)

(use-package stripe-buffer
  :commands stripe-buffer-mode
  :init
  (add-hook 'package-menu-mode-hook #'stripe-buffer-mode)
  :config
  (custom-set-faces
   '(stripe-highlight ((t (:background "#191919"))))))

(provide 'setup-package)