(require-package 'go-mode)
(require-package 'go-autocomplete)

;; don't forget to install "go get github.com/nsf/gocode" for autocomplete
;; also install this "go get github.com/rogpeppe/godef" for better code browsing

(after-load 'auto-complete
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default))

(provide 'init-golang)
