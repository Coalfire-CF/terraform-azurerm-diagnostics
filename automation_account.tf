resource "azurerm_monitor_diagnostic_setting" "aa_diag" {
  count                      = var.resource_type == "aa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "automationaccount_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AuditEvent"
  }
  enabled_log {
    category = "DscNodeStatus"
  }
  enabled_log {
    category = "JobLogs"

  }
  enabled_log {
    category = "JobStreams"

  }

}
