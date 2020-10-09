(require-package 'ammonite-term-repl)
(require-package 'company-lsp)
(require-package 'company-quickhelp)
(require-package 'flycheck)
(require-package 'sbt-mode)
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


(add-to-list 'auto-mode-alist '("\\.s\\(c\\|cala\\|bt\\)\\'" . scala-mode))

(add-hook 'scala-mode-hook
          (lambda ()
            (ammonite-term-repl-minor-mode t)))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil))


;; add metals backend for lsp-mode
(use-package lsp-metals)

;; Enable nice rendering of documentation on hover
(use-package lsp-ui)

(use-package company-lsp)

(use-package company-quickhelp
  :hook (scala-mode . lsp))

(add-hook 'scala-mode-hook #'flycheck-mode)



(provide 'scala-init)
