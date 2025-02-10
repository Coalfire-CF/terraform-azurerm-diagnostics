resource "azurerm_monitor_diagnostic_setting" "mssql_db_diag" {
  count                      = var.resource_type == "mssqldb" ? 1 : 0
  name                       = "mssql_db_securitylogs"
  target_resource_id         = var.resource_id
  log_analytics_workspace_id = var.diag_log_analytics_id

  enabled_log {
    category = "DevOpsOperationsAudit"
  }

  enabled_log {
    category = "SQLSecurityAuditEvents"
  }

  enabled_log {
    category = "SQLInsights"
  }

  enabled_log {
    category = "AutomaticTuning"
  }

  enabled_log {
    category = "QueryStoreRuntimeStatistics"
  }

  enabled_log {
    category = "QueryStoreWaitStatistics"
  }

  enabled_log {
    category = "Errors"
  }

  enabled_log {
    category = "DatabaseWaitStatistics"
  }

  enabled_log {
    category = "Timeouts"
  }

  enabled_log {
    category = "Blocks"
  }

  enabled_log {
    category = "Deadlocks"
  }

  metric {
    category = "Basic"
  }

  metric {
    category = "InstanceAndAppAdvanced"
    enabled  = false
  }

  metric {
    category = "WorkloadManagement"
    enabled  = false
  }
}

resource "azurerm_mssql_database_extended_auditing_policy" "mssql_db_audit_policy" {
  count                  = var.resource_type == "mssqldb" ? 1 : 0
  database_id            = var.resource_id
  log_monitoring_enabled = true
}
