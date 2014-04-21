(require-package 'elixir-mode)

(when (package-installed-p 'elixir-mode)
  (require 'elixir-mode))

(provide 'init-elixir)
