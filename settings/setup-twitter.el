(use-package twittering-mode
  :bind (:map twittering-mode-map
              ("n" . twittering-goto-next-status)
              ("p" . twittering-goto-previous-status)
              ("j" . twittering-goto-next-status-of-user)
              ("k" . twittering-goto-previous-status-of-user))
  :config
  (progn
    (setq twittering-timer-interval 150
          twittering-number-of-tweets-on-retrieval 100
          Twittering-use-ssl t
          twittering-use-master-password nil
          twittering-initial-timeline-spec-string '(":home"
                                                    ":replies"
                                                    ":favorites"
                                                    ":direct_messages"))
    (twittering-icon-mode 1)
    (twittering-enable-unread-status-notifier)))

(provide 'setup-twitter)
