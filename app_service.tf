resource "azurerm_monitor_diagnostic_setting" "asp_diag" {
  count                      = var.resource_type == "asp" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "asp_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "AppServiceAntivirusScanAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceConsoleLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceFileAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServiceIPSecAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AppServicePlatformLogs"
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
