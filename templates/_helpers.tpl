{{/*
Vault annotations
*/}}
{{- define "taynac.vaultAnnotations" -}}
vault.hashicorp.com/role: "{{ .Values.vault.role }}"
vault.hashicorp.com/agent-inject: "true"
vault.hashicorp.com/agent-pre-populate-only: "true"
vault.hashicorp.com/agent-inject-status: "update"
vault.hashicorp.com/secret-volume-path-secrets.conf: /etc/taynac/taynac.conf.d
vault.hashicorp.com/agent-inject-secret-secrets.conf: "{{ .Values.vault.settings_secret }}"
vault.hashicorp.com/agent-inject-template-secrets.conf: |
  {{ print "{{- with secret \"" .Values.vault.settings_secret "\" -}}" }}
  {{ print "[flask]" }}
  {{ print "secret_key={{ .Data.data.secret_key }}" }}
  {{ print "[keystone_authtoken]" }}
  {{ print "password={{ .Data.data.keystone_password }}" }}
  {{ print "[freshdesk]" }}
  {{ print "key={{ .Data.data.freshdesk_key }}" }}
  {{ print "{{- end -}}" }}
{{- end }}
