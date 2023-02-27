resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  count                      = var.resource_type == "sql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "sql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AutomaticTuning"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "Blocks"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "DatabaseWaitStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "Deadlocks"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "DevOpsOperationsAudit"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Errors"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "QueryStoreWaitStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "SQLInsights"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "SQLSecurityAuditEvents"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "Timeouts"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "Basic"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  metric {
    category = "InstanceAndAppAdvanced"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  metric {
    category = "WorkloadManagement"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
