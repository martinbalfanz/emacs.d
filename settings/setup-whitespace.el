(setq-default show-trailing-whitespace t)

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode t))

(global-set-key [remap just-one-space] 'cycle-spacing)

(provide 'setup-whitespace)
