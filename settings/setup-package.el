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

(defun mb/ensure-system-package (doit &rest args)
  "Verify if the installation of system packages is allowed or if
it is required at all.  Then continue or disable."
  (if mb/use-package-allow-ensure-system-package
      (apply doit args)
    (let* ((name (first args))
           (keyword (nth 1 args))
           (arg (nth 2 args))
           (rest (nth 3 args))
           (state (nth 4 args))
           (body (use-package-process-keywords name rest state))
           (count (mapcar #'(lambda (cons)
                              (if (executable-find (symbol-name (car cons)))
                                  0
                                1)) arg)))
      (when (= 0 (reduce #'+ count))
        body))))

(advice-add 'use-package-handler/:ensure-system-package
            :around
            #'mb/ensure-system-package)

(delete :ensure-system-package use-package-keywords)
(add-to-list 'use-package-keywords :ensure-system-package nil)

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

(provide 'setup-package)
