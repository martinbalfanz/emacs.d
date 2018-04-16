(use-package elisp-slime-nav
  :diminish elisp-slime-nav-mode
  :commands (turn-on-elisp-slime-nav-mode)
  :init
  (dolist (hook '(emacs-lisp-mode-hook
                  ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))

(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook))
  (when (featurep 'company)
    (add-hook hook 'company-mode-on))
  (add-hook hook (lambda () (eldoc-mode 1))))

(diminish 'eldoc-mode)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(use-package litable
  :commands (litable-mode))

(use-package highlight-quoted
  :commands (highlight-quoted-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))

(provide 'setup-emacs-lisp)
