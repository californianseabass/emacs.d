(require-package 'highlight-indent-guides)
(require-package 'yaml-mode)

(add-hook 'yaml-mode-hook 'highlight-indentation-mode)

(provide 'yaml-init)

