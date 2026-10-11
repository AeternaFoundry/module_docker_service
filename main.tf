resource "docker_service" "services" {
  for_each = var.services

  name = each.value.name

  task_spec {
    container_spec {
      args     = each.value.task_spec.container_spec.args
      cap_add  = each.value.task_spec.container_spec.cap_add
      cap_drop = each.value.task_spec.container_spec.cap_drop
      command  = each.value.task_spec.container_spec.command
      dynamic "configs" {
        for_each = each.value.task_spec.container_spec.configs != null ? each.value.task_spec.container_spec.configs : []
        content {
          config_id   = configs.value.config_id
          config_name = configs.value.config_name
          file_gid    = configs.value.file_gid
          file_mode   = configs.value.file_mode
          file_name   = configs.value.file_name
          file_uid    = configs.value.file_uid
        }
      }
      dir = each.value.task_spec.container_spec.dir
      dynamic "dns_config" {
        for_each = each.value.task_spec.container_spec.dns_config != null ? [each.value.task_spec.container_spec.dns_config] : []
        content {
          nameservers = dns_config.value.nameservers
          options     = dns_config.value.options
          search      = dns_config.value.search
        }
      }
      env    = each.value.task_spec.container_spec.env
      groups = each.value.task_spec.container_spec.groups
      dynamic "healthcheck" {
        for_each = each.value.task_spec.container_spec.healthcheck != null ? [each.value.task_spec.container_spec.healthcheck] : []
        content {
          interval     = healthcheck.value.interval
          retries      = healthcheck.value.retries
          start_period = healthcheck.value.start_period
          test         = healthcheck.value.test
          timeout      = healthcheck.value.timeout
        }
      }
      hostname = each.value.task_spec.container_spec.hostname
      dynamic "hosts" {
        for_each = each.value.task_spec.container_spec.hosts != null ? each.value.task_spec.container_spec.hosts : []
        content {
          host = hosts.value.host
          ip   = hosts.value.ip
        }
      }
      image     = each.value.task_spec.container_spec.image
      init      = each.value.task_spec.container_spec.init
      isolation = each.value.task_spec.container_spec.isolation
      dynamic "labels" {
        for_each = each.value.task_spec.container_spec.labels != null ? each.value.task_spec.container_spec.labels : []
        content {
          label = labels.value.label
          value = labels.value.value
        }
      }
      dynamic "mounts" {
        for_each = each.value.task_spec.container_spec.mounts != null ? each.value.task_spec.container_spec.mounts : []
        content {
          dynamic "bind_options" {
            for_each = mounts.value.bind_options != null ? [mounts.value.bind_options] : []
            content {
              propagation = bind_options.value.propagation
            }
          }
          read_only = mounts.value.read_only
          source    = mounts.value.source
          target    = mounts.value.target
          dynamic "tmpfs_options" {
            for_each = mounts.value.tmpfs_options != null ? [mounts.value.tmpfs_options] : []
            content {
              mode       = tmpfs_options.value.mode
              size_bytes = tmpfs_options.value.size_bytes
            }
          }
          type = mounts.value.type
          dynamic "volume_options" {
            for_each = mounts.value.volume_options != null ? [mounts.value.volume_options] : []
            content {
              driver_name    = volume_options.value.driver_name
              driver_options = volume_options.value.driver_options
              dynamic "labels" {
                for_each = volume_options.value.labels != null ? volume_options.value.labels : []
                content {
                  label = labels.value.label
                  value = labels.value.value
                }
              }
              no_copy = volume_options.value.no_copy
            }
          }
        }
      }
      dynamic "privileges" {
        for_each = each.value.task_spec.container_spec.privileges != null ? [each.value.task_spec.container_spec.privileges] : []
        content {
          dynamic "credential_spec" {
            for_each = privileges.value.credential_spec != null ? [privileges.value.credential_spec] : []
            content {
              file     = credential_spec.value.file
              registry = credential_spec.value.registry
            }
          }
          dynamic "se_linux_context" {
            for_each = privileges.value.se_linux_context != null ? [privileges.value.se_linux_context] : []
            content {
              disable = se_linux_context.value.disable
              level   = se_linux_context.value.level
              role    = se_linux_context.value.role
              type    = se_linux_context.value.type
              user    = se_linux_context.value.user
            }
          }
        }
      }
      read_only = each.value.task_spec.container_spec.read_only
      dynamic "secrets" {
        for_each = each.value.task_spec.container_spec.secrets != null ? each.value.task_spec.container_spec.secrets : []
        content {
          file_gid    = secrets.value.file_gid
          file_mode   = secrets.value.file_mode
          file_name   = secrets.value.file_name
          file_uid    = secrets.value.file_uid
          secret_id   = secrets.value.secret_id
          secret_name = secrets.value.secret_name
        }
      }
      stop_grace_period = each.value.task_spec.container_spec.stop_grace_period
      stop_signal       = each.value.task_spec.container_spec.stop_signal
      sysctl            = each.value.task_spec.container_spec.sysctl
      user              = each.value.task_spec.container_spec.user
    }
    force_update = each.value.task_spec.force_update
    dynamic "log_driver" {
      for_each = each.value.task_spec.log_driver != null ? [each.value.task_spec.log_driver] : []
      content {
        name    = log_driver.value.name
        options = log_driver.value.options
      }
    }
    dynamic "networks_advanced" {
      for_each = each.value.task_spec.networks_advanced != null ? each.value.task_spec.networks_advanced : []
      content {
        aliases     = networks_advanced.value.aliases
        driver_opts = networks_advanced.value.driver_opts
        id          = networks_advanced.value.id
        name        = networks_advanced.value.name
      }
    }
    dynamic "placement" {
      for_each = each.value.task_spec.placement != null ? [each.value.task_spec.placement] : []
      content {
        constraints  = placement.value.constraints
        max_replicas = placement.value.max_replicas
        dynamic "platforms" {
          for_each = placement.value.platforms != null ? placement.value.platforms : []
          content {
            architecture = platforms.value.architecture
            os           = platforms.value.os
          }
        }
        prefs = placement.value.prefs
      }
    }
    dynamic "resources" {
      for_each = each.value.task_spec.resources != null ? [each.value.task_spec.resources] : []
      content {
        dynamic "limits" {
          for_each = resources.value.limits != null ? [resources.value.limits] : []
          content {
            memory_bytes = limits.value.memory_bytes
            nano_cpus    = limits.value.nano_cpus
          }
        }
        dynamic "reservation" {
          for_each = resources.value.reservation != null ? [resources.value.reservation] : []
          content {
            dynamic "generic_resources" {
              for_each = reservation.value.generic_resources != null ? [reservation.value.generic_resources] : []
              content {
                discrete_resources_spec = generic_resources.value.discrete_resources_spec
                named_resources_spec    = generic_resources.value.named_resources_spec
              }
            }
            memory_bytes = reservation.value.memory_bytes
            nano_cpus    = reservation.value.nano_cpus
          }
        }
      }
    }
    dynamic "restart_policy" {
      for_each = each.value.task_spec.restart_policy != null ? [each.value.task_spec.restart_policy] : []
      content {
        condition    = restart_policy.value.condition
        delay        = restart_policy.value.delay
        max_attempts = restart_policy.value.max_attempts
        window       = restart_policy.value.window
      }
    }
    runtime = each.value.task_spec.runtime
  }

  dynamic "auth" {
    for_each = each.value.auth != null ? [each.value.auth] : []
    content {
      password       = auth.value.password
      server_address = auth.value.server_address
      username       = auth.value.username
    }
  }

  dynamic "converge_config" {
    for_each = each.value.converge_config != null ? [each.value.converge_config] : []
    content {
      delay   = converge_config.value.delay
      timeout = converge_config.value.timeout
    }
  }

  dynamic "endpoint_spec" {
    for_each = each.value.endpoint_spec != null ? [each.value.endpoint_spec] : []
    content {
      mode = endpoint_spec.value.mode
      dynamic "ports" {
        for_each = endpoint_spec.value.ports != null ? endpoint_spec.value.ports : []
        content {
          name           = ports.value.name
          protocol       = ports.value.protocol
          publish_mode   = ports.value.publish_mode
          published_port = ports.value.published_port
          target_port    = ports.value.target_port
        }
      }
    }
  }

  dynamic "labels" {
    for_each = each.value.labels != null ? each.value.labels : []
    content {
      label = labels.value.label
      value = labels.value.value
    }
  }

  dynamic "mode" {
    for_each = each.value.mode != null ? [each.value.mode] : []
    content {
      global = mode.value.global
      dynamic "replicated" {
        for_each = mode.value.replicated != null ? [mode.value.replicated] : []
        content {
          replicas = replicated.value.replicas
        }
      }
    }
  }

  dynamic "rollback_config" {
    for_each = each.value.rollback_config != null ? [each.value.rollback_config] : []
    content {
      delay             = rollback_config.value.delay
      failure_action    = rollback_config.value.failure_action
      max_failure_ratio = rollback_config.value.max_failure_ratio
      monitor           = rollback_config.value.monitor
      order             = rollback_config.value.order
      parallelism       = rollback_config.value.parallelism
    }
  }

  dynamic "update_config" {
    for_each = each.value.update_config != null ? [each.value.update_config] : []
    content {
      delay             = update_config.value.delay
      failure_action    = update_config.value.failure_action
      max_failure_ratio = update_config.value.max_failure_ratio
      monitor           = update_config.value.monitor
      order             = update_config.value.order
      parallelism       = update_config.value.parallelism
    }
  }
}

