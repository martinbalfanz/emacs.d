(use-package elisp-slime-nav
  :diminish elisp-slime-nav-mode
  :init
  (dolist (hook '(emacs-lisp-mode-hook
                  ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)))

(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook))
  (add-hook 'hook (lambda ()
                   (when (featurep 'company)
                     (add-hook hook 'company-mode-on))
                   (eldoc-mode 1))))

(diminish 'eldoc-mode)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(provide 'setup-emacs-lisp)
