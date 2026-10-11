output "services_id" {
  description = "Map of id values across all services, keyed the same as var.services except keys with no id are omitted"
  value       = { for k, v in docker_service.services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "services_auth" {
  description = "Map of auth values across all services, keyed the same as var.services except keys with no auth are omitted"
  value       = { for k, v in docker_service.services : k => one(v.auth) if v.auth != null && length(v.auth) > 0 }
  sensitive   = true
}
output "services_converge_config" {
  description = "Map of converge_config values across all services, keyed the same as var.services except keys with no converge_config are omitted"
  value       = { for k, v in docker_service.services : k => one(v.converge_config) if v.converge_config != null && length(v.converge_config) > 0 }
}
output "services_endpoint_spec" {
  description = "Map of endpoint_spec values across all services, keyed the same as var.services except keys with no endpoint_spec are omitted"
  value       = { for k, v in docker_service.services : k => one(v.endpoint_spec) if v.endpoint_spec != null && length(v.endpoint_spec) > 0 }
}
output "services_labels" {
  description = "Map of labels values across all services, keyed the same as var.services except keys with no labels are omitted"
  value       = { for k, v in docker_service.services : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "services_mode" {
  description = "Map of mode values across all services, keyed the same as var.services except keys with no mode are omitted"
  value       = { for k, v in docker_service.services : k => one(v.mode) if v.mode != null && length(v.mode) > 0 }
}
output "services_name" {
  description = "Map of name values across all services, keyed the same as var.services except keys with no name are omitted"
  value       = { for k, v in docker_service.services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "services_rollback_config" {
  description = "Map of rollback_config values across all services, keyed the same as var.services except keys with no rollback_config are omitted"
  value       = { for k, v in docker_service.services : k => one(v.rollback_config) if v.rollback_config != null && length(v.rollback_config) > 0 }
}
output "services_task_spec" {
  description = "Map of task_spec values across all services, keyed the same as var.services except keys with no task_spec are omitted"
  value       = { for k, v in docker_service.services : k => one(v.task_spec) if v.task_spec != null && length(v.task_spec) > 0 }
}
output "services_update_config" {
  description = "Map of update_config values across all services, keyed the same as var.services except keys with no update_config are omitted"
  value       = { for k, v in docker_service.services : k => one(v.update_config) if v.update_config != null && length(v.update_config) > 0 }
}

