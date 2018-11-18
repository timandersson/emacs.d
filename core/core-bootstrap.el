(require 'package)

(setq package-archives
		'(("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa"        . "https://melpa.org/packages/")
	("gnu"          . "https://elpa.gnu.org/packages/")))
	
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'bind-key))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'core-bootstrap)