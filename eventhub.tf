resource "azurerm_monitor_diagnostic_setting" "eh_diag" {
  count                      = var.resource_type == "eh" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "eventhub_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ApplicationMetricsLogs"
  }
  enabled_log {
    category = "RuntimeAuditLogs"
  }
  enabled_log {
    category = "ArchiveLogs"
  }
  enabled_log {
    category = "AutoScaleLogs"
  }
  enabled_log {
    category = "CustomerManagedKeyUserLogs"
  }
  enabled_log {
    category = "EventHubVNetConnectionEvent"
  }
  enabled_log {
    category = "KafkaCoordinatorLogs"
  }
  enabled_log {
    category = "KafkaUserErrorLogs"
  }
  enabled_log {
    category = "OperationalLogs"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
