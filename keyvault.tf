resource "azurerm_monitor_diagnostic_setting" "kv_diag" {
  count                      = var.resource_type == "kv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "keyvault_securityLogs"
  target_resource_id         = var.resource_id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  log {
    category = "AzurePolicyEvaluationDetails"
    enabled  = true

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
      enabled = true
    }
  }
}
