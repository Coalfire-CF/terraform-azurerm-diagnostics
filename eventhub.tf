resource "azurerm_monitor_diagnostic_setting" "eh_diag" {
  count                      = var.resource_type == "eh" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "eventhub_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ApplicationMetricsLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "RuntimeAuditLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "ArchiveLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AutoScaleLogs"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "CustomerManagedKeyUserLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "EventHubVNetConnectionEvent"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "KafkaCoordinatorLogs"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "KafkaUserErrorLogs"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "OperationalLogs"
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
