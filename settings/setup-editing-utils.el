(use-package unfill)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))

(use-package list-unicode-display)

;; ------------------------------------------------------------
;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(defun sanityinc/open-line-with-reindent (n)
  "A version of `open-line' which reindents the start and end positions.
If there is a fill prefix and/or a `left-margin', insert them
on the new line if the line would have been blank.
With arg N, insert N newlines."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
         (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         (loc (point-marker))
         ;; Don't expand an abbrev before point.
         (abbrev-mode nil))
    (delete-horizontal-space t)
    (newline n)
    (indent-according-to-mode)
    (when (eolp)
      (delete-horizontal-space t))
    (goto-char loc)
    (while (> n 0)
      (cond ((bolp)
             (if do-left-margin (indent-to (current-left-margin)))
             (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq n (1- n)))
    (goto-char loc)
    (end-of-line)
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'sanityinc/open-line-with-reindent)

;; ------------------------------------------------------------
;; Undo behaviour

(use-package undo-tree
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode))

;; ------------------------------------------------------------
;; Killing behaviour

(use-package browse-kill-ring
  :bind (("M-Y" . browse-kill-ring)
         :map browse-kill-ring-mode-map
         ("C-g" . browse-kill-ring-quit)
         ("M-n" . browse-kill-ring-forward)
         ("M-p" . browse-kill-ring-previous))
  :config
  (eval-after-load 'page-break-lines
    (push 'browse-kill-ring-mode page-break-lines-modes))
  (setq browse-kill-ring-separator "\f"))

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

;; ------------------------------------------------------------
;; Visual hints

(use-package rainbow-delimiters)

(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))

(use-package symbol-overlay
  :diminish symbol-overlay-mode
  :bind (:map symbol-overlay-mode-map
              ("M-n" . symbol-overlay-jump-next)
              ("M-p" . symbol-overlay-jump-prev)
              ("M-i" . symbol-overlay-put)
              ("M-I" . symbol-overlay-remove-all))
  :init
  (dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
    (add-hook hook 'symbol-overlay-mode)))

(show-paren-mode 1)

(cua-selection-mode t)

;; (use-package highlight-escape-sequences)
;; (hes-mode)

;; ------------------------------------------------------------
;; Narrowing

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; ------------------------------------------------------------
;; Selection behaviour

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy
  :bind ("C-;" . avy-goto-char-timer))

(use-package multiple-cursors
  :bind (("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-+" . mc/mark-next-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-c m r" . set-rectangular-region-anchor)
         ("C-c m c" . mc/edit-lines)
         ("C-c m e" . mc/edit-ends-of-lines)
         ("C-c m a" . mc/edit-beginnings-of-lines)))

;;------------------------------------------------------------
;; Page break lines

(use-package page-break-lines
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

(use-package page-break-lines
  :diminish pages-break-lines-mode)
(global-page-break-lines-mode)

;; ------------------------------------------------------------
;; Move lines

(use-package move-dup
  :bind (("M-<up>" . md/move-lines-up)
         ("M-<down>" . md/move-lines-down)
         ("M-S-<up>" . md/move-lines-up)
         ("M-S-<down>" . md/move-lines-down)
         ("C-c d" . md/duplicate-down)
         ("C-c D" . md/duplicate-up)))


;; ------------------------------------------------------------
;; guide-key

(use-package guide-key
  :disabled
  :diminish guide-key-mode
  :config
  (setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n" "C-x C-r" "C-x r" "M-s" "C-h" "C-c C-a"))
  (guide-key-mode 1))

(provide 'setup-editing-utils)
