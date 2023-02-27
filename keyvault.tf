resource "azurerm_monitor_diagnostic_setting" "kv_diag" {
  count                      = var.resource_type == "kv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "keyvault_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AuditEvent"


    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AzurePolicyEvaluationDetails"


    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
