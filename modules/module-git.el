(use-package git-gutter
  :demand
  :bind (("C-c g" . git-gutter-mode))
  :custom
  (git-gutter:modified-sign " ")
  (git-gutter:added-sign " ")
  (git-gutter:deleted-sign " ")
  :custom-face
  (git-gutter:added ((t (:background "green"))))
  (git-gutter:modified ((t (:background "yellow"))))
  (git-gutter:deleted ((t (:background "red"))))
  :config
  (global-git-gutter-mode +1))

(provide 'module-git)
