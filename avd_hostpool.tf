resource "azurerm_monitor_diagnostic_setting" "avd_hostpool_diag" {
  count                      = var.resource_type == "avd_pool" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "avd_pool_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Checkpoint"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Error"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Management"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Connection"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "HostRegistration"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AgentHealthStatus"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "SessionHostManagement"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "NetworkData"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
