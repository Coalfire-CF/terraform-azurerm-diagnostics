resource "azurerm_monitor_diagnostic_setting" "mssql_db_diag" {
  count                      = var.resource_type == "mssqldb" ? 1 : 0
  name                       = "mssql_db_securitylogs"
  target_resource_id         = var.resource_id
  log_analytics_workspace_id = var.diag_log_analytics_id

  enabled_log {
    category = "DevOpsOperationsAudit"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SQLSecurityAuditEvents"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "SQLInsights"

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  enabled_log {
    category = "AutomaticTuning"

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  enabled_log {
    category = "QueryStoreRuntimeStatistics"

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  enabled_log {
    category = "QueryStoreWaitStatistics"

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  enabled_log {
    category = "Errors"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "DatabaseWaitStatistics"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "Timeouts"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "Blocks"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  enabled_log {
    category = "Deadlocks"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "Basic"

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "InstanceAndAppAdvanced"
    enabled  = false

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "WorkloadManagement"
    enabled  = false

    retention_policy {
      days    = 365
      enabled = false
    }
  }
}

resource "azurerm_mssql_database_extended_auditing_policy" "mssql_db_audit_policy" {
  count                  = var.resource_type == "mssqldb" ? 1 : 0
  database_id            = var.resource_id
  log_monitoring_enabled = true
}