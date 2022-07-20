resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  count                      = var.resource_type == "sql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "sql_securityLogs"
  target_resource_id         = var.resource_id

  log {
    category = "AutomaticTuning"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "Blocks"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "DatabaseWaitStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "Deadlocks"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "DevOpsOperationsAudit"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "Errors"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "QueryStoreWaitStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  log {
    category = "SQLInsights"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  log {
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