{{- define "core.labels" -}}
labels:
  chart: {{ template "core.chart" . }}
  release: {{ .Release.Name }}
  heritage: {{ .Release.Service }}
{{- end -}}

{{- define "core.metadata" -}}
metadata:
  labels:
    release: {{ .Release.Name }}
{{- end -}}

{{- define "core.selector" -}}
selector:
  matchLabels:
    release: {{ .Release.Name }}
{{- end -}}

{{- define "core.envFrom" -}}
envFrom:
- configMapRef:
    name: {{ template "core.name" . }}-configmap
{{- end -}}