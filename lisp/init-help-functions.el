;;; package --- Summary
;;; Commentary:
;;; Code:

(defun django-extend-template ()
  "Make copyright."
  (interactive)
  (insert "{% extends '' %}\n\n")
  (insert "{% block content %}\n")
  (insert "{% endblock %}\n")
  )

(provide 'init-help-functions)
;;; init-help-functions.el ends here
