(fset 'yes-or-no-p 'y-or-n-p)

(defun indent-buffer ()
  "Reindents the whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max)))

(defun define-keys (mode-map keybindings)
  "Takes a mode map, and a list of (key function-designator)
lists. The functions are bound to the keys in the given mode-map.
Keys are in kbd format."
  (mapc (lambda (keybinding)
          (destructuring-bind (key function) keybinding
            (define-key mode-map (read-kbd-macro key) function)))
        keybindings))

(defun global-set-keys (keybindings)
  "Takes a list of (key function-designator) lists.
The functions are globally bound to the keys. Keys
are in kbd format."
  (mapc (lambda (keybinding)
          (destructuring-bind (key function) keybinding
            (global-set-key (read-kbd-macro key) function)))
        keybindings))

(defun mb/kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

(defun mb/beginning-of-line (&optional arg)
  "Toggle point between beginning of line and first non-whitespace."
  (interactive "P")
  (if (and (bolp) (not arg))
      (back-to-indentation)
    (beginning-of-line arg)))

(defun buffer-contains-regex-p (regex)
  "Check if buffer contains a given REGEX."
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (if (search-forward-regexp regex nil t)
          t
        nil))))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun insert-current-date ()
  "Insert current date in the form Y-m-d."
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(defun jcs-kill-a-buffer (askp)
  (interactive "P")
  (if askp
      (kill-buffer (funcall completing-read-function
                            "Kill buffer: "
                            (mapcar #'buffer-name (buffer-list))))
    (kill-this-buffer)))

(global-set-keys '(("C-x k" jcs-kill-a-buffer)
                   ("C-a" mb/beginning-of-line)
                   ("C-k" mb/kill-and-join-forward)))

(global-auto-revert-mode)
(diminish 'auto-revert-mode)

(setq-default require-final-newline t)
(setq ring-bell-function 'ignore)
;; (setq debug-on-error t)

(provide 'setup-misc)
