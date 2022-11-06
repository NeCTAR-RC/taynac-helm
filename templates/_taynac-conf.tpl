{{- define "taynac-conf" }}

[freshdesk]
domain = {{ .Values.conf.freshdesk.domain }}
email_config_id = {{ .Values.conf.freshdesk.email_config_id }}
group_id = {{ .Values.conf.freshdesk.group_id }}

[keystone_authtoken]
auth_url={{ .Values.conf.keystone.auth_url }}
www_authenticate_uri={{ .Values.conf.keystone.auth_url }}
username={{ .Values.conf.keystone.username }}
project_name={{ .Values.conf.keystone.project_name }}
user_domain_name=Default
project_domain_name=Default
auth_type=password
{{- if .Values.conf.keystone.memcached_servers }}
memcached_servers={{ join "," .Values.conf.keystone.memcached_servers }}
{{- end }}

{{- end }}
