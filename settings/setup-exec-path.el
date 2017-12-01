(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

;; (after-load 'exec-path-from-shell
;;   (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
;;     (add-to-list 'exec-path-from-shell-variables var)))

(provide 'setup-exec-path)
