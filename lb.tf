resource "azurerm_monitor_diagnostic_setting" "lb_diag" {
  count                      = var.resource_type == "lb" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "lb_securityLogs"
  target_resource_id         = var.resource_id

  metric {
    category = "AllMetrics"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
