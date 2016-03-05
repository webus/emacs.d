(require-package 'dart-mode)

(setq dart-enable-analysis-server t)
(add-hook 'dart-mode-hook 'flycheck-mode)

(provide 'init-dart)
