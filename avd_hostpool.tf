resource "azurerm_monitor_diagnostic_setting" "avd_hostpool_diag" {
  count                      = var.resource_type == "avd_pool" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "avd_pool_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Checkpoint"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Error"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Management"


    retention_policy {
      enabled = true
      days    = 365

    }
  }
  enabled_log {
    category = "Connection"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "HostRegistration"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AgentHealthStatus"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "SessionHostManagement"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "NetworkData"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
