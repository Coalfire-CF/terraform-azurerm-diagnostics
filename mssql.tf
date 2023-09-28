resource "azurerm_monitor_diagnostic_setting" "mssql_diag" {
  count                      = var.resource_type == "mssql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "mssql_securitylogs"
  target_resource_id         = var.resource_id


  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
}

resource "azurerm_mssql_server_extended_auditing_policy" "mssql_audit_policy" {
  count                  = var.resource_type == "mssql" ? 1 : 0
  server_id              = var.resource_id
  log_monitoring_enabled = true
}
