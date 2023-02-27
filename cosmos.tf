resource "azurerm_monitor_diagnostic_setting" "cdb_diag" {
  count                          = var.resource_type == "cdb" ? 1 : 0
  log_analytics_workspace_id     = var.diag_log_analytics_id
  log_analytics_destination_type = "AzureDiagnostics"
  name                           = "cosmos_securityLogs"
  target_resource_id             = var.resource_id

  enabled_log {
    category = "CassandraRequests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "ControlPlaneRequests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "DataPlaneRequests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "GremlinRequests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "MongoRequests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "PartitionKeyRUConsumption"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "PartitionKeyStatistics"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "QueryRuntimeStatistics"


    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "TableApiRequests"


    retention_policy {
      days    = 365
      enabled = false
    }
  }

  metric {
    category = "Requests"


    retention_policy {
      days    = 365
      enabled = true
    }
  }
}
