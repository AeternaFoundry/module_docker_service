variable "services" {
  description = <<EOT
Map of services, attributes below
Required:
    - name
    - task_spec (block):
        - container_spec (required, block):
            - args (optional)
            - cap_add (optional)
            - cap_drop (optional)
            - command (optional)
            - configs (optional, block):
                - config_id (required)
                - config_name (optional)
                - file_gid (optional)
                - file_mode (optional)
                - file_name (required)
                - file_uid (optional)
            - dir (optional)
            - dns_config (optional, block):
                - nameservers (required)
                - options (optional)
                - search (optional)
            - env (optional)
            - groups (optional)
            - healthcheck (optional, block):
                - interval (optional)
                - retries (optional)
                - start_period (optional)
                - test (optional)
                - timeout (optional)
            - hostname (optional)
            - hosts (optional, block):
                - host (required)
                - ip (required)
            - image (required)
            - init (optional)
            - isolation (optional)
            - labels (optional, block):
                - label (required)
                - value (required)
            - mounts (optional, block):
                - bind_options (optional, block):
                    - propagation (optional)
                - read_only (optional)
                - source (optional)
                - target (required)
                - tmpfs_options (optional, block):
                    - mode (optional)
                    - size_bytes (optional)
                - type (required)
                - volume_options (optional, block):
                    - driver_name (optional)
                    - driver_options (optional)
                    - labels (optional, block):
                        - label (required)
                        - value (required)
                    - no_copy (optional)
            - privileges (optional, block):
                - credential_spec (optional, block):
                    - file (optional)
                    - registry (optional)
                - se_linux_context (optional, block):
                    - disable (optional)
                    - level (optional)
                    - role (optional)
                    - type (optional)
                    - user (optional)
            - read_only (optional)
            - secrets (optional, block):
                - file_gid (optional)
                - file_mode (optional)
                - file_name (required)
                - file_uid (optional)
                - secret_id (required)
                - secret_name (optional)
            - stop_grace_period (optional)
            - stop_signal (optional)
            - sysctl (optional)
            - user (optional)
        - force_update (optional)
        - log_driver (optional, block):
            - name (required)
            - options (optional)
        - networks_advanced (optional, block):
            - aliases (optional)
            - driver_opts (optional)
            - id (optional)
            - name (optional)
        - placement (optional, block):
            - constraints (optional)
            - max_replicas (optional)
            - platforms (optional, block):
                - architecture (required)
                - os (required)
            - prefs (optional)
        - resources (optional, block):
            - limits (optional, block):
                - memory_bytes (optional)
                - nano_cpus (optional)
            - reservation (optional, block):
                - generic_resources (optional, block):
                    - discrete_resources_spec (optional)
                    - named_resources_spec (optional)
                - memory_bytes (optional)
                - nano_cpus (optional)
        - restart_policy (optional, block):
            - condition (optional)
            - delay (optional)
            - max_attempts (optional)
            - window (optional)
        - runtime (optional)
Optional:
    - auth (block):
        - password (optional)
        - server_address (required)
        - username (optional)
    - converge_config (block):
        - delay (optional)
        - timeout (optional)
    - endpoint_spec (block):
        - mode (optional)
        - ports (optional, block):
            - name (optional)
            - protocol (optional)
            - publish_mode (optional)
            - published_port (optional)
            - target_port (required)
    - labels (block):
        - label (required)
        - value (required)
    - mode (block):
        - global (optional)
        - replicated (optional, block):
            - replicas (optional)
    - rollback_config (block):
        - delay (optional)
        - failure_action (optional)
        - max_failure_ratio (optional)
        - monitor (optional)
        - order (optional)
        - parallelism (optional)
    - update_config (block):
        - delay (optional)
        - failure_action (optional)
        - max_failure_ratio (optional)
        - monitor (optional)
        - order (optional)
        - parallelism (optional)
EOT

  type = map(object({
    name = string
    task_spec = object({
      container_spec = object({
        args     = optional(list(string))
        cap_add  = optional(list(string))
        cap_drop = optional(list(string))
        command  = optional(list(string))
        configs = optional(list(object({
          config_id   = string
          config_name = optional(string)
          file_gid    = optional(string)
          file_mode   = optional(number)
          file_name   = string
          file_uid    = optional(string)
        })))
        dir = optional(string)
        dns_config = optional(object({
          nameservers = list(string)
          options     = optional(list(string))
          search      = optional(list(string))
        }))
        env    = optional(map(string))
        groups = optional(list(string))
        healthcheck = optional(object({
          interval     = optional(string)
          retries      = optional(number)
          start_period = optional(string)
          test         = optional(list(string))
          timeout      = optional(string)
        }))
        hostname = optional(string)
        hosts = optional(list(object({
          host = string
          ip   = string
        })))
        image     = string
        init      = optional(bool)
        isolation = optional(string)
        labels = optional(list(object({
          label = string
          value = string
        })))
        mounts = optional(list(object({
          bind_options = optional(object({
            propagation = optional(string)
          }))
          read_only = optional(bool)
          source    = optional(string)
          target    = string
          tmpfs_options = optional(object({
            mode       = optional(number)
            size_bytes = optional(number)
          }))
          type = string
          volume_options = optional(object({
            driver_name    = optional(string)
            driver_options = optional(map(string))
            labels = optional(list(object({
              label = string
              value = string
            })))
            no_copy = optional(bool)
          }))
        })))
        privileges = optional(object({
          credential_spec = optional(object({
            file     = optional(string)
            registry = optional(string)
          }))
          se_linux_context = optional(object({
            disable = optional(bool)
            level   = optional(string)
            role    = optional(string)
            type    = optional(string)
            user    = optional(string)
          }))
        }))
        read_only = optional(bool)
        secrets = optional(list(object({
          file_gid    = optional(string)
          file_mode   = optional(number)
          file_name   = string
          file_uid    = optional(string)
          secret_id   = string
          secret_name = optional(string)
        })))
        stop_grace_period = optional(string)
        stop_signal       = optional(string)
        sysctl            = optional(map(string))
        user              = optional(string)
      })
      force_update = optional(number)
      log_driver = optional(object({
        name    = string
        options = optional(map(string))
      }))
      networks_advanced = optional(list(object({
        aliases     = optional(set(string))
        driver_opts = optional(set(string))
        id          = optional(string)
        name        = optional(string)
      })))
      placement = optional(object({
        constraints  = optional(set(string))
        max_replicas = optional(number)
        platforms = optional(list(object({
          architecture = string
          os           = string
        })))
        prefs = optional(set(string))
      }))
      resources = optional(object({
        limits = optional(object({
          memory_bytes = optional(number)
          nano_cpus    = optional(number)
        }))
        reservation = optional(object({
          generic_resources = optional(object({
            discrete_resources_spec = optional(set(string))
            named_resources_spec    = optional(set(string))
          }))
          memory_bytes = optional(number)
          nano_cpus    = optional(number)
        }))
      }))
      restart_policy = optional(object({
        condition    = optional(string)
        delay        = optional(string)
        max_attempts = optional(number)
        window       = optional(string)
      }))
      runtime = optional(string)
    })
    auth = optional(object({
      password       = optional(string)
      server_address = string
      username       = optional(string)
    }))
    converge_config = optional(object({
      delay   = optional(string)
      timeout = optional(string)
    }))
    endpoint_spec = optional(object({
      mode = optional(string)
      ports = optional(list(object({
        name           = optional(string)
        protocol       = optional(string)
        publish_mode   = optional(string)
        published_port = optional(number)
        target_port    = number
      })))
    }))
    labels = optional(list(object({
      label = string
      value = string
    })))
    mode = optional(object({
      global = optional(bool)
      replicated = optional(object({
        replicas = optional(number)
      }))
    }))
    rollback_config = optional(object({
      delay             = optional(string)
      failure_action    = optional(string)
      max_failure_ratio = optional(string)
      monitor           = optional(string)
      order             = optional(string)
      parallelism       = optional(number)
    }))
    update_config = optional(object({
      delay             = optional(string)
      failure_action    = optional(string)
      max_failure_ratio = optional(string)
      monitor           = optional(string)
      order             = optional(string)
      parallelism       = optional(number)
    }))
  }))
  # Note: 35 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

