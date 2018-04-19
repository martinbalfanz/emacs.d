;; taken from https://github.com/purcell/emacs.d/blob/7940db01b08862b34888ebe05aabedfac21784d9/lisp/init-benchmarking.el

(defun sanityinc/time-subtract-millis (b a)
  (* 1000.0 (float-time (time-subtract b a))))

(defvar sanityinc/require-times nil
  "A list of (FEATURE . LOAD-DURATION).
LOAD-DURATION is the time taken in milliseconds to load FEATURE.")

(defadvice require (around sanityinc/build-require-times (feature &optional filename noerror) activate)
  "Note in `sanityinc/require-times' the time taken to require each feature."
  (let* ((already-loaded (memq feature features))
         (require-start-time (and (not already-loaded) (current-time))))
    (prog1
        ad-do-it
      (when (and (not already-loaded) (memq feature features))
        (let ((time (sanityinc/time-subtract-millis (current-time) require-start-time)))
          (add-to-list 'sanityinc/require-times
                       (cons feature time)
                       t))))))

(defun mb/show-init-time ()
  (let ((threshold 50))
    (message "following packages took more than %.2fms to load:" threshold)
    (dolist (item (--remove (> threshold (cdr it)) sanityinc/require-times))
      (message "%s: %2fms" (car item) (cdr item))))
  (message "init completed in %.2fms"
           (sanityinc/time-subtract-millis after-init-time before-init-time)))

(add-hook 'after-init-hook 'mb/show-init-time)

(setq use-package-verbose t)

(provide 'setup-benchmarking)
