;; Init

(package-initialize)

(setq load-prefer-newer t)

(setq gc-cons-threshold 50000000)


;; Variables and Load paths

(defvar emacs-dir (file-name-directory "~/.emacs.d/init.el")
  "The root dir of the Emacs distribution.")

(defvar core-dir (expand-file-name "core" emacs-dir)
  "The home of core functionality.")

(defvar modules-dir (expand-file-name "modules" emacs-dir)
  "This directory houses all of the modules.")

(defvar persistent-dir (expand-file-name "persistent" emacs-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")

(unless (file-exists-p persistent-dir)
  (make-directory persistent-dir))

(defun add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))  
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (add-to-list 'load-path name)
        (add-subfolders-to-load-path name)))))  

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)  


;; Core

(require 'core-bootstrap)
(require 'core-paths)
(require 'core-packages)
(require 'core-ui)


;; Modules

;;(if (display-graphic-p)
;;    (require 'module-solarized))

(require 'module-volatile-highlights)
(require 'module-smartparens)
(require 'module-git)
