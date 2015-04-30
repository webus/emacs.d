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

(defun django-bootstrap-pagination ()
  "Create pagination block."
  (interactive)
  (insert "{% load easy_get %}")
  (insert "{% if is_paginated %}")
  (insert "<ul class='pagination pagination-centered'>")
  (insert "{% if page_obj.has_previous %}")
  (insert "<li><a href='{% append_to_get page=1 %}'><<</a></li>")
  (insert "<li><a href='{% append_to_get page=page_obj.previous_page_number %}'><</a></li>")
  (insert "{% endif %}")
  (insert "<li class='active'><a href='{% append_to_get page=page_obj.number %}'>{{page_obj.number}}</a></li>")
  (insert "{% if page_obj.has_next %}")
  (insert "<li><a href='{% append_to_get page=page_obj.next_page_number %}'>></a></li>")
  (insert "<li><a href='{% append_to_get page=page_obj.paginator.num_pages %}'>>></a></li>")
  (insert "{% endif %}")
  (insert "</ul>")
  (insert "{% endif %}")
  )

(defun angular-controller-create (controller_name app_name)
  "CONTROLLER_NAME.  APP_NAME."
  (interactive "sController name ? \nsApplication name ? ")
  (let ((controller_file (concat controller_name ".js")))
    (write-region "" "" controller_file)
    (append-to-file "'use strict';\n\n" nil controller_file)
    (append-to-file (format "angular.module('%s').controller('%s',['$scope','$http',function($scope,$http){}]);\n" app_name controller_name) nil controller_file)
    ))

(defun angular-app-init (application_name)
  "APPLICATION_NAME."
  (interactive "sApplication name ?")
  (insert "'use strict';\n")
  (insert (format "angular.module('coolteamApp',[]);\n" application_name))
  (insert "angular.module('coolteamApp').config(function($httpProvider) {\n")
  (insert "  return $httpProvider.defaults.headers.post['X-CSRFToken'] = $('meta[name=csrfmiddlewaretoken]').attr('content');")
  (insert "});"))

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

; http://stackoverflow.com/questions/3417438/closing-all-other-buffers-in-emacs
(defun close-all-buffers ()
  "Close all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode `dired-mode) default-directory (buffer-file-name))))
    (when filename (kill-new filename) (message "Copied buffer file name %s to the clipboard." filename))))

(provide 'init-help-functions)
;;; init-help-functions.el ends here
