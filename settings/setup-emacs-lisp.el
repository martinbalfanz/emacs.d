(use-package elisp-slime-nav
  :diminish elisp-slime-nav-mode
  :init
  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook hook 'turn-on-elisp-slime-nav-mode)
    (add-hook hook 'company-mode-on)))

(setq-default initial-scratch-message
	      (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(provide 'setup-emacs-lisp)
