resource "azurerm_monitor_diagnostic_setting" "cdb_diag" {
  count                          = var.resource_type == "cdb" ? 1 : 0
  log_analytics_workspace_id     = var.diag_log_analytics_id
  log_analytics_destination_type = "AzureDiagnostics"
  name                           = "cosmos_securityLogs"
  target_resource_id             = var.resource_id

  enabled_log {
    category = "CassandraRequests"
  }
  enabled_log {
    category = "ControlPlaneRequests"
  }
  enabled_log {
    category = "DataPlaneRequests"
  }
  enabled_log {
    category = "GremlinRequests"
  }
  enabled_log {
    category = "MongoRequests"
  }
  enabled_log {
    category = "PartitionKeyRUConsumption"
  }
  enabled_log {
    category = "PartitionKeyStatistics"
  }
  enabled_log {
    category = "QueryRuntimeStatistics"
  }
  enabled_log {
    category = "TableApiRequests"
  }

  metric {
    category = "Requests"
  }
}
