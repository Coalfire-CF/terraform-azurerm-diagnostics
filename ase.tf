resource "azurerm_monitor_diagnostic_setting" "ase_diag" {
  count                      = var.resource_type == "ase" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "appserviceenv_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AppServiceEnvironmentPlatformLogs"
  }

  enabled_metric {
    category = "AllMetrics"
}
}
