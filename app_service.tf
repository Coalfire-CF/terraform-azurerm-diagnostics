resource "azurerm_monitor_diagnostic_setting" "asp_diag" {
  count                      = var.resource_type == "asp" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "asp_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AppServiceAntivirusScanAuditLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceAppLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceAuditLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceConsoleLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceFileAuditLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceHTTPLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServiceIPSecAuditLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "AppServicePlatformLogs"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}