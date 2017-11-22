(use-package org
  :ensure org-plus-contrib
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("M-m o c j" . org-clock-jump-to-current-clock))
  :init
  (which-key-replace
   "M-m o" "org"
   "M-m o c" "org-clock")
  :config
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-agenda-mode-hook 'hl-line-mode)

  (setq org-directory "~/Dropbox/notes"
        org-agenda-files (append '("~/Dropbox/notes/todox.org"
                                   "~/Dropbox/notes/inbox.org"
                                   "~/Dropbox/notes/inbox-mobile.org"
                                   "~/Dropbox/notes/backlogx.org"
                                   "~/Dropbox/notes/refile-beorg.org"
                                   "~/agenda.org"
                                   "~/Dropbox/notes/brain/Work/MING/HR.org")
                                 (file-expand-wildcards "~/Dropbox/notes/brain/Work/MING/Projects/*.org")))

  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                            ;; (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")))

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "inbox.org" "Tasks")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ("n" "Note" entry (file+headline "inbox.org" "Notes")
           "* %?\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "journal.org")
           "* %U\n\n%?\n" :clock-in t :clock-resume t :kill-buffer t)
          ("r" "respond" entry (file "~/git/org/refile.org")
           "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
          ("m" "Meeting" entry (file+headline "inbox.org" "Meeting Minutes")
           "* MEETING %?\n:PROPERTIES:\n:CREATED: %T\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\nParticipants\n- \n%i\n" :clock-in t :clock-resume t)
          ("p" "Call" entry (file+headline "inbox.org" "Phone Calls")
           "* PHONE %? :phone:\n:PROPERTIES:\n:CREATED: %T\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ;; ("h" "Habit" entry (file "~/git/org/refile.org")
          ;;  "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
          ("c" "Capture website" entry (file+headline "bookmarkx.org" "Unsorted")
           "* %?%:description\n:PROPERTIES:\n:URL: %:link\n:END:\n\n Added %U\n\n%:initial" :immediate-finish t)))

  (setq org-hide-emphasis-markers nil
        org-export-coding-system 'utf-8
        org-catch-invisible-edits 'show
        org-agenda-show-future-repeats nil)

  (require 'org-habit)
  (setq org-habit-show-habits t
        org-habit-show-habits-only-for-today nil
        org-habit-show-all-today nil
        org-habit-show-done-always-green nil
        org-agenda-repeating-timestamp-show-all nil))

(use-package alert
  :if window-system
  :config
  (setq alert-default-style 'osx-notifier))

(use-package appt
  :ensure nil
  :after org
  :init
  (defun bh/org-agenda-to-appt ()
    (interactive)
    (setq appt-time-msg-list nil)
    (org-agenda-to-appt))
  (add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)
  :config
  (bh/org-agenda-to-appt)
  (appt-activate t)
  (run-at-time "24:01" nil 'bh/org-agenda-to-appt)

  (setq appt-display-mode-line t)

  (defun mb/appt-disp-window-function (min-to-appt new-time appt-msg)
    (appt-disp-window min-to-appt new-time appt-msg)
    (alert (concat "Starting in " min-to-appt " minutes.")
           :title appt-msg))
  (setq appt-disp-window-function 'mb/appt-disp-window-function)
  (setq appt-delete-window-function 'appt-delete-window))

(use-package org-pomodoro
  :commands org-pomodoro)

(use-package ox-pandoc
  :if (executable-find "pandoc")
  :after org)

;; ------------------------------------------------------------
;; prose mode, taken from
;; https://github.com/purcell/emacs.d/blob/3c1ce6892db5b838636a49b0f7c37d348a45f87f/lisp/init-org.el#L62

(define-minor-mode prose-mode
  "Set up a buffer for prose editing.
This enables or modifies a number of settings so that the
experience of editing prose is a little more like that of a
typical word processor."
  nil " Prose" nil
  (if prose-mode
      (progn
        (when (fboundp 'writeroom-mode)
          (writeroom-mode 1))
        (setq truncate-lines nil)
        (setq word-wrap t)
        (setq cursor-type 'bar)
        (when (eq major-mode 'org)
          (kill-local-variable 'buffer-face-mode-face))
        (buffer-face-mode 1)
        ;;(delete-selection-mode 1)
        (set (make-local-variable 'blink-cursor-interval) 0.6)
        (set (make-local-variable 'show-trailing-whitespace) nil)
        (ignore-errors (flyspell-mode 1))
        (visual-line-mode 1))
    (kill-local-variable 'truncate-lines)
    (kill-local-variable 'word-wrap)
    (kill-local-variable 'cursor-type)
    (kill-local-variable 'show-trailing-whitespace)
    (buffer-face-mode -1)
    ;; (delete-selection-mode -1)
    (flyspell-mode -1)
    (visual-line-mode -1)
    (when (fboundp 'writeroom-mode)
      (writeroom-mode 0))))

(provide 'setup-org)
