(use-package org
  :ensure org-plus-contrib
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-iswitchb)
         ("M-m o c j" . org-clock-jump-to-current-clock)
         :map org-mode-map
         ("C-c [" . nil)
         ("C-c ]" . nil)
         ("M-m o c i" . org-clock-in)
         ("M-m o c o" . org-clock-out)
         ("M-m o p p" . org-property-action)
         ("M-m o p s" . org-set-property)
         ("M-m o p d" . org-delete-property)
         ("M-m o p D" . org-delete-property-globally)
         ("M-m o +" . mb/org-new-headline-with-date))
  :init
  (which-key-replace
   "M-m o" "org"
   "M-m o c" "clock"
   "M-m o p" "property"
   "M-m o p p" "+action"
   "M-m o p s" "set"
   "M-m o p d" "delete"
   "M-m o p D" "delete globally")
  :config
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-agenda-mode-hook 'hl-line-mode)

  (setq org-enforce-todo-dependencies t
        org-startup-indented t
        org-cycle-separator-lines 0
        org-return-follows-link t
        org-clone-delete-id t
        org-src-fontify-natively t
        org-src-preserve-indentation nil
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-hide-emphasis-markers t
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil
        org-log-reschedule 'time
        org-log-redeadline 'time
        org-log-refile 'time)

  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING")))

  (setq org-refile-targets '((nil :maxlevel . 5)
                             (org-agenda-files :maxlevel . 5))
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm)

  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  (setq org-capture-templates
        '(("t" "Todo" entry (file "inbox.org")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n")
          ("n" "Note" entry (file "inbox.org")
           "* %? :note:\n:PROPERTIES:\n:CREATED: %U\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\n%i\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "journal.org")
           "* %U\n\n%?\n" :clock-in t :clock-resume t :kill-buffer t)
          ("m" "Meeting" entry (file "inbox.org")
           "* MEETING %? :meeting:\n:PROPERTIES:\n:CREATED: %T\n:ORIGIN: [[%F]]\n:FULL_ORIGIN: %a\n:END:\n\nParticipants:\n- \n%i\n" :clock-in t :clock-resume t)))

  (defun mb/require-final-newline ()
    "Add final newline to buffer"
    (save-excursion
      (when (and (> (point-max) (point-min))
                 (/= (char-after (1- (point-max))) ?\n))
        (goto-char (point-max))
        (insert ?\n))))

  (add-hook 'org-capture-prepare-finalize-hook #'mb/require-final-newline)

  (setq org-hide-emphasis-markers nil
        org-export-coding-system 'utf-8
        org-catch-invisible-edits 'show)

  (require 'org-habit)
  (setq org-habit-show-habits t
        org-habit-show-habits-only-for-today nil
        org-habit-show-all-today nil
        org-habit-show-done-always-green nil)

  (add-hook 'org-mode-hook 'mb/disable-ligatures-face)

  (defun mb/org-new-headline-with-date ()
    (interactive)
    (let ((timestamp (format-time-string "%Y-%m-%d %H:%M")))
      (org-insert-heading-respect-content)
      (insert timestamp)))

  ;; (require 'setup-org-babel)

  ;; Agenda
  ;; (add-hook 'org-agenda-mode-hook 'mb/disable-ligatures-face)
  (setq org-agenda-repeating-timestamp-show-all t
        org-agenda-show-all-dates t
        org-agenda-start-on-weekday 1
        org-agenda-sticky t
        org-deadline-warning-days 7
        org-agenda-show-future-repeats nil
        org-agenda-compact-blocks t
        org-agenda-log-mode-items '(closed clock state)
        org-agenda-todo-ignore-with-date nil
        org-agenda-todo-ignore-deadlines nil
        org-agenda-todo-ignore-scheduled nil
        org-agenda-todo-ignore-timestamp nil
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-agenda-text-search-extra-files '(agenda-archives)
        org-agenda-custom-commands '(("N" "Notes" tags "NOTE"
                                      ((org-agenda-overriding-header "Notes")
                                       (org-tags-match-list-sublevels t)))
                                     ("h" "Habits" tags-todo "STYLE=\"habit\""
                                      ((org-agenda-overriding-header "Habits")
                                       (org-agenda-sorting-strategy
                                        '(todo-state-down effort-up category-keep))))))

  ;; Clock
  (org-clock-persistence-insinuate)
  (setq org-clock-history-length 23
        org-clock-in-resume t
        org-clock-out-remove-zero-time-clocks t
        org-clock-out-when-done t
        org-clock-persist t
        org-clock-report-include-clocking-task t)

  ;; Columns
  (setq org-columns-default-format "%25ITEM %TODO %3PRIORITY %10Effort(Effort){:} %10CLOCKSUM %TAGS")
  )

(use-package alert
  :if (eq window-system 'mac)
  :config
  (setq alert-default-style 'osx-notifier
        appt-delete-window-function nil))

(use-package appt
  :disabled
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
    (if (featurep 'alert)
        (alert (concat "Starting in " min-to-appt " minutes.")
               :title appt-msg)
      (appt-disp-window min-to-appt new-time appt-msg)))

  (setq appt-disp-window-function 'mb/appt-disp-window-function))

(use-package org-pomodoro
  :commands org-pomodoro
  :bind (("M-m o M-p" . org-pomodoro))
  :config
  (spaceline-toggle-org-pomodoro-on))

(use-package ox-pandoc
  :ensure-system-package pandoc
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

(use-package org-brain
  :bind (("M-m o b v" . org-brain-visualize)
         ("M-m o b i" . org-id-get-create)
         :map org-brain-visualize-mode-map
         ("+" . org-brain-new-child))
  :init
  (which-key-replace "M-m o b" "brain")
  :config
  (setq org-id-track-globally t
        org-brain-visualize-default-choices 'all
        org-brain-show-text t
        org-brain-title-max-length 0
        org-brain-visualize-one-child-per-line t)

  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates))

(use-package link-hint
  :after org-brain
  :bind (:map org-brain-visualize-mode-map
              ("." . link-hint-open-link)))

(use-package ascii-art-to-unicode
  :ensure t
  :if (featurep 'org-brain)
  :config
  (defun aa2u-buffer ()
    (aa2u (point-min) (point-max)))

  (add-hook 'org-brain-after-visualize-hook #'aa2u-buffer))

(use-package org-wiki
  :disabled
  :ensure nil
  :load-path "site-lisp/"
  :config
  (setq org-wiki-default-read-only nil))

(use-package org-board
  :disabled
  :after org
  :init
  (which-key-replace
   "M-m o o" "board")
  :config
  (require 'org-protocol)

  (global-set-key (kbd "M-m o o") org-board-keymap)
  (setq org-board-capture-file "bookmarkx.org")

  (push `("c" "Capture website" entry (file+headline ,org-board-capture-file "Unsorted")
          "* %?%:description\n:PROPERTIES:\n:URL: %:link\n:END:\n\n Added %U\n\n%:initial" :immediate-finish t)
        org-capture-templates)

  (defun mb/org-board-dl-hook ()
    (when (equal (buffer-name)
                 (concat "CAPTURE-" org-board-capture-file))
      (org-board-archive)))

  (add-hook 'org-capture-before-finalize-hook #'mb/org-board-dl-hook))

(use-package kanban
  :disabled
  :after org)

(use-package org-trello
  :disabled
  :init
  (add-hook 'org-mode-hook 'org-trello-mode))

(use-package org-journal
  :config
  (add-hook 'org-journal-after-entry-create-hook
            (lambda ()
              (save-excursion
                (let ((template "#+FILETAGS: journal"))
                  (beginning-of-buffer)
                  (unless (search-forward template nil t)
                    (insert template "\n\n"))))))

  (setq calendar-week-start-day 1
        calendar-date-style 'iso
        org-journal-date-format "%A, %Y-%m-%d"))

(use-package ox-minutes
  :after org)

(use-package ox-tufte
  :after org)

(use-package ox-gfm
  :after org)

(use-package orgbox
  :disabled
  :after org)

(provide 'setup-org)
