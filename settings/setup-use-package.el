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

(provide 'setup-use-package)
