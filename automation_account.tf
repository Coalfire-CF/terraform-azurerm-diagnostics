resource "azurerm_monitor_diagnostic_setting" "aa_diag" {
  count                      = var.resource_type == "aa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "automationaccount_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "DscNodeStatus"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "JobLogs"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "JobStreams"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
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
