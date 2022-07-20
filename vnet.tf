resource "azurerm_monitor_diagnostic_setting" "vnet_diag" {
  count                      = var.resource_type == "vnet" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "vnet_securityLogs"
  target_resource_id         = var.resource_id

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}