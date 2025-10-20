resource "azurerm_monitor_diagnostic_setting" "acr_diag" {
  count                      = var.resource_type == "acr" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "acr_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ContainerRegistryLoginEvents"
  }
  # Not needed for compliance
  enabled_log {
    category = "ContainerRegistryRepositoryEvents"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
