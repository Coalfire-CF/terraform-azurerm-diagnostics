resource "azurerm_monitor_diagnostic_setting" "logicapp_diag" {
  count                      = var.resource_type == "lga" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "logicapp_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "FunctionAppLogs"
  }

  enabled_log {
    category = "WorkflowRuntime"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
