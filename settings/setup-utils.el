(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-separator " => ")
  (which-key-add-key-based-replacements "C-x 8" "unicode")
  (which-key-mode 1)

  (defmacro which-key-replace (&rest more)
    "If which-key is present, apply the key based replacements."
    `(eval-after-load 'which-key-mode
       (apply #'which-key-add-key-based-replacements ',more))))

(provide 'setup-utils)
