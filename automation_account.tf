resource "azurerm_monitor_diagnostic_setting" "aa_diag" {
  count                      = var.resource_type == "aa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "automationaccount_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AuditEvent"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "DscNodeStatus"

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "JobLogs"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "JobStreams"


    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      days    = 365
      enabled = false
    }
  }
}
