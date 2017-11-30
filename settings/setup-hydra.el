(use-package hydra
  :ensure t)

;; ------------------------------------------------------------
;; movement

(bind-key "C-n"
          (defhydra hydra-move (:body-pre (next-line) :hint nil)
            "
^Line^             ^Char^            ^Scroll^
^^^^^^------------------------------------------------
_n_: next          _f_: forward      _v_: scroll up
_p_: previous      _b_: backward     _V_: scroll down
_a_: beginning     ^ ^               _l_: recenter
_e_: end
"
            ("n" next-line)
            ("p" previous-line)
            ("f" forward-char)
            ("b" backward-char)
            ("a" mb/beginning-of-line)
            ("e" move-end-of-line)
            ("v" scroll-up-command)
            ;; Converting M-v to V here by analogy.
            ("V" scroll-down-command)
            ("l" recenter-top-bottom)))

;; ------------------------------------------------------------
;; undo-tree

(eval-after-load 'undo-tree-mode
  (bind-key "M-m u"
            (defhydra hydra-undo-tree ()
              "undo-tree"
              ("p" undo-tree-undo "undo")
              ("n" undo-tree-redo "redo")
              ("s" undo-tree-save-history "save")
              ("l" undo-tree-load-history "load")
              ("v" undo-tree-visualize "visualize" :color blue))))

(which-key-replace "M-m u" "undo-tree")

(provide 'setup-hydra)
