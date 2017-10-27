(defmacro which-key-replace (&rest more)
  "If which-key is present, apply the key based replacements."
  `(when (featurep 'which-key)
     (apply #'which-key-add-key-based-replacements ',more)))

(provide 'setup-utils)
