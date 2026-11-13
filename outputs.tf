output "services_id" {
  description = "Map of id values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => v.id }
}
output "services_auth" {
  description = "Map of auth values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.auth) }
  sensitive   = true
}
output "services_converge_config" {
  description = "Map of converge_config values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.converge_config) }
}
output "services_endpoint_spec" {
  description = "Map of endpoint_spec values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.endpoint_spec) }
}
output "services_labels" {
  description = "Map of labels values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => v.labels }
}
output "services_mode" {
  description = "Map of mode values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.mode) }
}
output "services_name" {
  description = "Map of name values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => v.name }
}
output "services_rollback_config" {
  description = "Map of rollback_config values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.rollback_config) }
}
output "services_task_spec" {
  description = "Map of task_spec values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.task_spec) }
}
output "services_update_config" {
  description = "Map of update_config values across all services, keyed the same as var.services"
  value       = { for k, v in docker_service.services : k => one(v.update_config) }
}

