resource "azurerm_monitor_diagnostic_setting" "mssql_ep_diag" {
  count                      = var.resource_type == "mssql_ep" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "mssql_elasticPool_securitylogs"
  target_resource_id         = var.resource_id

  enabled_metric {
    category = "Basic"
  }

  enabled_metric {
    category = "InstanceAndAppAdvanced"
  }
}
