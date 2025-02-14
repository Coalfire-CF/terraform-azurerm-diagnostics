resource "azurerm_monitor_diagnostic_setting" "rdec_diag" {
  count                      = var.resource_type == "rdec" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "redisenterprise_securityLogs"
  target_resource_id         = var.resource_id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
