(require-package 'web-mode)

(when (package-installed-p 'web-mode)
  (require 'web-mode))


(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
;;(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-indentation t)

(provide 'init-web-mode)
