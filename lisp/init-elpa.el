(require 'package)

(setq package-check-signature nil) ; can be used with gpg key errors, but better to generate a key

(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
    t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))



(provide 'init-elpa)

