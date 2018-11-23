(use-package solarized-theme
  :config
  (progn (setq solarized-emphasize-indicators nil
               solarized-high-contrast-mode-line nil
               solarized-scale-org-headlines nil
               solarized-use-less-bold t
               solarized-use-variable-pitch nil
               solarized-distinct-fringe-background nil)))

(use-package all-the-icons
  :demand
  :init
  (progn
    (setq inhibit-compacting-font-caches t)
    (defun -custom-modeline-github-vc ()
      (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
        (concat
         (propertize (format " %s" (all-the-icons-octicon "git-branch"))
                     'face `(:height 1 :family ,(all-the-icons-octicon-family))
                     'display '(raise 0))
         (propertize (format " %s" branch))
         (propertize "  "))))

    (defun -custom-modeline-svn-vc ()
      (let ((revision (cadr (split-string vc-mode "-"))))
        (concat
         (propertize (format " %s" (all-the-icons-faicon "cloud"))
                     'face `(:height 1)
                     'display '(raise 0))
         (propertize (format " %s" revision) 'face `(:height 0.9)))))

    (defvar mode-line-my-vc
      '(:propertize
        (:eval (when vc-mode
                 (cond
                  ((string-match "Git[:-]" vc-mode) (-custom-modeline-github-vc))
                  ((string-match "SVN-" vc-mode) (-custom-modeline-svn-vc))
                  (t (format "%s" vc-mode))))))
      "Formats the current directory."))
  :config
  (progn
    (setq-default mode-line-format
                  (list
                   mode-line-front-space
                   mode-line-mule-info
                   mode-line-modified
                   mode-line-frame-identification
                   mode-line-buffer-identification
                   " "
                   mode-line-position
                   mode-line-my-vc
                   mode-line-modes))
    ))

(load-theme 'solarized-light)

(set-face-attribute 'mode-line nil
                    :background "#eee8d5"
                    :foreground "#657b83"
                    :box '(:line-width 4 :color "#eee8d5")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#fdf6e3"
                    :foreground "#93a1a1"
                    :box '(:line-width 4 :color "#eee8d5")
                    :overline nil
                    :underline nil)

(set-face-attribute 'default nil :height 80)

(provide 'module-solarized)
