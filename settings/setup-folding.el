(use-package origami
  :disabled
  :bind (:map origami-mode-map
              ("C-c f" . origami-recursively-toggle-node)
              ("C-c F" . origami-toggle-all-nodes)))

(use-package yafolding
  :disabled
  :bind (:map yafolding-mode-map
              ("C-<return>" . nil)
              ("C-M-<return>" . nil)
              ("C-S-<return>" . nil)
              ("C-c f" . yafolding-toggle-element)
              ("C-c F" . yafolding-toggle-all))
  :init
  (add-hook 'prog-mode-hook
            (lambda () (yafolding-mode))))

(provide 'setup-folding)
