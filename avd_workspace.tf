resource "azurerm_monitor_diagnostic_setting" "avd_workspace_diag" {
  count                      = var.resource_type == "avd_ws" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "avd_ws_securityLogs"
  target_resource_id         = var.resource_id

  log {
    category = "Checkpoint"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "Error"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "Management"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "Feed"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}