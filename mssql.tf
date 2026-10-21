resource "azurerm_mssql_server_extended_auditing_policy" "mssql_audit_policy" {
  count                  = var.resource_type == "mssql" ? 1 : 0
  server_id              = var.resource_id
  log_monitoring_enabled = true

  # The master database setting must exist before auditing sends to Log Analytics.
  depends_on = [azurerm_monitor_diagnostic_setting.this]
}
