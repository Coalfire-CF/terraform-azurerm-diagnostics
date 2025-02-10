resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  count                      = var.resource_type == "sql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "sql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "AutomaticTuning"
  }
  enabled_log {
    category = "Blocks"
  }
  enabled_log {
    category = "DatabaseWaitStatistics"
  }
  enabled_log {
    category = "Deadlocks"
  }
  enabled_log {
    category = "DevOpsOperationsAudit"
  }
  enabled_log {
    category = "Errors"
  }
  enabled_log {
    category = "QueryStoreRuntimeStatistics"
  }
  enabled_log {
    category = "QueryStoreWaitStatistics"
  }
  enabled_log {
    category = "SQLInsights"
  }
  enabled_log {
    category = "SQLSecurityAuditEvents"
  }
  enabled_log {
    category = "Timeouts"
  }

  metric {
    category = "Basic"
  }
  metric {
    category = "InstanceAndAppAdvanced"
  }
  metric {
    category = "WorkloadManagement"
  }
}
