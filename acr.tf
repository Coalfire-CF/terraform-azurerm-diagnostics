resource "azurerm_monitor_diagnostic_setting" "acr_diag" {
  count                      = var.resource_type == "acr" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "acr_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ContainerRegistryLoginEvents"

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  # Not needed for compliance
  enabled_log {
    category = "ContainerRegistryRepositoryEvents"

    retention_policy {
      days    = 365
      enabled = false
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
