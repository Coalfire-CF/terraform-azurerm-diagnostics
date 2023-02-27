resource "azurerm_monitor_diagnostic_setting" "cdb_diag" {
  count                          = var.resource_type == "cdb" ? 1 : 0
  log_analytics_workspace_id     = var.diag_log_analytics_id
  log_analytics_destination_type = "AzureDiagnostics"
  name                           = "cosmos_securityLogs"
  target_resource_id             = var.resource_id

  enabled_log {
    category = "CassandraRequests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "ControlPlaneRequests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "DataPlaneRequests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "GremlinRequests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "MongoRequests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "PartitionKeyRUConsumption"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "PartitionKeyStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "QueryRuntimeStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "TableApiRequests"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "Requests"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
