resource "azurerm_monitor_diagnostic_setting" "asp_diag" {
  count                      = var.resource_type == "asp" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "asp_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AppServiceAntivirusScanAuditLogs"
  }

  enabled_log {
    category = "AppServiceAppLogs"
  }

  enabled_log {
    category = "AppServiceAuditLogs"
  }

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  enabled_log {
    category = "AppServiceFileAuditLogs"
  }

  enabled_log {
    category = "AppServiceHTTPLogs"
  }

  enabled_log {
    category = "AppServiceIPSecAuditLogs"
  }

  enabled_log {
    category = "AppServicePlatformLogs"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
