(use-package deft
  :commands (deft)
  :bind (:map deft-mode-map
              ("C-n" . deft-next-line)
              ("C-p" . deft-previous-line))
  :config
  (add-hook 'deft-mode-hook 'hl-line-mode)
  (add-hook 'deft-mode-hook 'mb/disable-ligatures-face)

  (setq deft-extensions '("org" "markdown" "md" "tex" "txt")
        deft-default-extension "org"
        deft-recursive t
        deft-text-mode 'org-mode
        deft-auto-save-interval 15.0
        deft-use-filename-as-title t
        deft-new-file-format "%Y-%m-%d-%H%M%S")

  (defun deft-next-line ()
    "Move cursor to next line and open file in other window."
    (interactive)
    (forward-line 1)
    (deft-open-file-other-window))

  (defun deft-previous-line ()
    "Move cursor to previous line and open file in other window."
    (interactive)
    (forward-line -1)
    (deft-open-file-other-window))

  (defadvice deft-new-file-named
      (after mb-deft-insert-org-template last () activate)
    "Create new file and insert org-mode template."
    (let* ((timestamp (concat "[" (format-time-string "%Y-%m-%d %H:%M") "]"))
           (filter (deft-whole-filter-regexp))
           (title (lambda ()
                    (if (string-empty-p filter)
                        (ad-get-arg 0)
                      filter)))
           (tmpl (concat "#+TITLE: " (eval title) "
#+DATE: " timestamp "
#+KEYWORDS:

")))
      (goto-char (point-min))
      (insert tmpl)
      (goto-char 9))))

(provide 'setup-deft)
