(setq create-lockfiles nil)

(setq backup-directory-alist '((".*" . "~/.saves"))
      auto-save-file-name-transforms '((".*" "~/.saves" t))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      tramp-backup-directory-alist '((".*" . "~/.tramp-saves")))

(setq vc-make-backup-files t)

(provide 'setup-backup)
