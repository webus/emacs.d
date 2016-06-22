(require-package 'typescript-mode)
(require-package 'company)
(require-package 'tide)
(require-package 'flycheck-typescript-tslint)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-typescript-tslint-setup))
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            ;; (company-mode-on)
            (auto-complete-mode 1)
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq typescript-indent-level 2)))

(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq typescript-indent-level 2)

(provide 'init-typescript)
