(setq ibuffer-show-empty-filter-groups nil
      ibuffer-expert t)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")
            (ibuffer-auto-mode 1)
            (hl-line-mode 1)))

(defadvice ibuffer (around ibuffer-point-to-most-recent first () activate)
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))


(use-package ibuffer-vc
  :commands (ibuffer-vc-set-filter-groups-by-vc-root)
  :init
  (add-hook 'ibuffer-hook (lambda ()
                            (ibuffer-vc-set-filter-groups-by-vc-root)
                            (unless (eq ibuffer-sorting-mode 'filename/process)
                              (ibuffer-do-sort-by-filename/process)))))

(provide 'setup-ibuffer)
