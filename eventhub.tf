resource "azurerm_monitor_diagnostic_setting" "eh_diag" {
  count                      = var.resource_type == "eh" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "eventhub_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "ApplicationMetricsLogs"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "RuntimeAuditLogs"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "ArchiveLogs"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "AutoScaleLogs"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "CustomerManagedKeyUserLogs"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "EventHubVNetConnectionEvent"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "KafkaCoordinatorLogs"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "KafkaUserErrorLogs"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "OperationalLogs"


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
