resource "azurerm_mssql_database_extended_auditing_policy" "mssql_db_audit_policy" {
  count                  = var.resource_type == "mssqldb" ? 1 : 0
  database_id            = var.resource_id
  log_monitoring_enabled = true

  depends_on = [azurerm_monitor_diagnostic_setting.this]
}
