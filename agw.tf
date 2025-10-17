resource "azurerm_monitor_diagnostic_setting" "agw_diag" {
  count                      = var.resource_type == "agw" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "agw_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "ApplicationGatewayAccessLog"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "ApplicationGatewayPerformanceLog"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "ApplicationGatewayFirewallLog"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}

