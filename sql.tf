resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  count                      = var.resource_type == "sql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "sql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AutomaticTuning"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "Blocks"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "DatabaseWaitStatistics"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "Deadlocks"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "DevOpsOperationsAudit"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "Errors"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "QueryStoreRuntimeStatistics"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "QueryStoreWaitStatistics"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  enabled_log {
    category = "SQLInsights"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "SQLSecurityAuditEvents"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "Timeouts"


    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "Basic"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  metric {
    category = "InstanceAndAppAdvanced"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
  metric {
    category = "WorkloadManagement"


    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
