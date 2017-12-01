(use-package deft
  :commands (deft)
  :bind (:map deft-mode-map
              ("C-n" . deft-next-line)
              ("C-p" . deft-previous-line)
              ("C-u C-<return>" . deft-new-file-default-name))
  :config
  (add-hook 'deft-mode-hook 'hl-line-mode)

  (defun deft-default-filename ()
    "Default filename for new files without SLUG."
    (format-time-string "%Y-%m-%d-%H%M%S"))

  (setq deft-extensions '("org" "markdown" "md" "tex" "txt")
        deft-recursive t
        deft-text-mode 'org-mode
        deft-strip-title-regexp "^#.TITLE:[ ]*"
        deft-auto-save-interval 15.0
        deft-use-filename-as-title t
        deft-directory "~/Dropbox/notes")

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

  (defun deft-new-file-default-name ()
    "Create file with default file name."
    (interactive)
    (deft-new-file-named (deft-default-filename)))

  (defun deft-parse-summary (contents title)
    "Parse the file CONTENTS and extract a summary.
The summary is a string extracted from the contents following the
title without comments."
    (let* ((summary-without-comments (replace-regexp-in-string "^#.*$" "" contents))
           (summary (replace-regexp-in-string "[\n\t ]+" " " summary-without-comments)))
      summary))

  (defadvice deft-new-file-named
      (after mb-deft-insert-org-template last () activate)
    "Create new file and insert org-mode template."
    (let* ((timestamp (concat "[" (format-time-string "%Y-%m-%d %H:%M") "]"))
           (tmpl (concat "#+TITLE:
#+DATE: " timestamp "
#+KEYWORDS:

")))
      (goto-char (point-min))
      (insert tmpl)
      (goto-char 9))))

(provide 'setup-deft)
