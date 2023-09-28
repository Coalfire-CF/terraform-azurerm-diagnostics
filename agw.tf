resource "azurerm_monitor_diagnostic_setting" "agw_diag" {
  count                      = var.resource_type == "agw" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "agw_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ApplicationGatewayAccessLog"

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "ApplicationGatewayFirewallLog"

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "ApplicationGatewayPerformanceLog"

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
