(require 'cl)

(fset 'yes-or-no-p 'y-or-n-p)

(defun indent-buffer ()
  "Reindents the whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max)))

(which-key-replace "M-m b" "Buffer")
(bind-key "M-m b i" 'indent-buffer)

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

(diminish 'auto-fill-mode)

(use-package hideshow-org
  :bind ("M-m TAB" . hs-org/minor-mode))

(use-package stripe-buffer
  :commands stripe-buffer-mode
  :hook ((dired-mode . stripe-buffer-mode)
         (package-menu-mode . stripe-buffer-mode)
         (deft-mode . stripe-buffer-mode)))

;; ------------------------------------------------------------
;; from prelude:
;; automatically save buffers associated with files on buffer switch
;; and on windows switch
;; (defun prelude-auto-save-command ()
;;   "Save the current buffer if `prelude-auto-save' is not nil."
;;   (when (and ;; prelude-auto-save
;;          buffer-file-name
;;          (buffer-modified-p (current-buffer))
;;          (file-writable-p buffer-file-name))
;;     (save-buffer)))

;; (defmacro advise-commands (advice-name commands class &rest body)
;;   "Apply advice named ADVICE-NAME to multiple COMMANDS.
;; The body of the advice is in BODY."
;;   `(progn
;;      ,@(mapcar (lambda (command)
;;                  `(defadvice ,command (,class ,(intern (concat (symbol-name command) "-" advice-name)) activate)
;;                     ,@body))
;;                commands)))

;; ;; advise all window switching functions
;; (advise-commands "auto-save"
;;                  (switch-to-buffer other-window windmove-up windmove-down windmove-left windmove-right)
;;                  before
;;                  (prelude-auto-save-command))

;; (add-hook 'mouse-leave-buffer-hook 'prelude-auto-save-command)

(use-package super-save
  :diminish super-save-mode
  :defer 1
  :config
  (setq super-save-auto-save-when-idle t)
  (super-save-mode +1))

(provide 'setup-misc)
