{{/*
Common labels
*/}}

{{- define "common.labels" -}} 
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "gen.postgres.secret" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "postgres-homer-credentials" -}}
postgres-password: {{ if $secret }} {{ index $secret.data "postgres-password" }} {{ else }} {{ randAlphaNum 32 | b64enc | quote }} {{ end }}
postgres-user: {{ "homer_user" | b64enc | quote }}
{{- end -}}

{{- define "gen.defaultpassword.secret" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "homer-ui-credentials" -}}
default-password: {{ if $secret }} {{ index $secret.data "default-password" }} {{ else }} {{ randAlphaNum 32 | b64enc | quote }} {{ end }}
{{- end -}}

{{/*
Homer pull secrets
*/}}
{{- define "homer.imagePullSecrets" -}}
{{- if .Values.homer.image.pullSecrets }}
imagePullSecrets:
{{- with .Values.homer.image.pullSecrets }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
HeplifyServer pull secrets
*/}}
{{- define "heplifyServer.imagePullSecrets" -}}
{{- if .Values.heplifyServer.image.pullSecrets }}
imagePullSecrets:
{{- with .Values.heplifyServer.image.pullSecrets }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Influxdb pull secrets
*/}}
{{- define "influxdb.imagePullSecrets" -}}
{{- if .Values.influxdb.image.pullSecrets }}
imagePullSecrets:
{{- with .Values.influxdb.image.pullSecrets }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}

{{/*
Telegraf pull secrets
*/}}
{{- define "telegraf.imagePullSecrets" -}}
{{- if .Values.telegraf.image.pullSecrets }}
imagePullSecrets:
{{- with .Values.telegraf.image.pullSecrets }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}

