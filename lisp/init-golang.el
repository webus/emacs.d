(require-package 'go-mode)
(require-package 'go-autocomplete)

(after-load 'auto-complete
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default))

(provide 'init-golang)
