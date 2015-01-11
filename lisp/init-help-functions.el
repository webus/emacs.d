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

(defun angular-controller-create (controller_name app_name)
  "CONTROLLER_NAME.  APP_NAME."
  (interactive "sController name ? \nsApplication name ? ")
  (let ((controller_file (concat controller_name ".js")))
    (write-region "" "" controller_file)
    (append-to-file "'use strict';\n\n" nil controller_file)
    (append-to-file (format "angular.module('%s').controller('%s',['$scope','$http',function($scope,$http){}]);\n" app_name controller_name) nil controller_file)
    ))

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
  (insert "import ipdb; ipdb.set_trace()"))

(defun django-override-get-context-data (class_name)
  "CLASS_NAME."
  (interactive "sClass name ? ")
  (insert "def get_context_data(self, **kwargs):")
  (insert "\n")
  (insert (format "    context=super(%s, self).get_context_data(**kwargs)" class_name))
  (indent-for-tab-command)
  (insert "\n")
  (insert "    context['name'] = None")
  (indent-for-tab-command)
  (insert "\n")
  (insert "    return context")
  (indent-for-tab-command)
  (insert "\n")
  )

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

; site.yml
; webservers.yml
; fooservers.yml
; roles/
;    common/
;      files/
;      templates/
;      tasks/
;      handlers/
;      vars/
;      defaults/
;      meta/
;    webservers/
;      files/
;      templates/
;      tasks/
;      handlers/
;      vars/
;      defaults/
;      meta/
(defun ansible-create-role (role_name)
  "ROLE_NAME."
  (interactive "sRole name ? ")
  (make-directory "roles")
  (make-directory (format "roles/%s" role_name))
  (make-directory (format "roles/%s/tasks" role_name))
  (write-region "" "" (format "roles/%s/tasks/main.yml" role_name))
  (make-directory (format "roles/%s/handlers" role_name))
  (write-region "" "" (format "roles/%s/handlers/main.yml" role_name))
  (make-directory (format "roles/%s/templates" role_name))
  (make-directory (format "roles/%s/files" role_name))
  (make-directory (format "roles/%s/vars" role_name))
  (write-region "" "" (format "roles/%s/vars/main.yml" role_name))
  (make-directory (format "roles/%s/defaults" role_name))
  (write-region "" "" (format "roles/%s/defaults/main.yml" role_name))
  (make-directory (format "roles/%s/meta" role_name))
  (write-region "" "" (format "roles/%s/meta/main.yml" role_name))
  )


(byte-compile 'django-make-command)

(provide 'init-help-functions)
;;; init-help-functions.el ends here
