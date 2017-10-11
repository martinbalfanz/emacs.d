;; brew install mu --with-emacs

(use-package mu4e
  :ensure nil
  :if (executable-find "mu")
  :config
  (setq mu4e-attachment-dir (expand-file-name "~/Downloads")
        mu4e-user-mail-address-list user-mail-addresses
        mu4e-my-email-addresses user-mail-addresses
        mu4e-confirm-quit nil
        mu4e-use-fancy-chars nil
        mu4e-maildir (expand-file-name "~/mail")
        mu4e-update-interval 120
        mu4e-headers-results-limit 100
        mu4e-headers-show-threads nil
        mu4e-headers-include-related nil
        mu4e-index-cleanup nil
        mu4e-index-lazy-check t

        mu4e-drafts-folder "/drafts"
        mu4e-sent-folder "/sent"
        mu4e-trash-folder "/trash"
        mu4e-sent-messages-behavior (lambda ()
                                      (if (string= (message-sendmail-envelope-from) "info@mailme.io")
                                          'sent
                                        'delete))

        mu4e-bookmarks '(("tag:\\\\Inbox" "Inbox" ?i)
                         ;; ("maildir:/ming/all and (tag:\\\\Inbox or tag:\\\\Sent)" "MING Inbox" ?m)
                         ("maildir:/ming/all and tag:\\\\Inbox" "MING Inbox" ?m)
                         ("maildir:/ming/all and flag:unread" "MING Inbox Unread" ?f)
                         ("maildir:/ming/all and flag:unread and date:today" "MING Inbox Unread Today" ?x)
                         ("maildir:/ming/all and flag:unread and date:7d.." "MING Inbox Unread Week" ?y)
                         ("flag:flagged" "Todos" ?b)
                         ("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
                         ("date:today..now" "Today's messages" ?t)
                         ("date:7d..now" "Last 7 days" ?w)
                         ("mime:image/*" "Messages with images" ?p))

        mu4e-headers-date-format "%Y-%m-%d [%H:%M]"
        mu4e-headers-fields '((:date . 20) (:flags . 6) (:from . 22) (:subject))
        ;; mu4e-headers-fields '((:from . 22) (:subject))
        mu4e-headers-leave-behavior 'ask
        mu4e-headers-visible-columns 60
        mu4e-headers-visible-lines 15
        mu4e-split-view 'horizontal
        mu4e-headers-skip-duplicates t))

(provide 'setup-mu4e)
