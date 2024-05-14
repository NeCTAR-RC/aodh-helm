{{- define "aodh-conf" }}
[DEFAULT]

[service_credentials]
auth_url={{ .Values.conf.keystone.auth_url }}
region_name={{ .Values.conf.keystone.region_name }}
username={{ .Values.conf.keystone.username }}
project_name={{ .Values.conf.keystone.project_name }}
project_domain_name=Default
user_domain_name=Default
auth_type=password

[api]
gnocchi_external_project_owner=service
gnocchi_external_domain_name=Default

[database]
connection_recycle_time=600

[oslo_messaging_rabbit]
amqp_durable_queues=True
heartbeat_in_pthread=True
heartbeat_timeout_threshold=60
ssl=True

[oslo_policy]
policy_file=/etc/aodh/policy.yaml

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
service_type=alarming
service_token_roles_required=True

[listener]
workers=1
[evaluator]
workers=1
[notifier]
workers=1
{{- end }}
