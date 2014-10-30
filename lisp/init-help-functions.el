;;; package --- Summary
;;; Commentary:
;;; Code:

(defun django-extend-template ()
  "Make copyright."
  (interactive)
  (insert "{% extends '' %}\n\n")
  (insert "{% block content %}\n")
  (insert "{% endblock %}\n"))

(defun angular-post ()
  "Make http.post request."
  (interactive)
  (insert "$http.post('/some-url',{data:'hello'}).success(function(data){}).error(function(data){});\n"))

(defun angular-get ()
  "Make http.get request."
  (interactive)
  (insert "$http.get('/some-url').success(function(data){}).error(function(data){});\n"))


(defun django-model-imports (model_name)
  "MODEL_NAME."
  (interactive "sModel name ? ")
  (insert "from django.db import models\n")
  (insert "from django.contrib.auth.models import User\n\n")
  (insert (format "class %s(models.Model):\n" model_name))
  (insert "    pass"))

(defun django-model (model_name)
  "MODEL_NAME."
  (interactive "sModel name ? ")
  (insert (format "class %s(models.Model):\n" model_name))
  (insert "    pass"))

(defun django-break-point ()
  "Python break point."
  (interactive)
  (insert "import ipdb; ipdb.set_trace()\n"))

(byte-compile 'python-break-point)

(defun django-make-command (command_name)
  "COMMAND_NAME."
  (interactive "sCommand name ? ")
  (make-directory "management")
  (write-region "" "" "management/__init__.py")
  (make-directory "management/commands")
  (write-region "" "" "management/commands/__init__.py")
  (write-region "" "" (format "management/commands/%s.py" command_name))
  (let (
        (command-file (format "management/commands/%s.py" command_name))
        )
    (append-to-file "from django.core.management.base import BaseCommand, CommandError\n\n" nil command-file)
    (append-to-file "class Command(BaseCommand):\n" nil command-file)
    (append-to-file "    def handle(self, *args, **options):\n" nil command-file)
    (append-to-file "        pass\n" nil command-file)
    )
  )

(byte-compile 'django-make-command)

(provide 'init-help-functions)
;;; init-help-functions.el ends here
