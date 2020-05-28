(require-package 'company)
(require-package 'company-terraform)
(require-package 'terraform-mode)

;; use lsp for terraform when 27
(when (eq emacs-major-version 27)
  (add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("terraform-lsp" "-enable-log-file"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

    (add-hook 'terraform-mode-hook #'lsp))

(unless (eq emacs-major-version 27)
  (add-to-list 'company-backends 'company-terraform))

(provide 'terraform-init)
