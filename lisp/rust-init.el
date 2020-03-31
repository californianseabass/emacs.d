(require-package 'cargo)
(require-package 'flycheck-rust)
(require-package 'rust-mode)

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook 'rust-format-buffer)))

(provide 'rust-init)
