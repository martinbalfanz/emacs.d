(use-package org
  :ensure org-plus-contrib
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :init
  (add-hook 'org-mode-hook 'auto-fill-mode)

  :config
  (setq org-directory "~/Dropbox/notes"
        org-agenda-files (append '("~/Dropbox/notes/todox.org"
                                   "~/Dropbox/notes/inbox.org"
                                   "~/Dropbox/notes/inbox-mobile.org"
                                   "~/Dropbox/notes/backlogx.org"
                                   "~/agenda.org"
                                   "~/Dropbox/notes/brain/Work/MING/HR.org")
                                 (file-expand-wildcards "~/Dropbox/notes/brain/Work/MING/Projects/*.org")))

  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                            ;; (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")))

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "inbox.org" "Tasks")
           "* TODO %^{Brief Description}\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%?\n%i\n" :clock-in t :clock-resume t)
          ("n" "Note" entry (file+headline "inbox.org" "Notes")
           "* %^{Brief Description}\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%?\n%i\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "journal.org")
           "* %U\n\n%?\n" :clock-in t :clock-resume t :kill-buffer t)
          ("r" "respond" entry (file "~/git/org/refile.org")
           "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
          ("m" "Meeting" entry (file+headline "inbox.org" "Meeting Minutes")
           "* MEETING %?\n:PROPERTIES:\n:CREATED: %T\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ("p" "Call" entry (file+headline "inbox.org" "Phone Calls")
           "* PHONE %? :phone:\n:PROPERTIES:\n:CREATED: %T\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ;; ("h" "Habit" entry (file "~/git/org/refile.org")
          ;;  "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
          ("c" "Capture website" entry (file+headline "bookmarkx.org" "Unsorted")
           "* %?%:description\n:PROPERTIES:\n:URL: %:link\n:END:\n\n Added %U\n\n%:initial" :immediate-finish t))))

(provide 'setup-org)
