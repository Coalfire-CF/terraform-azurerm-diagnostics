resource "azurerm_monitor_diagnostic_setting" "law_diag" {
  count                      = var.resource_type == "law" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "law_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Audit"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = false
    }
  }
}
