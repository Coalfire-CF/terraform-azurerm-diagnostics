resource "azurerm_monitor_diagnostic_setting" "avd_hostpool_diag" {
  count                      = var.resource_type == "avd_pool" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "avd_pool_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Checkpoint"
  }
  enabled_log {
    category = "Error"
  }
  enabled_log {
    category = "Management"


    retention_policy {
      enabled = true
      days    = 0

    }
  }
  enabled_log {
    category = "Connection"
  }
  enabled_log {
    category = "HostRegistration"
  }
  enabled_log {
    category = "AgentHealthStatus"
  }
  enabled_log {
    category = "SessionHostManagement"
  }
  enabled_log {
    category = "NetworkData"
  }
}
