(require-package 'ein)
(require-package 'elpy)
(require-package 'flycheck)
(require-package 'jedi)
(require-package 'pipenv)
(require-package 'pyvenv)
(require-package 'use-package)

(require 'ein)
;;(require 'ein-loaddefs)
;;(require 'ein-notebook)
;;(require 'ein-subpackages)

(require 'elpy)
(elpy-enable)
(add-hook 'elpy-mode-hook ( lambda()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

(require 'flycheck)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; note this library requires virutalenv
;; start with M-x jedi:install-server
(require 'jedi)
(setq jedi:complete-on-dot t)


;; python-mode defaults, style should get overwrrite by elpy before-save-hook
;; https://www.emacswiki.org/emacs/IndentingPython
(add-hook 'python-mode-hook
    (lambda ()
      (setq-default indent-tabs-mode t)
      (setq-default tab-width 4)
      (setq-default py-indent-tabs-mode t)
      (jedi:setup)
      (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init)

(use-package pyvenv
  :ensure t
  :config
    (pyvenv-mode 1))


(provide 'python-init)
