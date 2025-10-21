resource "azurerm_monitor_diagnostic_setting" "kv_diag" {
  count                      = var.resource_type == "kv" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "keyvault_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AuditEvent"
  }

  enabled_log {
    category = "AzurePolicyEvaluationDetails"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
