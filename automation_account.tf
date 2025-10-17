resource "azurerm_monitor_diagnostic_setting" "aa_diag" {
  count                      = var.resource_type == "aa" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "automationaccount_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "AuditEvent"
    enabled  = true
    retention_policy { enabled = false days = 0 }
  }

  log {
    category = "DscNodeStatus"
    enabled  = true
    retention_policy { enabled = false days = 0 }
  }

  log {
    category = "JobLogs"
    enabled  = true
    retention_policy { enabled = false days = 0 }
  }

  log {
    category = "JobStreams"
    enabled  = true
    retention_policy { enabled = false days = 0 }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy { enabled = false days = 0 }
  }
}
