(require-package 'jedi)

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(add-hook 'find-file-hooks 'maybe-load-template)
(defun maybe-load-template ()
	(interactive)
	(when (and
		(string-match "\\.py$" (buffer-file-name))
		(eq 1 (point-max)))
	 (insert-file "~/.emacs.d/templates/template.py")))

(provide 'init-python-mode)
