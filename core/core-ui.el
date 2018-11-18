(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable menu bar unless on osx then use osx theme
(when (or (not (eq system-type 'darwin)) (not (display-graphic-p)))
  (menu-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode -1)            ; the blinking cursor is nothing, but an annoyance
(setq ring-bell-function 'ignore) ; disable the annoying bell ring
(setq inhibit-startup-screen t)   ; disable startup screen
(fset 'yes-or-no-p 'y-or-n-p)     ; enable y/n answers

(delete-selection-mode t) ; Delete Marked regions
(show-paren-mode t)       ; Show matching parenthesis

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indicate-empty-lines nil)

(setq whitespace-line-column 80)
(setq whitespace-style '(face trailing lines-tail))
(setq whitespace-line '(:background "light gray" :foreground "peru"))
(setq whitespace-empty '(:background "yellow"))
(setq whitespace-trailing '(:background "firebrick"))
(add-hook 'prog-mode-hook 'whitespace-mode)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq-default fill-column 80)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq echo-keystrokes 0.1)

(provide 'core-ui)
