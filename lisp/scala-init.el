(require-package 'ammonite-term-repl)
(require-package 'flycheck)
;; Add metals backend for lsp-mode
(require-package 'lsp-metals)
;; Enable nice rendering of documentation on hover
(require-package 'lsp-ui)
;; Posframe is a pop-up tool that must be manually installed for dap-mode
(require-package 'posframe)
(require-package 'scala-mode)
;; (require-package 'scala-mode
;;  :interpreter
;;  ("scala" . scala-mode))



(add-hook 'scala-mode-hook
          (lambda ()
            (ammonite-term-repl-minor-mode t)))


(add-hook 'scala-mode-hook #'flycheck-mode)



(provide 'scala-init)
