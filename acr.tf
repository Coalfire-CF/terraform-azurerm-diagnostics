resource "azurerm_monitor_diagnostic_setting" "acr_diag" {
  count                      = var.resource_type == "acr" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "acr_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "ContainerRegistryLoginEvents"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  # Not needed for compliance, but valid if enabled
  log {
    category = "ContainerRegistryRepositoryEvents"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
